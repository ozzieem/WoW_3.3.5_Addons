--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]


--[[

This file manages the friendslist, but also the initialisation of the addon.

]]


-- default config settings
HOLOFRIENDS_SHOW_OFFLINE_FRIENDS = 1;
HOLOFRIENDS_TURNINFO = 0;

-- flags to skip HoloFriends_List_Update()
HoloFriends_EventFlags = {};
HoloFriends_EventFlags.Type = "FL";
HoloFriends_EventFlags.Quiet = false;
HoloFriends_EventFlags.Name = "";
HoloFriends_EventFlags.RunListUpdate = "";
HoloFriends_EventFlags.SetFriendNotes = false;
HoloFriends_EventFlags.SetNotifyOn = false;
HoloFriends_EventFlags.SetNotifyOff = false;
HoloFriends_EventFlags.IgnoreAddSysMsg = false;
HoloFriends_EventFlags.IgnoreRemoveSysMsg = false;
HoloFriends_EventFlags.ListMSGEvent = false;
HoloFriends_EventFlags.ListUPDATEEvent = false;

-- flag to reload friends list from server only once per list update
local HF_FriendListReload = false;

-- flag to update the list again
local HF_Requested_List_Update = false;
-- counter to limit the requested list update
local HF_List_Update_Recall_Counter = 0;

local HF_Max_Server_Friends = 100;
local HF_Displayed_Names = 18;
local HF_Friends_Remote_Add_Delay = 3;

local HF_IsGroupSelected = false;

local HF_SelectedEntry = -1;
local HF_LastClicked = -1;

local HF_list = {};
local HF_Moving_Friend = nil;
local HF_Target_Friend = nil;

local HF_List_Online_Template = "%s%s - |cffffffff%s|r";
local HF_List_Offline_Template = "|cff888888%s|r|cff888888%s|r - |cff666666%s|r";
local HF_Level_Template = "|cff999999"..string.gsub(FRIENDS_LEVEL_TEMPLATE, "%%1?%$?d", "%%1%$s").."|r";
local HF_Limit_Alert = string.gsub(HOLOFRIENDS_MSGFRIENDLIMITALERT, "%%d", HF_Max_Server_Friends);

-- Update background texture if window become visible
local HF_Window_Visible = false;

local HF_Class_Icon_Tcoords = {
	["WARRIOR"]     = {0, 0.25, 0, 0.25},
	["MAGE"]        = {0.25, 0.49609375, 0, 0.25},
	["ROGUE"]       = {0.49609375, 0.7421875, 0, 0.25},
	["DRUID"]       = {0.7421875, 0.98828125, 0, 0.25},
	["HUNTER"]      = {0, 0.25, 0.25, 0.5},
	["SHAMAN"]      = {0.25, 0.49609375, 0.25, 0.5},
	["PRIEST"]      = {0.49609375, 0.7421875, 0.25, 0.5},
	["WARLOCK"]     = {0.7421875, 0.98828125, 0.25, 0.5},
	["PALADIN"]     = {0, 0.25, 0.5, 0.75},
	["DEATHKNIGHT"] = {0.25, 0.5, 0.5, 0.75}
};


-- create and insert a new friend entry
local function HFF_InsertNewEntry(name, group, level, class, lc_class, area, note, connected, onstate, notify, realid, toon, realm, faction, client, bcast)
	if ( not name or name == "" ) then return nil; end

	local temp = {};
	temp.name = name;
	if ( not group or group == "" ) then
		temp.group = FRIENDS;
	else
		temp.group = group;
	end
	if ( level    and (level    ~= 0) )       then temp.level    = level;    end
	if ( class    and (class    ~= UNKNOWN) ) then temp.class    = class;    end
	if ( lc_class and (lc_class ~= UNKNOWN) ) then temp.lc_class = lc_class; end
	if ( area     and (area     ~= UNKNOWN) ) then temp.area     = area;     end
	if ( connected or realid )                then temp.onstate   = onstate;   end
	if ( connected )                          then temp.connected = connected; end
	if ( notify )                             then temp.notify    = notify;    end
	if ( realid )                             then temp.realid    = realid;    end
	if ( toon    and (toon ~= "") )           then temp.toon      = toon;      end
	if ( realm   and (realm ~= "") )          then temp.realm     = realm;     end
	if ( faction and (faction ~= -1) )        then temp.faction   = faction;   end
	if ( bcast   and (bcast ~= "") )          then temp.bcast     = bcast;     end
	if ( client )                             then temp.client    = client;    end

	-- get comment from ignore list if there is any
	local list = HoloIgnore_GetList();
	local wasIgnore = HoloFriendsLists_ContainsPlayer(list, name);
	local ignore_note;
	if ( wasIgnore ) then ignore_note = HoloFriendsLists_GetComment(list, wasIgnore); end

	-- set comment from ignore list if no note
	if ( note and (note ~= "") ) then temp.comment = note; end
	HoloFriendsFuncs_MergeComment(temp, ignore_note, 0, true, false);

	table.insert(HF_list, temp);
	table.sort(HF_list, HoloFriendsFuncs_CompareEntry);
end


local function HFF_GetClassFromLCClass(lc_class, noclass)
	if ( not lc_class ) then return noclass; end

	local realm = GetCVar("realmName");
	local charList = HoloFriendsFuncs_RealmGetOwnChars();
	for key, pname in pairs(charList) do
		local plist = HOLOFRIENDS_LIST[realm][pname];
		local maxi = table.getn(plist);
		for i = 1, maxi, 1 do
			local i_lc_class = plist[i].lc_class;
			local i_class    = plist[i].class;
			if ( i_class and i_lc_class and 
			     (i_class ~= UNKNOWN) and (i_lc_class ~= UNKNOWN) and
			     (i_lc_class == lc_class))
			then
				-- check if the class entry is valid
				if ( HF_Class_Icon_Tcoords[i_class] ) then
					return i_class;
				end
			end
		end
	end
	return noclass;
