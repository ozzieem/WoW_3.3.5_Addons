--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file manages the ignorelist

]]


-- flags to skip HoloIgnore_List_Update()
HoloIgnore_EventFlags = {};
HoloIgnore_EventFlags.Type = "IL";
HoloIgnore_EventFlags.Quiet = false;
HoloIgnore_EventFlags.Name = "";
HoloIgnore_EventFlags.RunListUpdate = "";
HoloIgnore_EventFlags.SetNotifyOn = false;
HoloIgnore_EventFlags.SetNotifyOff = false;
HoloIgnore_EventFlags.IgnoreAddSysMsg = false;
HoloIgnore_EventFlags.IgnoreRemoveSysMsg = false;
HoloIgnore_EventFlags.ListMSGEvent = false;
HoloIgnore_EventFlags.ListUPDATEEvent = false;

-- flag to update the list again
local HI_Requested_List_Update = false;
-- counter to limit the requested list update
local HI_List_Update_Recall_Counter = 0;

local HI_Max_Server_Ignore = 50;
local HI_Displayed_Names = 18;

local HI_IsGroupSelected = nil;

local HI_SelectedEntry = -1;
local HI_LastClicked = -1;

local HI_list = {};
local HI_Moving_Ignore = nil;
local HI_Target_Ignore = nil;

local HI_List_Template = "%1$s: |cffffffff%2$s|r";
local HI_Limit_Alert = string.gsub(HOLOFRIENDS_MSGIGNORELIMITALERT, "%%d", HI_Max_Server_Ignore);

-- Update background texture if window become visible
local HI_Window_Visible = false;


-- create and insert a new ignore entry
local function HIF_InsertNewEntry(name, group, note, notify)
	if ( not name or name == "" ) then return nil; end

	local temp = {};
	temp.name = name;
	if ( not group or group == "" ) then
		temp.group = IGNORE;
	else
		temp.group = group;
	end
	if ( notify ) then temp.notify = notify; end

	-- get comment from friends list if there is any
	local list = HoloFriends_GetList();
	local wasFriend = HoloFriendsLists_ContainsPlayer(list, name);
	local friends_note;
	if ( wasFriend ) then friends_note = HoloFriendsLists_GetComment(list, wasFriend); end

	-- set comment from ignore list if no note
	if ( note and (note ~= "") ) then temp.comment = note; end
	HoloFriendsFuncs_MergeComment(temp, friends_note, 0, true, false);

	table.insert(HI_list, temp);
	table.sort(HI_list, HoloFriendsFuncs_CompareEntry);
end


-- event handling

local function HI_SearchWindowToHide(window)
	for index = 1, STATICPOPUP_NUMDIALOGS do
		local frame = getglobal("StaticPopup"..index);
		if ( frame:IsVisible() and (frame.which == window) ) then
			frame:Hide();
		end
	end
end