end


-- event handling

function HoloFriends_OnEvent(self, event, ...)
	if ( event == "VARIABLES_LOADED" ) then
		self:UnregisterEvent("VARIABLES_LOADED");
		self:RegisterEvent("BN_FRIEND_INFO_CHANGED");
		self:RegisterEvent("BN_CUSTOM_MESSAGE_CHANGED");
		self:RegisterEvent("FRIENDLIST_SHOW");
		self:RegisterEvent("FRIENDLIST_UPDATE");
		self:RegisterEvent("WHO_LIST_UPDATE");
		self:RegisterEvent("CHAT_MSG_SYSTEM");
		self:RegisterEvent("PLAYER_LOGOUT");
		HoloFriendsInit_OnLoadAll();
	end

	if ( event == "BN_FRIEND_INFO_CHANGED" ) then
		HoloFriends_chat("HoloFriends_List_Update on event BN_FRIEND_INFO_CHANGED", HF_DEBUG_OUTPUT);
		HoloFriends_List_Update();
	end

	if ( event == "BN_CUSTOM_MESSAGE_CHANGED" ) then
		local arg1 = ...;
		-- check, that its not our own msg that change
		if ( arg1 ) then
			HoloFriends_chat("HoloFriends_List_Update on event BN_FRIEND_INFO_CHANGED", HF_DEBUG_OUTPUT);
			HoloFriends_List_Update();
		end
	end

	if ( event == "FRIENDLIST_SHOW" ) then
		if ( HF_FriendListReload and (HoloFriends_EventFlags.RunListUpdate == "RunServer") ) then
			HF_FriendListReload = false;
			HoloFriends_EventFlags.RunListUpdate = "";
			HoloFriends_CheckServerList();
		end
	end

	if ( event == "FRIENDLIST_UPDATE" ) then
		if ( HoloFriends_EventFlags.SetFriendNotes or HoloFriends_EventFlags.SetNotifyOn or
		     HoloFriends_EventFlags.SetNotifyOff ) then
			HoloFriends_EventFlags.SetFriendNotes = false;

			if ( HoloFriends_EventFlags.RunListUpdate ~= "" ) then
				HoloFriends_EventFlags.ListUPDATEEvent = true;
			else
				HoloFriends_EventFlags.SetNotifyOn = false;
				HoloFriends_EventFlags.SetNotifyOff = false;
			end

			if ( HoloFriends_EventFlags.ListUPDATEEvent ) then HoloFriends_chat("HF ListUPDATEEvent", HF_DEBUG_OUTPUT); end

			if ( HoloFriends_EventFlags.ListMSGEvent and HoloFriends_EventFlags.ListUPDATEEvent ) then
				HoloFriendsFuncs_CheckRunListUpdate(HoloFriends_EventFlags);
			end
		else
			if ( HF_FriendListReload and (HoloFriends_EventFlags.RunListUpdate == "RunServer") ) then
				HF_FriendListReload = false;
				HoloFriends_EventFlags.RunListUpdate = "";
				HoloFriends_CheckServerList();
			else
				HoloFriends_chat("HoloFriends_List_Update on event FRIENDLIST_UPDATE", HF_DEBUG_OUTPUT);
				HoloFriends_List_Update();
			end
		end
	end

	if ( event == "WHO_LIST_UPDATE" ) then
		HoloFriendsScan_CheckWhoListResult(HF_list);
	end

	if ( event == "CHAT_MSG_SYSTEM" ) then
		local msg = ...;
		if ( string.match(msg, HoloFriends_WHO_NUM_RESULTS) ) then
			HoloFriendsScan_CheckWhoListResult(HF_list);
		end
	end

	if ( event == "PLAYER_LOGOUT" ) then
		local realm = GetCVar("realmName");
		local name = UnitName("player");
		local entry = HOLOFRIENDS_MYCHARS[realm][name];
		local lc_class, class = UnitClass("player");

		entry.class    = class;
		entry.lc_class = lc_class;
		entry.level    = UnitLevel("player");
		entry.area     = GetZoneText();
		entry.lastSeen = date("%Y-%m-%d %H:%M %w");
	end
end


function HoloFriends_OnUpdate()
	if( HF_Moving_Friend ) then
		local slot;
		HF_Target_Friend = nil;
		for index = 1, HF_Displayed_Names, 1 do
			slot = getglobal("HoloFriendsNameButton"..index);
			if ( MouseIsOver(slot) ) then
				slot:LockHighlight();
				HF_Target_Friend = slot;
				local pos = HoloFriendsScrollFrame:GetVerticalScroll();
				if ( index == 1 and pos >= FRIENDS_FRAME_IGNORE_HEIGHT ) then
					HoloFriendsScrollFrameScrollBar:SetValue(pos - FRIENDS_FRAME_IGNORE_HEIGHT);
				end
				if ( index == HF_Displayed_Names and
				     (pos < FRIENDS_FRAME_IGNORE_HEIGHT*(table.getn(HF_list) - HF_Displayed_Names)) )
				then
					HoloFriendsScrollFrameScrollBar:SetValue(pos + FRIENDS_FRAME_IGNORE_HEIGHT);
				end
			else
				slot:UnlockHighlight();
			end
		end
		HF_Moving_Friend:UnlockHighlight();
	end

	-- set background texture (OnShow works not always)
	if ( not HF_Window_Visible ) then
		HF_Window_Visible = true;
		FriendsFrameTopLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopLeft");
		FriendsFrameTopRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopRight");
		FriendsFrameBottomLeft:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-BotLeft");
		FriendsFrameBottomRight:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-BotRight");

		HoloFriends_chat("HoloFriends_List_Update from HoloIgnore_OnUpdate", HF_DEBUG_OUTPUT);
	end