function HoloIgnore_OnEvent(self, event, ...)
	if ( event == "VARIABLES_LOADED" ) then
		self:UnregisterEvent("VARIABLES_LOADED");
		self:RegisterEvent("IGNORELIST_UPDATE");
		self:RegisterEvent("DUEL_REQUESTED");
		self:RegisterEvent("GUILD_INVITE_REQUEST");
		self:RegisterEvent("PETITION_SHOW");
		self:RegisterEvent("PARTY_INVITE_REQUEST");
	end

	if ( event == "IGNORELIST_UPDATE" ) then
		if ( HoloIgnore_EventFlags.SetNotifyOn or HoloIgnore_EventFlags.SetNotifyOff ) then
			if ( HoloIgnore_EventFlags.RunListUpdate ~= "" ) then
				HoloIgnore_EventFlags.ListUPDATEEvent = true;
			else
				HoloIgnore_EventFlags.SetNotifyOn = false;
				HoloIgnore_EventFlags.SetNotifyOff = false;
			end

			if ( HoloIgnore_EventFlags.ListUPDATEEvent ) then HoloFriends_chat("HI ListUPDATEEvent", HF_DEBUG_OUTPUT); end

			if ( HoloIgnore_EventFlags.ListMSGEvent and HoloIgnore_EventFlags.ListUPDATEEvent ) then
				HoloFriendsFuncs_CheckRunListUpdate(HoloIgnore_EventFlags);
			end
		else
			HoloFriends_chat("HoloIgnore_List_Update on event IGNORELIST_UPDATE", HF_DEBUG_OUTPUT);
			HoloIgnore_List_Update();
		end
	end

	-- Filter to ignore some requests from offline ignores
	if ( event == "DUEL_REQUESTED" ) then
		local name = ...
		local index = HoloFriendsLists_ContainsPlayer(HI_list, name);
		if ( index and not HI_list[index].notify ) then
			CancelDuel();
			HI_SearchWindowToHide("DUEL_REQUESTED");
			HoloFriends_chat(format(HOLOFRIENDS_MSGIGNOREDUEL, name));
		end
	end

	if ( event == "GUILD_INVITE_REQUEST" ) then
		local name = ...
		local index = HoloFriendsLists_ContainsPlayer(HI_list, name);
		if ( index and not HI_list[index].notify ) then
			DeclineGuild();
			HI_SearchWindowToHide("GUILD_INVITE");
			HoloFriends_chat(format(HOLOFRIENDS_MSGIGNOREINVITEGUILD, name));
		end
	end

	if ( event == "PETITION_SHOW" ) then
		local type, _, _, _, name  = GetPetitionInfo();
		if ( petitionType == "guild" ) then
			local index = HoloFriendsLists_ContainsPlayer(HI_list, name);
			if ( index and not HI_list[index].notify ) then
				ClosePetition();
				HoloFriends_chat(format(HOLOFRIENDS_MSGIGNORESIGNGUILD, name));
			end
		end
	end

	if ( event == "PARTY_INVITE_REQUEST" ) then
		local name = ...
		local index = HoloFriendsLists_ContainsPlayer(HI_list, name);
		if ( index and not HI_list[index].notify ) then
			DeclineGroup();
			HI_SearchWindowToHide("PARTY_INVITE");
			HoloFriends_chat(format(HOLOFRIENDS_MSGIGNOREPARTY, name));
		end
	end
end


function HoloIgnore_OnUpdate()
	if ( HI_Moving_Ignore ) then
		local slot;
		HI_Target_Ignore = nil;
		for index = 1, HI_Displayed_Names, 1 do
			slot = getglobal("HoloIgnoreNameButton"..index);
			if ( MouseIsOver(slot) ) then
				slot:LockHighlight();
				HI_Target_Ignore = slot;
				local pos = HoloIgnoreScrollFrame:GetVerticalScroll();
				if ( index == 1 and pos >= FRIENDS_FRAME_IGNORE_HEIGHT ) then
					HoloIgnoreScrollFrameScrollBar:SetValue(pos - FRIENDS_FRAME_IGNORE_HEIGHT);
				end
				if ( index == HI_Displayed_Names and
				     (pos < FRIENDS_FRAME_IGNORE_HEIGHT*(table.getn(HI_list) - HI_Displayed_Names)) )
				then
					HoloIgnoreScrollFrameScrollBar:SetValue(pos + FRIENDS_FRAME_IGNORE_HEIGHT);
				end
			else
				slot:UnlockHighlight();
			end
		end
		HI_Moving_Ignore:UnlockHighlight();
	end

	-- set background texture and call List_Update (OnShow works not always)
	if ( not HI_Window_Visible ) then
		HI_Window_Visible = true;
		FriendsFrameTopLeft:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopLeft");
		FriendsFrameTopRight:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-General-TopRight");
		FriendsFrameBottomLeft:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-BotLeft");
		FriendsFrameBottomRight:SetTexture("Interface\\FriendsFrame\\UI-FriendsFrame-BotRight");

		HoloFriends_chat("HoloFriends_List_Update from HoloIgnore_OnUpdate", HF_DEBUG_OUTPUT);
		HoloIgnore_List_Update();
	end
end


function HoloIgnore_OnHide()
	HoloIgnore_DeselectEntry();

	-- mark visibility of ignore window
	HI_Window_Visible = false;
end