end


function HoloFriends_OnHide()
	HoloFriends_DeselectEntry();

	-- mark visibility of friends window
	HF_Window_Visible = false;
end


-- add a friend
function HoloFriends_AddFriend(player, note)
	local name;
	if ( player and player ~= "" ) then
		name = player;
	elseif ( UnitIsPlayer("target") and UnitCanCooperate("player", "target") ) then
		name = UnitName("target");
	else
		StaticPopup_Show("ADD_FRIEND");
		return;
	end

	-- check if there is a note behind the name
	local msg = note;
	if ( not msg or msg == "" ) then
		local pos = string.find(name, " ");
		if ( pos ) then
			msg = string.sub(name, pos + 1);
			name = string.sub(name, 1, pos - 1)
		end
	end

	if ( not HoloFriendsLists_ContainsPlayer(HF_list, name) ) then
		if ( string.find(name, "@") ) then
			HoloFriends_EventFlags.Name = name;
			HoloFriends_EventFlags.RunListUpdate = "";
			HoloFriends_EventFlags.Quiet = false;
			HoloFriendsFuncs_AddToServerList(HoloFriends_EventFlags, msg);
			return;
		else
			HFF_InsertNewEntry(name, nil, nil, nil, nil, nil, msg);
			if ( (GetNumFriends() < HF_Max_Server_Friends) and (name ~= UnitName("player")) ) then
				local index = HoloFriendsLists_ContainsPlayer(HF_list, name);
				HoloFriendsLists_SetNotify(HF_list, index, HF_ONLINE, HF_UNQUIET, "RunUpdate", HoloFriends_EventFlags);
			else
				local msg = format(HOLOFRIENDS_MSGFRIENDONLINEDISABLED, name);
				HoloFriendsFuncs_SystemMessage(msg);
				HoloFriends_chat("HoloFriends_List_Update from HoloFriends_AddFriend", HF_DEBUG_OUTPUT);
				HoloFriends_List_Update();
			end
		end
	end

	-- update share window if open
	if ( HoloFriends_ShareFrame:IsVisible() ) then
		HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
	end
end


-- remove the selected friend
function HoloFriends_RemoveFriend()
	if ( HF_IsGroupSelected or not HoloFriends_IsSelectedEntryValid() ) then return; end

	HoloFriendsLists_SetNotify(HF_list, HF_SelectedEntry, HF_OFFLINE, HF_UNQUIET, "RunUpdate", HoloFriends_EventFlags);

	-- remove from our list
	table.remove(HF_list, HF_SelectedEntry);
	HoloFriends_DeselectEntry();

	-- update share window if open
	if ( HoloFriends_ShareFrame:IsVisible() ) then
		HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
	end
end


-- BEGIN OF GETTERS

-- returns the id of the last clicked entry
function HoloFriends_GetLastClickedIndex()
	return HF_LastClicked;
end


-- returns the selected entry
function HoloFriends_GetSelectedEntry()
	return HF_SelectedEntry;
end


-- returns true if the selected entry is valid
function HoloFriends_IsSelectedEntryValid()
	if ( not HoloFriends_Loaded ) then return false; end

	return HoloFriendsLists_IsListIndexValid(HF_list, HF_SelectedEntry);
end


function HoloFriends_DeselectEntry()
	HF_SelectedEntry = -1;
end


function HoloFriends_GetList()
	if ( not HoloFriends_Loaded ) then
		local list = {};
		return list;
	end

	return HF_list;
end


function HoloFriends_LoadList()
	-- get the correct list
	HF_list = HoloFriendsFuncs_LoadList(HOLOFRIENDS_LIST, UnitName("player"), HF_HFLIST);

	-- check if group "friends" is in our list
	if ( not HoloFriendsLists_ContainsGroup(HF_list, FRIENDS) ) then
		HFF_InsertNewEntry("1", FRIENDS);
	end

	-- set actual date in seconds to the friends group (indicator of last use)
	local idx = HoloFriendsLists_ContainsGroup(HF_list, FRIENDS);
	HF_list[idx].lastuse = time();

	-- check class in list (changed list entry with version 0.4)
	local maxi = table.getn(HF_list);
	for index = 1, maxi do
		local lc_class = HF_list[index].lc_class;
		local    class = HF_list[index].class;
		if ( class and not lc_class ) then
			HF_list[index].lc_class = class;
			HF_list[index].class = nil;
		end
	end
end

-- END OF GETTER


-- BEGIN OF ITEM TOOLTIP