-- add an ignore
function HoloIgnore_AddIgnore(player, note)
	local name;
	if ( player and player ~= "" ) then
		name = player;
	elseif ( UnitIsPlayer("target") ) then
		local server;
		name, server = UnitName("target");
		if ( server and (not UnitIsSameServer("player", "target")) ) then
			name = name.."-"..server;
		end
	else
		StaticPopup_Show("ADD_IGNORE");
		return;
	end

	if ( not HoloFriendsLists_ContainsPlayer(HI_list, name) ) then
		HIF_InsertNewEntry(name, nil, note);
		if ( (GetNumIgnores() < HI_Max_Server_Ignore) and (name ~= UnitName("player")) ) then
			local index = HoloFriendsLists_ContainsPlayer(HI_list, name);
			HoloFriendsLists_SetNotify(HI_list, index, HF_ONLINE, HF_UNQUIET, "RunUpdate", HoloIgnore_EventFlags);
		else
			local msg = format(HOLOFRIENDS_MSGIGNOREONLINEDISABLED, name);
			HoloFriendsFuncs_SystemMessage(msg);
			HoloFriends_chat("HoloIgnore_List_Update from HoloIgnore_AddIgnore", HF_DEBUG_OUTPUT);
			HoloIgnore_List_Update();
		end
	end

	-- update share window if open
	if ( HoloIgnore_ShareFrame:IsVisible() ) then
		HoloFriendsShare_OnShow(HoloIgnore_ShareFrame);
	end
end


-- remove the selected ignore
function HoloIgnore_RemoveIgnore()
	if ( HI_IsGroupSelected or not HoloIgnore_IsSelectedEntryValid() ) then return; end

	local done = false;
	done = HoloFriendsLists_SetNotify(HI_list, HI_SelectedEntry, HF_OFFLINE, HF_UNQUIET, "RunUpdate", HoloIgnore_EventFlags);

	-- remove from our list
	table.remove(HI_list, HI_SelectedEntry);
	HoloIgnore_DeselectEntry();

	-- to update list also for offline ignores
	-- ("if" statement is important, because there the ignore is still at the online list)
	if (not done) then
		HoloFriends_chat("HoloIgnore_List_Update from HoloIgnore_RemoveIgnore", HF_DEBUG_OUTPUT);
		HoloIgnore_List_Update();
	end

	-- update share window if open
	if ( HoloIgnore_ShareFrame:IsVisible() ) then
		HoloFriendsShare_OnShow(HoloIgnore_ShareFrame);
	end
end


-- BEGIN OF GETTERS

-- returns the id of the last clicked entry
function HoloIgnore_GetLastClickedIndex()
	return HI_LastClicked;
end


-- returns the selected entry
function HoloIgnore_GetSelectedEntry()
	return HI_SelectedEntry;
end


-- returns true if the selected entry is valid
function HoloIgnore_IsSelectedEntryValid()
	if ( not HoloFriends_Loaded ) then return false; end

	return HoloFriendsLists_IsListIndexValid(HI_list, HI_SelectedEntry);
end


function HoloIgnore_DeselectEntry()
	HI_SelectedEntry = -1;
end


function HoloIgnore_GetList()
	if ( not HoloFriends_Loaded ) then
		local list = {};
		return list;
	end

	return HI_list;
end


function HoloIgnore_LoadList()
	-- get the correct list
	HI_list = HoloFriendsFuncs_LoadList(HOLOIGNORE_LIST, UnitName("player"), HF_HILIST);

	-- check if group "ignore" is in our list
	if ( not HoloFriendsLists_ContainsGroup(HI_list, IGNORE) ) then
		HIF_InsertNewEntry("1", IGNORE);
	end

	-- set actual date in seconds to the ignore group (indicator of last use)
	local idx = HoloFriendsLists_ContainsGroup(HI_list, IGNORE);
	HI_list[idx].lastuse = time();
end

-- END OF GETTER


-- BEGIN OF ITEM TOOLTIP

function HoloIgnore_NameButton_SetTooltip(self)
	local index = self:GetID();

	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT");
	GameTooltip:SetText(HoloFriendsLists_GetName(HI_list, index, HF_DISPLAY), 1.0, 1.0, 1.0);
	if ( HoloFriendsLists_GetComment(HI_list, index) ~= "" ) then
		local note = HoloFriendsLists_GetComment(HI_list, index);
		GameTooltip:AddLine(note, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 1);
	end
	GameTooltip:Show();
end

-- END OF ITEM TOOLTIP


-- START OF GUI FUNCTIONS

-- drag and drop function
function HoloIgnore_NameButton_OnDragStart(self)
	local index = self:GetID();

	local maxi = table.getn(HI_list);
	if ( index > maxi ) then return; end

	if ( HoloFriendsLists_IsGroup(HI_list, index) ) then return; end
	HI_list[index].remove = nil;

	local cursorX, cursorY = GetCursorPosition();
	cursorX = cursorX / self:GetScale();
	cursorY = cursorY / self:GetScale();

	HI_Moving_Ignore = HoloIgnoreNameButtonDrag;
	HI_Moving_Ignore:SetID(index);
	HoloIgnoreNameButtonDragName:SetText(getglobal(self:GetName().."Name"):GetText());
	HI_Moving_Ignore:ClearAllPoints();
	HI_Moving_Ignore:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", cursorX+5, cursorY);
	HI_Moving_Ignore:Show();
	HI_Moving_Ignore:StartMoving();
end


-- drag and drop function
function HoloIgnore_NameButton_OnDragStop()
	if ( not HI_Moving_Ignore ) then return; end

	HI_Moving_Ignore:StopMovingOrSizing();
	HI_Moving_Ignore:Hide();
	HI_Moving_Ignore:ClearAllPoints();

	if ( not HI_Target_Ignore ) then return; end

	local targetIndex = HI_Target_Ignore:GetID();
	if ( targetIndex > table.getn(HI_list) ) then
		targetIndex = table.getn(HI_list);
	end
	HI_list[HI_Moving_Ignore:GetID()].group = HI_list[targetIndex].group;
	HI_Moving_Ignore = nil;
	HoloFriends_chat("HoloIgnore_List_Update from HoloIgnore_NameButton_OnDragStop", HF_DEBUG_OUTPUT);
	HoloIgnore_List_Update();

	-- update share window if open
	if ( HoloIgnore_ShareFrame:IsVisible() ) then
		HoloFriendsShare_OnShow(HoloIgnore_ShareFrame);
	end
end


-- if we clicked on a header, toggle state and select header, otherwise just select entry
function HoloIgnore_NameButton_OnClick(self, button)
	HI_LastClicked = self:GetID();
	if ( not HI_LastClicked ) then return; end

	local maxi = table.getn(HI_list);
	if ( HI_LastClicked > maxi ) then return; end

	if ( button == "LeftButton" ) then
		HI_SelectedEntry = HI_LastClicked;
		-- group selected
		if ( HI_list[HI_SelectedEntry].name == "0" ) then
			HI_IsGroupSelected = 1;
			HI_list[HI_SelectedEntry].name = "1";
		elseif ( HI_list[HI_SelectedEntry].name == "1" ) then
			HI_IsGroupSelected = 1;
			HI_list[HI_SelectedEntry].name = "0";
		else
			-- player selected
			HI_IsGroupSelected = false;
		end
		HoloFriends_chat("HoloIgnore_List_Update from HoloIgnore_NameButton_OnClick", HF_DEBUG_OUTPUT);
		HoloIgnore_List_Update();
	else
		HoloIgnore_ShowListDropdown(HI_LastClicked);
	end
end


function HoloIgnore_CheckBox_OnClick(self)
	local index = self:GetParent():GetID();

	local maxi = table.getn(HI_list);
	if ( index > maxi ) then return; end

	if ( self:GetChecked() and GetNumIgnores() == HI_Max_Server_Ignore ) then
		self:SetChecked(nil);
		HoloFriendsFuncs_SystemMessage(HI_Limit_Alert);
	else
		if ( self:GetChecked() ) then
			PlaySound("igMainMenuOptionCheckBoxOff");
		else
			PlaySound("igMainMenuOptionCheckBoxOn");
		end
		HI_list[index].remove = nil;
		HoloFriendsLists_SetNotify(HI_list, index, self:GetChecked(), HF_UNQUIET, "RunUpdate", HoloIgnore_EventFlags);
	end