function HoloFriends_NameButton_SetTooltip(self)
	local index = self:GetID();

	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
	local realid = HoloFriendsLists_IsRealID(HF_list, index);

	local name = HoloFriendsLists_GetName(HF_list, index, HF_DISPLAY);
	GameTooltip:SetText(name, 1.0, 1.0, 1.0);

	if ( realid ) then
		local tname = HoloFriendsLists_GetToon(HF_list, index, true);
		if ( tname ) then GameTooltip:AddLine(tname, 1.0, 1.0, 1.0); end
	end

	if ( not HoloFriendsLists_IsGroup(HF_list, index) ) then
		local level = HoloFriendsLists_GetLevel(HF_list, index);
		local lc_class = HoloFriendsLists_GetLCClass(HF_list, index);
		local info = format(TEXT(HF_Level_Template), level, lc_class);
		GameTooltip:AddLine(info, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0);
	end

	local note = HoloFriendsLists_GetComment(HF_list, index);
	if ( note ~= "" ) then
		GameTooltip:AddLine(note, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
	end

	if ( not HoloFriendsLists_IsGroup(HF_list, index) ) then
		local bcast = HoloFriendsLists_GetBCast(HF_list, index);
		if ( bcast ~= "" ) then
			GameTooltip:AddLine(HOLOFRIENDS_TOOLTIPBROADCAST, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
			GameTooltip:AddLine(bcast, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
		end

		local lastSeen = HoloFriendsLists_GetLastSeen(HF_list, index);
		if ( lastSeen == UNKNOWN ) then
			lastSeen = HOLOFRIENDS_TOOLTIPNEVERSEEN;
		else
			lastSeen = HoloFriendsFuncs_GetDateString(lastSeen, HOLOFRIENDS_OPTIONS.TTDateFormat);
			lastSeen = HOLOFRIENDS_TOOLTIPLASTSEEN..": "..lastSeen
		end
		GameTooltip:AddLine(lastSeen, 1.0, 1.0, 1.0, 0);

		local notify = HoloFriendsLists_GetNotify(HF_list, index);
		if ( realid and notify ) then
			local lastOnline = HoloFriendsLists_GetLastOnline(HF_list, index);
			if ( lastOnline == 0 ) then
				lastOnline = FRIENDS_LIST_ONLINE;
			else
				lastOnline = string.format(BNET_LAST_ONLINE_TIME, FriendsFrame_GetLastOnline(lastOnline));
			end
			GameTooltip:AddLine(lastOnline, 1.0, 1.0, 1.0, 0);
		end

		local area = HoloFriendsLists_GetArea(HF_list, index);
		if ( area and (area ~= "") ) then
			GameTooltip:AddLine(area, 1.0, 1.0, 1.0, 0);
		end
	end
	GameTooltip:Show();
end

-- END OF ITEM TOOLTIP


-- START OF GUI FUNCTIONS

-- drag and drop function
function HoloFriends_NameButton_OnDragStart(self)
	local index = self:GetID();

	local maxi = table.getn(HF_list);
	if ( index > maxi ) then return; end

	if ( HoloFriendsLists_IsGroup(HF_list, index) ) then return; end
	HF_list[index].remove = nil;

	local cursorX, cursorY = GetCursorPosition();
	cursorX = cursorX / self:GetScale();
	cursorY = cursorY / self:GetScale();

	HF_Moving_Friend = HoloFriendsNameButtonDrag;
	HF_Moving_Friend:SetID(index);
	HoloFriendsNameButtonDragName:SetText(getglobal(self:GetName().."Name"):GetText());
	HF_Moving_Friend:ClearAllPoints();
	HF_Moving_Friend:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", cursorX+5, cursorY);
	HF_Moving_Friend:Show();
	HF_Moving_Friend:StartMoving();
end


-- drag and drop function
function HoloFriends_NameButton_OnDragStop()
	if ( not HF_Moving_Friend ) then return; end

	HF_Moving_Friend:StopMovingOrSizing();
	HF_Moving_Friend:Hide();
	HF_Moving_Friend:ClearAllPoints();

	if ( not HF_Target_Friend ) then return; end

	local targetIndex = HF_Target_Friend:GetID();
	if ( targetIndex > table.getn(HF_list) ) then
		targetIndex = table.getn(HF_list);
	end
	HF_list[HF_Moving_Friend:GetID()].group = HF_list[targetIndex].group;
	HF_Moving_Friend = nil;
	HoloFriends_chat("HoloFriends_List_Update from HoloFriends_NameButton_OnDragStop", HF_DEBUG_OUTPUT);
	HoloFriends_List_Update();

	-- update share window if open
	if ( HoloFriends_ShareFrame:IsVisible() ) then
		HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
	end
end


-- if we clicked on a header, toggle state and select header, otherwise just select entry
function HoloFriends_NameButton_OnClick(self, button)
	HF_LastClicked = self:GetID();
	if ( not HF_LastClicked ) then return; end

	local maxi = table.getn(HF_list);
	if ( HF_LastClicked > maxi ) then return; end

	if ( button == "LeftButton" ) then
		HF_SelectedEntry = HF_LastClicked;
		-- group selected
		if ( HF_list[HF_SelectedEntry].name == "0" ) then
			HF_IsGroupSelected = true;
			HF_list[HF_SelectedEntry].name = "1";
		elseif ( HF_list[HF_SelectedEntry].name == "1" ) then
			HF_IsGroupSelected = true;
			HF_list[HF_SelectedEntry].name = "0";
		else
			-- player selected
			HF_IsGroupSelected = false;
			if ( not HoloFriendsLists_GetNotify(HF_list, HF_SelectedEntry) ) then
				local name = HoloFriendsLists_GetName(HF_list, HF_SelectedEntry);
				HoloFriendsFuncs_WhoCheckPlayer(name);
			end
		end
		HoloFriends_chat("HoloFriends_List_Update from HoloFriends_NameButton_OnClick", HF_DEBUG_OUTPUT);
		HoloFriends_List_Update();
	elseif ( button == "MiddleButton" ) then
		if ( HF_SelectedEntry == HF_LastClicked ) then
			HoloFriends_DeselectEntry();
			HF_IsGroupSelected = false;
		end
		if ( not HoloFriendsLists_GetNotify(HF_list, HF_LastClicked) ) then
			HF_list[HF_LastClicked].connected = nil;
		end
		HoloFriends_List_Update();
	else
		HoloFriends_ShowListDropdown(HF_LastClicked);
	end
end


function HoloFriends_CheckBox_OnClick(self)
	local index = self:GetParent():GetID();

	local maxi = table.getn(HF_list);
	if ( index > maxi ) then return; end

	-- RealID entries are always online checked, don't change
	if ( HF_list[index].realid ) then return; end

	if ( self:GetChecked() and GetNumFriends() == HF_Max_Server_Friends ) then
		self:SetChecked(nil);
		HoloFriendsFuncs_SystemMessage(HF_Limit_Alert);
	else
		if ( self:GetChecked() ) then
			PlaySound("igMainMenuOptionCheckBoxOff");
		else
			PlaySound("igMainMenuOptionCheckBoxOn");
		end
		HF_list[index].remove = nil;
		HoloFriendsLists_SetNotify(HF_list, index, self:GetChecked(), HF_UNQUIET, "RunUpdate", HoloFriends_EventFlags);
	end
end


-- start friends list update and check that it runs only once at time
function HoloFriends_List_Update()
	if ( not HoloFriends_Loaded ) then return; end

	if ( (HoloFriends_ListUpdateStartTime ~= HoloFriends_ListUpdateRefTime) and
	     (difftime(time(), HoloFriends_ListUpdateStartTime) < HoloFriends_ListUpdateMaxSec) ) then
		HF_Requested_List_Update = true;
		return;
	end

	HoloFriends_chat("HoloFriends_List_Update start", HF_DEBUG_OUTPUT);

	-- reload the server friends list only once
	HF_FriendListReload = true;

	-- if faction wide friends list is used, the server list need to be cleared first, to add local entries (friends list limit)
	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOFRIENDS_LIST, UnitName("player"));
	if ( NotFaction ) then
		HoloFriends_CheckLocalList();
	else
		HoloFriends_CheckServerList();
	end
end


-- check the local list
function HoloFriends_CheckLocalList()
	HoloFriends_chat("HoloFriends_CheckLocalList start", HF_DEBUG_OUTPUT);

	HoloFriends_ListUpdateStartTime = time();

	-- check if group "friends" is in our list
	if ( not HoloFriendsLists_ContainsGroup(HF_list, FRIENDS) ) then
		HFF_InsertNewEntry("1", FRIENDS);
	end

	local index = next(HF_list);
	while ( index and HF_list[index] ) do
		if ( not HF_list[index].name ) then
			table.remove(HF_list, index);
		else
			if ( not HF_list[index].group ) then
				HF_list[index].group = FRIENDS;
			end

			-- set friends online, which were added by sharing
			if ( HF_list[index].imported ) then
				HF_list[index].imported = nil;
				if ( HF_list[index].realid ) then
					-- RealID friends are only added to the friends list of a char if they are online
					HF_list[index].notify = nil;
				else
					local notify = (GetNumFriends() < HF_Max_Server_Friends);
					HoloFriendsLists_SetNotify(HF_list, index, notify, HF_UNQUIET, "RunLocal", HoloFriends_EventFlags);
					return;
				end
			end

			-- set note online, which were created by sharing
			if ( HF_list[index].setnote ) then
				HF_list[index].setnote = nil;
				local comment = HF_list[index].comment;
				HoloFriendsLists_SetComment(HF_list, index, comment, HF_HFLIST, HF_SHARE);
			end

			-- remove wrong level entries
			local level = HF_list[index].level;
			if ( level and (level == UNKNOWN or level == 0 or level == "") ) then
				HF_list[index].level = nil;
			end

			-- remove empty and UNKNOWN fields (some time area is an empty string and one can share old data)
			if ( HF_list[index].area == "" )          then HF_list[index].area     = nil; end
			if ( HF_list[index].area == UNKNOWN )     then HF_list[index].area     = nil; end
			if ( HF_list[index].lc_class == "" )      then HF_list[index].lc_class = nil; end
			if ( HF_list[index].lc_class == UNKNOWN ) then HF_list[index].lc_class = nil; end
			if ( HF_list[index].class == "" )         then HF_list[index].class    = nil; end
			if ( HF_list[index].class == UNKNOWN )    then HF_list[index].class    = nil; end

			-- check if the class entry is valid
			if ( HF_list[index].class ) then
				if ( not HF_Class_Icon_Tcoords[HF_list[index].class] ) then
					HF_list[index].class = nil;
					HF_list[index].lc_class = nil;
				end
			end

			-- try to set class from lc_class
			if ( HF_list[index].lc_class and not HF_list[index].class ) then
				HF_list[index].class = HFF_GetClassFromLCClass(HF_list[index].lc_class);
			end

			-- remove list entry of temporary added friend
			local tmpadd = HF_list[index].tmpadd;
			local tmpremove = false;
			if ( tmpadd and not HF_list[index].notify ) then
				if ( time() - tmpadd > HF_Friends_Remote_Add_Delay ) then tmpremove = true; end
			end
			if ( tmpremove ) then
				table.remove(HF_list, index);
			else
				index = next(HF_list, index);
			end
		end
	end

	-- set actual date in seconds to the friends group (indicator of last use)
	local index = HoloFriendsLists_ContainsGroup(HF_list, FRIENDS)
	HF_list[index].lastuse = time();

	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOFRIENDS_LIST, UnitName("player"));
	if ( NotFaction ) then
		HoloFriends_CheckServerList();
	else
		HoloFriends_UpdateFriendsList();
	end
end


-- check if all entries in server friendslist are in our list
function HoloFriends_CheckServerList()
	HoloFriends_chat("HoloFriends_CheckServerList start", HF_DEBUG_OUTPUT);

	HoloFriends_ListUpdateStartTime = time();

	-- reload friends list from server
	if ( HF_FriendListReload ) then
		HoloFriends_EventFlags.RunListUpdate = "RunServer";
		HoloFriends_chat("HoloFriends_CheckServerList reload server list", HF_DEBUG_OUTPUT);
		ShowFriends(); -- reload friends list from server
		return;
	end

	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOFRIENDS_LIST, UnitName("player"));
	local numNotifyFriends = GetNumFriends();
	local numRealIDFriends = BNGetNumFriends();
	local maxi;

	-- init the notify flag of all online friends (notify = 3 is friend check in progress)
	maxi = table.getn(HF_list);
	for index = 1, maxi do
		if ( HF_list[index].notify and (HF_list[index].notify ~= 3) ) then
			if ( not HF_list[index].realid ) then
				HF_list[index].notify = 2;
			else
				HF_list[index].notify = nil;
			end
		end
	end

	-- init variables for data we get from server
	local name, tname, client, rname, faction, level, lc_class, area, connected, realid;
	local onstate; -- AFK or DND
	local note; -- Friends note
	local bcast; -- RealFriends broadcast message

	-- check if all friends are in our list (maybe ShowFriends() needs to be executed to get the actual list from server)
	for idx = 1, numNotifyFriends + numRealIDFriends do
		local index = idx;
		if ( idx > numRealIDFriends ) then index = idx - numRealIDFriends; end
		local class = UNKNOWN;
		if ( idx <= numRealIDFriends ) then
			local givenName, surname, isAFK, isDND, tID, lastOn;
			_, givenName, surname, tname, tID, client, connected, lastOn, isAFK, isDND, bcast, note = BNGetFriendInfo(index);
			if ( givenName and surname ) then
				name = string.format(BATTLENET_NAME_FORMAT, givenName, surname);
			else name = nil; end
			if     ( isAFK ) then onstate = "<AFK>";
			elseif ( isDND ) then onstate = "<DND>";
			else                  onstate = nil; end
			if ( not note ) then note = ""; end
			if ( connected ) then
				_, _, _, rname, faction, _, lc_class, _, area, level = BNGetToonInfo(tID);
				if ( faction and (faction ~= 0) and (faction ~= 1) ) then faction = -1; end
			else
				onstate = lastOn;
			end
			realid = true;
		else
			tname, client, rname, faction, lastOn, bcast = nil, nil, nil, nil, nil, nil;
			realid = false;
			name, level, lc_class, area, connected, onstate, note = GetFriendInfo(index);
			if ( onstate and (onstate == "") ) then onstate = nil; end
			if ( not note ) then note = ""; end
		end

		if ( (connected == 1) or (connected == true) ) then connected = true; else connected = nil; end

		-- reset who-timer independet of message hook
		if ( GetTime() > (HoloFriends_interceptWhoResults + HoloFriends_whoCheckInterval) ) then
			HoloFriends_interceptWhoResults = 0;
		end

		-- check if player is already in our list or need to be added
		local playerIndex = HoloFriendsLists_ContainsPlayer(HF_list, name);
		if ( playerIndex ) then
			if ( not (realid and connected) ) then class = HF_list[playerIndex].class; end
			if ( not class ) then class = UNKNOWN; end

			if ( not connected ) then lc_class = HF_list[playerIndex].lc_class; end
			if ( not lc_class ) then lc_class = UNKNOWN; end

			-- look for lc_class in list to set class
			if ( (lc_class ~= UNKNOWN) and (class == UNKNOWN) ) then
				class = HFF_GetClassFromLCClass(lc_class, UNKNOWN);
			end

			-- setup a who request to get the class if still unknown
			if ( connected and (class == UNKNOWN) ) then
				HoloFriendsFuncs_WhoCheckPlayer(name);
			end

			if ( not area ) then area = UNKNOWN; end

			if ( class    ~= UNKNOWN )       then HF_list[playerIndex].class    = class;    end
			if ( lc_class ~= UNKNOWN )       then HF_list[playerIndex].lc_class = lc_class; end
			if ( area     ~= UNKNOWN )       then HF_list[playerIndex].area     = area;     end
			if ( level   and (level ~= 0) )  then HF_list[playerIndex].level    = level;    end
			if ( tname   and (tname ~= "") ) then HF_list[playerIndex].toon     = tname;    end
			if ( rname   and (rname ~= "") ) then HF_list[playerIndex].realm    = rname;    end
			if ( faction )                   then HF_list[playerIndex].faction  = faction;  end
			if ( bcast   and (bcast ~= "") ) then HF_list[playerIndex].bcast    = bcast;
							 else HF_list[playerIndex].bcast    = nil;      end
			if ( client )                    then HF_list[playerIndex].client   = client;   end
			if ( realid )                    then HF_list[playerIndex].realid   = realid;   end

			HF_list[playerIndex].connected = connected;
			if ( connected ) then
				HF_list[playerIndex].onstate = onstate;
				HF_list[playerIndex].lastSeen = date("%Y-%m-%d %H:%M %w");
			elseif ( realid ) then
				HF_list[playerIndex].onstate = onstate;
			else
				HF_list[playerIndex].onstate = nil;
			end

			if ( NotFaction ) then
				if ( HF_list[playerIndex].notify and (HF_list[playerIndex].notify == 3) ) then
					HoloFriendsLists_SetNotify(HF_list, playerIndex, HF_OFFLINE, HF_QUIET, "RunServer", HoloFriends_EventFlags);
					return;
				else
					HF_list[playerIndex].notify = HF_ONLINE;
				end

				-- remove player scan mark and add friend permanent
				local tmpadd = HF_list[playerIndex].tmpadd;
				if ( tmpadd ) then
					if ( time() - tmpadd > HF_Friends_Remote_Add_Delay ) then
						HF_list[playerIndex].tmpadd = nil;
					end
				end
			elseif ( not HF_list[playerIndex].notify and not realid ) then
				HoloFriendsLists_SetNotify(HF_list, playerIndex, HF_OFFLINE, HF_UNQUIET, "RunServer", HoloFriends_EventFlags);
				return;
			else
				HF_list[playerIndex].notify = HF_ONLINE; -- to change old list style entries from "1" to "true"
			end

			-- check and sync online note and list comment
			HoloFriendsFuncs_CheckComment(playerIndex, index, note);
		elseif ( name ) then
			if ( realid ) then
				-- lock for lc_class in list to set class
				if ( lc_class and (lc_class ~= UNKNOWN) and (class == UNKNOWN) ) then
					class = HFF_GetClassFromLCClass(lc_class, UNKNOWN);
				end

				HFF_InsertNewEntry(name, nil, level, class, lc_class, area, note, connected, onstate, HF_ONLINE, realid, tname, rname, faction, client, bcast);
			elseif ( NotFaction ) then
				-- lock for lc_class in list to set class
				if ( lc_class and (lc_class ~= UNKNOWN) and (class == UNKNOWN) ) then
					class = HFF_GetClassFromLCClass(lc_class, UNKNOWN);
				end

				HFF_InsertNewEntry(name, nil, level, class, lc_class, area, note, connected, onstate, HF_ONLINE);

				-- setup a who request to get the class if still unknown
				if ( connected and (class == UNKNOWN) ) then
					HoloFriendsFuncs_WhoCheckPlayer(name);
				end

				-- temporary add timestamp in seconds
				-- to allow player scan by adding und removing from friends list by other addons
				playerIndex = HoloFriendsLists_ContainsPlayer(HF_list, name);
				if ( playerIndex ) then HF_list[playerIndex].tmpadd = time(); end
			else
				-- not added by HoloFriends, so remove entry from server list
				HoloFriends_EventFlags.Name = name;
				HoloFriends_EventFlags.RunListUpdate = "RunServer";
				HoloFriends_EventFlags.Quiet = HF_UNQUIET;
				local done = HoloFriendsFuncs_RemoveFromServerList(HoloFriends_EventFlags);
				if ( done ) then return; end
			end
		end
	end

	-- check if all online friends are still there
	maxi = table.getn(HF_list);
	for index = 1, maxi do
		if ( HF_list[index].notify and (HF_list[index].notify == 3) ) then
			local msg = format(TEXT(HOLOFRIENDS_MSGFRIENDMISSINGONLINE), HF_list[index].name);
			HoloFriendsFuncs_SystemMessage(msg);
			HF_list[index].notify = HF_OFFLINE;
		end
		if ( HF_list[index].notify and (HF_list[index].notify == 2) ) then
			local silent = false;
			if ( NotFaction ) then silent = true; end
			HoloFriendsLists_SetNotify(HF_list, index, 3, silent, "RunServer", HoloFriends_EventFlags);
			return;
		end
	end

	-- sort the entries
	table.sort(HF_list, HoloFriendsFuncs_CompareEntry);

	if ( NotFaction ) then
		HoloFriends_UpdateFriendsList();
	else
		HoloFriends_CheckLocalList();
	end