end


-- start ignore list update and check that it runs only once at time
function HoloIgnore_List_Update()
	if ( not HoloFriends_Loaded ) then return; end

	if ( (HoloFriends_ListUpdateStartTime ~= HoloFriends_ListUpdateRefTime) and
	     (difftime(time(), HoloFriends_ListUpdateStartTime) < HoloFriends_ListUpdateMaxSec) ) then
		HI_Requested_List_Update = true;
		return;
	end

	HoloFriends_chat("HoloIgnore_List_Update start", HF_DEBUG_OUTPUT);

	-- if faction wide ignore list is used, the server list need to be cleared first, to add local entries (ignore list limit)
	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOIGNORE_LIST, UnitName("player"));
	if ( NotFaction ) then
		HoloIgnore_CheckLocalList();
	else
		HoloIgnore_CheckServerList();
	end
end


-- check the local list
function HoloIgnore_CheckLocalList()
	HoloFriends_chat("HoloIgnore_CheckLocalList start", HF_DEBUG_OUTPUT);

	HoloFriends_ListUpdateStartTime = time();
	local index = next(HI_list);
	while ( index and HI_list[index] ) do
		if ( not HI_list[index].name or not HI_list[index].group ) then
			table.remove(HI_list, index);
		else
			-- set ignores online, which were added by sharing
			if ( HI_list[index].imported ) then
				HI_list[index].imported = nil;
				local notify = (GetNumIgnores() < HI_Max_Server_Ignore);
				HoloFriendsLists_SetNotify(HI_list, index, notify, HF_UNQUIET, "RunLocal", HoloIgnore_EventFlags);
				return;
			end

			index = next(HI_list, index);
		end
	end

	-- check if group "ignore" is in our list
	if ( not HoloFriendsLists_ContainsGroup(HI_list, IGNORE) ) then
		HIF_InsertNewEntry("1", IGNORE);
	end

	-- set actual date in seconds to the ignore group (indicator of last use)
	local index = HoloFriendsLists_ContainsGroup(HI_list, IGNORE)
	HI_list[index].lastuse = time();

	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOIGNORE_LIST, UnitName("player"));
	if ( NotFaction ) then
		HoloIgnore_CheckServerList();
	else
		HoloIgnore_UpdateIgnoreList();
	end
end