end


-- update scrollframe & buttons
function HoloFriends_UpdateFriendsList()
	HoloFriends_ListUpdateStartTime = time();
	local maxi = table.getn(HF_list);

	if ( HoloFriends_ShowOnlineChat ) then
		HoloFriends_ShowOnlineChat = false;
		HoloFriends_chat(HOLOFRIENDS_INITSHOWONLINEATLOGIN, 0.0, 1.0, 1.0);
		for index = 1, maxi do
			if ( HF_list[index].connected ) then
				local name = HoloFriendsLists_GetName(HF_list, index, HF_DISPLAY);
				local level = HoloFriendsLists_GetLevel(HF_list, index);
				local lc_class = HoloFriendsLists_GetLCClass(HF_list, index);
				local msg = name.." "..format(TEXT(HF_Level_Template), level, lc_class);
				HoloFriends_chat(msg, 0.0, 1.0, 1.0);
			end
		end
	end

	-- run only, if window is visible
	if ( not HoloFriendsFrame:IsVisible() ) then
		HoloFriends_ListUpdateStartTime = HoloFriends_ListUpdateRefTime;

		if ( HF_Requested_List_Update ) then
			HF_Requested_List_Update = false;
			HF_List_Update_Recall_Counter = HF_List_Update_Recall_Counter + 1;
			-- limit recals to 8 to save stack-space
			if ( HF_List_Update_Recall_Counter < 9 ) then HoloFriends_List_Update(); end
		end
		HF_List_Update_Recall_Counter = 0;
		return;
	end

	HoloFriends_chat("HoloFriends_UpdateFriendsList start", HF_DEBUG_OUTPUT);

	-- get some counter
	local notifyCounter = GetNumFriends() + BNGetNumFriends();
	local onlineCounter = 0;
	local sumCounter = 0;
	for index = 1, maxi do
		if ( (HF_list[index].name ~= "0") and (HF_list[index].name ~= "1") ) then
			sumCounter = sumCounter + 1;
			if ( HF_list[index].connected ) then
				onlineCounter = onlineCounter + 1;
			end
		end
	end

	-- get visible index table
	local ShownIndexTable = {};
	ShownIndexTable = HoloFriendsFuncs_ShownListTab(HF_list, HF_Displayed_Names, HF_HFLIST);
	-- get counter of visible elements from index table
	local visibleCnt = HoloFriendsFuncs_GetNumVisibleListElements(ShownIndexTable, maxi, HF_Displayed_Names);

	-- enable/disable remove-buttons
	if ( HoloFriends_IsSelectedEntryValid() ) then
		if ( HoloFriendsLists_IsGroup(HF_list, HF_SelectedEntry) ) then
			if ( HoloFriendsLists_GetGroup(HF_list, HF_SelectedEntry) ~= FRIENDS ) then
				HoloFriendsRemoveGroupButton:Enable();
				HoloFriendsRemoveFriendButton:Disable();
			else
				HoloFriendsRemoveGroupButton:Disable();
				HoloFriendsRemoveFriendButton:Disable();
			end
		else
			HoloFriendsRemoveGroupButton:Disable();
			HoloFriendsRemoveFriendButton:Enable();
		end
	else
		HoloFriendsRemoveGroupButton:Disable();
		HoloFriendsRemoveFriendButton:Disable();
	end

	-- ScrollFrame stuff
	local ScrollBarSize = 0;
	if ( visibleCnt > HF_Displayed_Names ) then ScrollBarSize = 20; end
	FauxScrollFrame_Update(HoloFriendsScrollFrame, visibleCnt, HF_Displayed_Names, 16);
	-- scrollframe offset
	local offset = FauxScrollFrame_GetOffset(HoloFriendsScrollFrame);

	-- button and textures
	local button, buttonText, buttonTextRemove, buttonIcon, buttonCheckBox;

	local entry = {};
	local line = 1;

	-- set values / textures for all buttons
	while ( line <= HF_Displayed_Names ) do
		local index = ShownIndexTable[line + offset];

		entry = HF_list[index];

		button = getglobal("HoloFriendsNameButton"..line);
		button:SetID(index);

		if ( line > visibleCnt ) then button:Hide();
					 else button:Show(); end

		if ( entry ) then
			if ( index == HF_SelectedEntry ) then button:LockHighlight();
							 else button:UnlockHighlight(); end

			-- get textfield, icon, and checkbox
			buttonText = getglobal("HoloFriendsNameButton"..line.."Name");
			buttonTextRemove = getglobal("HoloFriendsNameButton"..line.."NameRemove");
			buttonIcon = getglobal("HoloFriendsNameButton"..line.."ClassIcon");
			buttonCheckBox = getglobal("HoloFriendsNameButton"..line.."Server");

			-- group entry ?
			if ( entry.name == "1" or entry.name == "0" ) then
				local name = HoloFriendsLists_GetName(HF_list, index, HF_DISPLAY);
				buttonText:SetText(name);
				buttonTextRemove:SetText("");
				buttonText:ClearAllPoints();
				buttonText:SetPoint("TOPLEFT", "HoloFriendsNameButton"..line, "TOPLEFT", 20, 0);
				buttonIcon:Hide();
				buttonCheckBox:Hide();

				if ( entry.name == "1" ) then
					button:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
				else
					button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
				end
			else -- no, we got a player
				local textwidth;
				local showColor = HOLOFRIENDS_OPTIONS.ShowClassColor;
				local showToon  = HOLOFRIENDS_OPTIONS.BNShowCharName;
				local name = HoloFriendsLists_GetName(HF_list, index, HF_DISPLAY, showColor, showToon);
				local level = "";
				if ( HOLOFRIENDS_OPTIONS.ShowLevel ) then
					level = " ("..HoloFriendsLists_GetLevel(HF_list, index)..")";
				end
				local area = HoloFriendsLists_GetArea(HF_list, index, true);
				local note = HoloFriendsLists_GetComment(HF_list, index);
				local info;
				if ( HOLOFRIENDS_TURNINFO == 0 ) then info = area;
								 else info = note; end
				if ( entry.remove ) then
					buttonText:SetText(name);
					textwidth = buttonText:GetStringWidth();
				end
				if ( entry.connected ) then
					buttonText:SetText(format(TEXT(HF_List_Online_Template), name, level, info));
				else
					buttonText:SetText(format(TEXT(HF_List_Offline_Template), name, level, info));
				end
				if ( entry.remove ) then
					buttonTextRemove:SetText("|cffffffff_____________________________________|r");
					buttonTextRemove:SetWidth(textwidth + 10);
				else
					buttonTextRemove:SetText("");
				end
				button:SetNormalTexture("");
				buttonCheckBox:Show();
				buttonCheckBox:SetChecked(entry.notify);
				local class = entry.class;
				if ( HOLOFRIENDS_OPTIONS.ShowClassIcons ) then
					local coords;
					if ( class and (class ~= UNKNOWN) ) then
						coords = HF_Class_Icon_Tcoords[class];
					end
					if ( coords ) then
						buttonIcon:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
					else
						buttonIcon:SetTexCoord(0.5, 0.75, 0.5, 0.75);
					end
					buttonIcon:Show();
					buttonText:ClearAllPoints();
					buttonText:SetPoint("LEFT", buttonIcon:GetName(), "RIGHT", 3, 0);
				else
					buttonText:ClearAllPoints();
					buttonText:SetPoint("TOPLEFT", "HoloFriendsNameButton"..line, "TOPLEFT", 36, 0);
					buttonIcon:Hide();
				end
			end

			-- Set the button text with
			button:SetWidth(315 - ScrollBarSize);
			if ( buttonIcon:IsShown() ) then buttonText:SetWidth(260 - ScrollBarSize);
						    else buttonText:SetWidth(276 - ScrollBarSize); end
		end

		line = line + 1;
	end

	HoloFriendsOnline:SetText(format("%s %d / %d (%d)", HOLOFRIENDS_WINDOWMAINNUMBERONLINE, onlineCounter, sumCounter, notifyCounter));

	HoloFriends_ListUpdateStartTime = HoloFriends_ListUpdateRefTime;

	HoloFriends_chat("HoloFriends_UpdateFriendsList end", HF_DEBUG_OUTPUT);

	if ( HF_Requested_List_Update ) then
		HF_Requested_List_Update = false;
		HF_List_Update_Recall_Counter = HF_List_Update_Recall_Counter + 1;
		-- limit recals to 8 to save stack-space
		if ( HF_List_Update_Recall_Counter < 9 ) then HoloFriends_List_Update(); end
	end
	HF_List_Update_Recall_Counter = 0;
end

-- END OF GUI FUNCTIONS