-- check if all entries in server ignore list are in our list
function HoloIgnore_CheckServerList()
	HoloFriends_chat("HoloIgnore_CheckServerList start", HF_DEBUG_OUTPUT);

	HoloFriends_ListUpdateStartTime = time();

	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOIGNORE_LIST, UnitName("player"));
	local numNotifyIgnore = GetNumIgnores();
	local maxi;

	-- init the notify flag of all online ignores (notify = 3 is ignore check in progress)
	maxi = table.getn(HI_list);
	for index = 1, maxi do
		if ( HI_list[index].notify and (HI_list[index].notify ~= 3) ) then HI_list[index].notify = 2; end
	end

	-- init variables for data we get from server
	local name;
	local playerIndex;

	-- check if all ignores are in our list
	for index = 1, numNotifyIgnore do
		name = GetIgnoreName(index);

		-- check if player is already in our list or need to be added
		playerIndex = HoloFriendsLists_ContainsPlayer(HI_list, name);
		if ( playerIndex ) then
			if ( NotFaction ) then
				if ( HI_list[playerIndex].notify and (HI_list[playerIndex].notify == 3) ) then
					HoloFriendsLists_SetNotify(HI_list, playerIndex, HF_OFFLINE, HF_QUIET, "RunServer", HoloIgnore_EventFlags);
					return;
				else
					HI_list[playerIndex].notify = HF_ONLINE;
				end
			elseif ( not HI_list[playerIndex].notify ) then
				HoloFriendsLists_SetNotify(HI_list, playerIndex, HF_OFFLINE, HF_UNQUIET, "RunServer", HoloIgnore_EventFlags);
				return;
			else
				HI_list[playerIndex].notify = HF_ONLINE; -- to change old list style entries from "1" to "true"
			end

		else
			if ( NotFaction ) then
				HIF_InsertNewEntry(name, nil, note, HF_ONLINE);
			else
				-- not added by HoloFriends, so remove entry from server list
				HoloIgnore_EventFlags.Name = name;
				HoloIgnore_EventFlags.RunListUpdate = "RunServer";
				HoloIgnore_EventFlags.Quiet = HF_UNQUIET;
				local done = HoloFriendsFuncs_RemoveFromServerList(HoloIgnore_EventFlags);
				if ( done ) then return; end
			end
		end
	end

	-- check if all online ignores are still there
	maxi = table.getn(HI_list);
	for index = 1, maxi do
		if ( HI_list[index].notify and (HI_list[index].notify == 3) ) then
			local msg = format(TEXT(HOLOFRIENDS_MSGIGNOREMISSINGONLINE), HI_list[index].name);
			HoloFriendsFuncs_SystemMessage(msg);
			HI_list[index].notify = HF_OFFLINE;
		end
		if ( HI_list[index].notify and (HI_list[index].notify == 2) ) then
			local silent = false;
			if ( NotFaction ) then silent = true; end
			HoloFriendsLists_SetNotify(HI_list, index, 3, silent, "RunServer", HoloIgnore_EventFlags);
			return;
		end
	end

	--sort the entries
	table.sort(HI_list, HoloFriendsFuncs_CompareEntry);

	if ( NotFaction ) then
		HoloIgnore_UpdateIgnoreList();
	else
		HoloIgnore_CheckLocalList();
	end
end


-- update scrollframe & buttons
function HoloIgnore_UpdateIgnoreList()
	HoloFriends_ListUpdateStartTime = time();
	local maxi = table.getn(HI_list);

	-- run only, if window is visible
	if ( not HoloIgnoreFrame:IsVisible() ) then
		HoloFriends_ListUpdateStartTime = HoloFriends_ListUpdateRefTime;

		if ( HI_Requested_List_Update ) then
			HI_Requested_List_Update = false;
			HI_List_Update_Recall_Counter = HI_List_Update_Recall_Counter + 1;
			-- limit recals to 8 to save stack-space
			if ( HI_List_Update_Recall_Counter < 9 ) then
				HoloFriends_chat("HoloIgnore_List_Update recall", HF_DEBUG_OUTPUT);
				HoloIgnore_List_Update();
			end
		end
		HI_List_Update_Recall_Counter = 0;
		return;
	end

	HoloFriends_chat("HoloIgnore_UpdateIgnoreList start", HF_DEBUG_OUTPUT);

	-- get some counter
	local notifyCounter = GetNumIgnores();
	local sumCounter = 0;
	for index = 1, maxi do
		if ( (HI_list[index].name ~= "0") and (HI_list[index].name ~= "1") ) then
			sumCounter = sumCounter + 1;
		end
	end

	-- get visible index table
	local ShownIndexTable = {};
	ShownIndexTable = HoloFriendsFuncs_ShownListTab(HI_list, HI_Displayed_Names, HF_HILIST);
	-- get counter of visible elements from index table
	local visibleCnt = HoloFriendsFuncs_GetNumVisibleListElements(ShownIndexTable, maxi, HI_Displayed_Names);

	-- enable/disable remove-buttons
	if ( HoloIgnore_IsSelectedEntryValid() ) then
		if ( HoloFriendsLists_IsGroup(HI_list, HI_SelectedEntry) ) then
			if ( HoloFriendsLists_GetGroup(HI_list, HI_SelectedEntry) ~= IGNORE ) then
				HoloIgnoreRemoveGroupButton:Enable();
				HoloIgnoreRemoveIgnoreButton:Disable();
			else
				HoloIgnoreRemoveGroupButton:Disable();
				HoloIgnoreRemoveIgnoreButton:Disable();
			end
		else
			HoloIgnoreRemoveGroupButton:Disable();
			HoloIgnoreRemoveIgnoreButton:Enable();
		end
	else
		HoloIgnoreRemoveGroupButton:Disable();
		HoloIgnoreRemoveIgnoreButton:Disable();
	end

	-- ScrollFrame stuff
	local ScrollBarSize = 0;
	if ( visibleCnt > HI_Displayed_Names ) then ScrollBarSize = 20; end 
	FauxScrollFrame_Update(HoloIgnoreScrollFrame, visibleCnt, HI_Displayed_Names, 16);
	-- scrollframe offset
	local offset = FauxScrollFrame_GetOffset(HoloIgnoreScrollFrame);

	-- button and textures
	local button, buttonText, buttonTextRemove, buttonCheckBox;

	local entry = {};
	local line = 1;

	-- set values / textures for all buttons
	while ( line <= HI_Displayed_Names ) do
		local index = ShownIndexTable[line + offset];

		entry = HI_list[index];

		button = getglobal("HoloIgnoreNameButton"..line);
		button:SetID(index);

		if ( line > visibleCnt ) then
			button:Hide();
		else
			button:Show();
		end

		if ( entry ) then
			if ( index == HI_SelectedEntry ) then
				button:LockHighlight();
			else
				button:UnlockHighlight();
			end

			-- get textfield, and checkbox
			buttonText = getglobal("HoloIgnoreNameButton"..line.."Name");
			buttonTextRemove = getglobal("HoloIgnoreNameButton"..line.."NameRemove");
			buttonCheckBox = getglobal("HoloIgnoreNameButton"..line.."Server");

			-- group entry ?
			if ( entry.name == "1" or entry.name == "0" ) then
				local name = HoloFriendsLists_GetName(HI_list, index, HF_DISPLAY);
				buttonText:SetText(name);
				buttonTextRemove:SetText("");
				buttonText:ClearAllPoints();
				buttonText:SetPoint("TOPLEFT", "HoloIgnoreNameButton"..line, "TOPLEFT", 20, 0);
				buttonCheckBox:Hide();

				if ( entry.name == "1" ) then
					button:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up");
				else
					button:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up");
				end
			else -- no, we got a player
				local textwidth;
				local name = HoloFriendsLists_GetName(HI_list, index, HF_DISPLAY);
				local note = HoloFriendsLists_GetComment(HI_list, index);
				if ( entry.remove ) then
					buttonText:SetText(name);
					textwidth = buttonText:GetStringWidth();
				end
				buttonText:SetText(format(TEXT(HI_List_Template), name, note));
				if ( entry.remove ) then
					buttonTextRemove:SetText("|cffffffff_____________________________________|r");
					buttonTextRemove:SetWidth(textwidth + 10);
				else
					buttonTextRemove:SetText("");
				end
				button:SetNormalTexture("");
				buttonCheckBox:Show();
				buttonCheckBox:SetChecked(entry.notify);
				buttonText:ClearAllPoints();
				buttonText:SetPoint("TOPLEFT", "HoloIgnoreNameButton"..line, "TOPLEFT", 36, 0);
			end

			-- Set the button text with
			button:SetWidth(315 - ScrollBarSize);
			buttonText:SetWidth(276 - ScrollBarSize);
		end

		line = line + 1;
	end

	HoloIgnoreOnline:SetText(format("%s %d / %d", HOLOFRIENDS_WINDOWMAINIGNOREONLINE, notifyCounter, sumCounter));

	HoloFriends_ListUpdateStartTime = HoloFriends_ListUpdateRefTime;

	HoloFriends_chat("HoloIgnore_UpdateIgnoreList end", HF_DEBUG_OUTPUT);

	if ( HI_Requested_List_Update ) then
		HI_Requested_List_Update = false;
		HI_List_Update_Recall_Counter = HI_List_Update_Recall_Counter + 1;
		-- limit recals to 8 to save stack-space
		if ( HI_List_Update_Recall_Counter < 9 ) then
			HoloFriends_chat("HoloIgnore_List_Update recall", HF_DEBUG_OUTPUT);
			HoloIgnore_List_Update();
		end
	end
	HI_List_Update_Recall_Counter = 0;
end

-- END OF GUI FUNCTIONS
