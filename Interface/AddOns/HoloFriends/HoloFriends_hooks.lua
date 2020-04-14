--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines the hooks used

]]


-- flags to show in-game friends or ignore list
HoloFriends_ShowInGameFriendsList = false;
HoloFriends_ShowInGameIgnoreList = false;

-- strings computed from global strings
local HF_ERR_FRIEND_ADDED_S = "";
local HF_ERR_FRIEND_ALREADY_S = "";
local HF_ERR_FRIEND_REMOVED_S = "";

local HF_ERR_IGNORE_ADDED_S = "";
local HF_ERR_IGNORE_ALREADY_S = "";
local HF_ERR_IGNORE_REMOVED_S = "";

local HF_WHO_LIST_FORMAT = "";
local HF_WHO_LIST_GUILD_FORMAT = "";
HoloFriends_WHO_NUM_RESULTS = "";

-- saved text from autocomplete
local HF_AutoComplete_OldText = "";

-- saved hook
local HFF_FriendsFrame_OnEvent_Orig = nil;


-- Initialisation of the hooks
function HoloFriendsHooks_OnLoad()
	hooksecurefunc("UIDropDownMenu_Initialize", HoloFriends_UIDropDownMenu_Initialize);
	hooksecurefunc("UnitPopup_OnClick",         HoloFriends_UnitPopup_OnClick);
	hooksecurefunc("UnitPopup_OnUpdate",        HoloFriends_UnitPopup_OnUpdate);
	hooksecurefunc("UnitPopup_HideButtons",     HoloFriends_UnitPopup_HideButtons);
	hooksecurefunc("AutoComplete_Update",       HoloFriends_AutoComplete_Update);
	hooksecurefunc("FriendsFrame_Update",       HoloFriends_FriendsFrame_Update);

	-- Add a System Message Event Filter (replaces old hook methode)
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", HoloFriends_ChatMsgSystem_EventFilter);

	-- Add event filter to ignore chat from players at the offline ignore list
	ChatFrame_AddMessageEventFilter("CHAT_MSG_ACHIEVEMENT",         HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND",        HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL",             HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_EMOTE",               HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD",               HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD_ACHIEVEMENT",   HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER",             HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY",               HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER",        HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID",                HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER",         HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_WARNING",        HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY",                 HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_TEXT_EMOTE",          HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER",             HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER_INFORM",      HoloFriends_IgnoreChatMsg_EventFilter);
	ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL",                HoloFriends_IgnoreChatMsg_EventFilter);

	-- hook FriendsFrame_OnEvent to prevent who-frame popup
	HFF_FriendsFrame_OnEvent_Orig = FriendsFrame_OnEvent;
	FriendsFrame_OnEvent = HoloFriends_FriendsFrame_OnEvent;

	-- setup of some strings
	HF_ERR_FRIEND_ADDED_S   = string.gsub(ERR_FRIEND_ADDED_S,   "%%s", "%.%+");
	HF_ERR_FRIEND_ALREADY_S = string.gsub(ERR_FRIEND_ALREADY_S, "%%s", "%.%+");
	HF_ERR_FRIEND_REMOVED_S = string.gsub(ERR_FRIEND_REMOVED_S, "%%s", "%.%+");

	HF_ERR_IGNORE_ADDED_S   = string.gsub(ERR_IGNORE_ADDED_S,   "%%s", "%.%+");
	HF_ERR_IGNORE_ALREADY_S = string.gsub(ERR_IGNORE_ALREADY_S, "%%s", "%.%+");
	HF_ERR_IGNORE_REMOVED_S = string.gsub(ERR_IGNORE_REMOVED_S, "%%s", "%.%+");

	HF_WHO_LIST_FORMAT = string.gsub(WHO_LIST_FORMAT, "%%%d*%$?s", "%.%*");
	HF_WHO_LIST_FORMAT = string.gsub(HF_WHO_LIST_FORMAT, "%%%d*%$?d", "%%d%+");
	HF_WHO_LIST_FORMAT = string.gsub(HF_WHO_LIST_FORMAT, "%[", "%%%[");
	HF_WHO_LIST_FORMAT = string.gsub(HF_WHO_LIST_FORMAT, "%]", "%%%]");
	HF_WHO_LIST_FORMAT = string.gsub(HF_WHO_LIST_FORMAT, "%-", "%%%-");
	HF_WHO_LIST_GUILD_FORMAT = string.gsub(WHO_LIST_GUILD_FORMAT, "%%%d*%$?s", "%.%*");
	HF_WHO_LIST_GUILD_FORMAT = string.gsub(HF_WHO_LIST_GUILD_FORMAT, "%%%d*%$?d", "%%d%+");
	HF_WHO_LIST_GUILD_FORMAT = string.gsub(HF_WHO_LIST_GUILD_FORMAT, "%[", "%%%[");
	HF_WHO_LIST_GUILD_FORMAT = string.gsub(HF_WHO_LIST_GUILD_FORMAT, "%]", "%%%]");
	HF_WHO_LIST_GUILD_FORMAT = string.gsub(HF_WHO_LIST_GUILD_FORMAT, "%-", "%%%-");
	HoloFriends_WHO_NUM_RESULTS = string.gsub(WHO_NUM_RESULTS, "%%%d*%$?d", "%%d%+");
end


-- This makes all windows visible
function HoloFriends_FriendsFrame_Update()
	if ( FriendsFrame.selectedTab == 1 ) then
		-- show HoloFriends friends list
		if ( FriendsTabHeader.selectedTab == 1 ) then
			HoloFriends_ShowInGameIgnoreList = false;
			if ( not HoloFriends_ShowInGameFriendsList ) then
				FriendsTabHeader:Hide();
				_G["FriendsListFrame"]:Hide();
				HoloIgnoreFrame:Hide();
				HoloFriendsFrame:Show();
				return;
			end
		-- show HoloFriends ignore list
		elseif ( FriendsTabHeader.selectedTab == 2 ) then
			HoloFriends_ShowInGameFriendsList = false;
			if ( not HoloFriends_ShowInGameIgnoreList ) then
				FriendsTabHeader:Hide();
				_G["IgnoreListFrame"]:Hide();
				HoloFriendsFrame:Hide();
				HoloIgnoreFrame:Show();
				return;
			end
		else
			HoloFriends_ShowInGameFriendsList = false;
			HoloFriends_ShowInGameIgnoreList = false;
		end
	end
	HoloFriendsFrame:Hide();
	HoloIgnoreFrame:Hide();
end


-- Autocompletion, mainly for send mail
local function HFF_AutoComplete_Update(self, text, cursorpos, maxarg, ...)
	local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9 = ...;
	local numarg = select("#", ...);

	local numFriends, name;

	-- split text at cursor position
	local textlen = string.len(text);
	local subtxt1;
	if ( cursorpos > 0 ) then subtxt1 = string.sub(text, 1, cursorpos); end
	local subtxt2;
	if ( cursorpos < textlen ) then subtxt2 = string.sub(text, cursorpos + 1); end

	-- check local HoloFriends list
	local list = HoloFriends_GetList();
	numFriends = table.getn(list);
	if ( (numFriends > 0) and (numarg < maxarg) ) then
		for index = 1, numFriends do
			name = HoloFriendsLists_GetName(list, index);
			if ( name == "" ) then name = nil; end
			if ( HoloFriendsLists_IsGroup(list, index) ) then name = nil; end
			-- check if player is in online friends list
			if ( HoloFriendsLists_GetNotify(list, index) ) then name = nil; end
			-- check if player is in guild list
			if ( name ) then
				for idx = 1, GetNumGuildMembers(true) do
					local gname = GetGuildRosterInfo(idx);
					if ( name == gname) then name = nil; end
				end
			end
			-- check the name string
			if ( subtxt1 ) then
				-- subtxt1 has to start at first position in name
				if ( name and (strfind(strupper(name), strupper(subtxt1), 1, 1) == 1) ) then
					-- subtxt2 has to exist in name after the cursor position
					if ( subtxt2 and not strfind(strupper(name), strupper(subtxt2), cursorpos + 1, 1) ) then
						name = nil;
					end
				else
					name = nil;
				end
			else
				-- without subtxt1, only subtxt2 has to exist in name
				if ( name and not strfind(strupper(name), strupper(subtxt2), 1, 1) ) then
					name = nil;
				end
			end
			-- put valid name in next free argument upto maxarg is filled
			if ( name and (numarg < maxarg) ) then
				numarg = numarg + 1;
				if ( numarg == 1 ) then arg1 = name; end
				if ( numarg == 2 ) then arg2 = name; end
				if ( numarg == 3 ) then arg3 = name; end
				if ( numarg == 4 ) then arg4 = name; end
				if ( numarg == 5 ) then arg5 = name; end
				if ( numarg == 6 ) then arg6 = name; end
				if ( numarg == 7 ) then arg7 = name; end
				if ( numarg == 8 ) then arg8 = name; end
				if ( numarg == 9 ) then arg9 = name; end				
			end
		end
	end

	-- check FactionList for own chars
	local player = UnitName("player");
	local faction = UnitFactionGroup("player");
	local clist = HoloFriendsFuncs_RealmGetAllFactionChars();
	numFriends = table.getn(clist);
	if ( (numFriends > 0) and (numarg < maxarg) ) then
		for index = 1, numFriends do
			name = clist[index];
			if ( name == "" ) then name = nil; end
			if ( (name == player) or (name == faction) ) then name = nil; end
			-- check if own chars are in friends list
			if ( HoloFriendsLists_ContainsPlayer(list, name) ) then name = nil; end
			-- check if own chars are in guild list
			if ( name ) then
				for idx = 1, GetNumGuildMembers(true) do
					local gname = GetGuildRosterInfo(idx);
					if ( name == gname) then name = nil; end
				end
			end
			-- check the name string
			if ( subtxt1 ) then
				-- subtxt1 has to start at first position in name
				if ( name and (strfind(strupper(name), strupper(subtxt1), 1, 1) == 1) ) then
					-- subtxt2 has to exist in name after the cursor position
					if ( subtxt2 and not strfind(strupper(name), strupper(subtxt2), cursorpos + 1, 1) ) then
						name = nil;
					end
				else
					name = nil;
				end
			else
				-- without subtxt1, only subtxt2 has to exist in name
				if (name and not strfind(strupper(name), strupper(subtxt2), 1, 1) ) then
					name = nil;
				end
			end
			-- put valid name in next free argument upto maxarg is filled
			if ( name and (numarg < maxarg) ) then
				numarg = numarg + 1;
				if ( numarg == 1 ) then arg1 = name; end
				if ( numarg == 2 ) then arg2 = name; end
				if ( numarg == 3 ) then arg3 = name; end
				if ( numarg == 4 ) then arg4 = name; end
				if ( numarg == 5 ) then arg5 = name; end
				if ( numarg == 6 ) then arg6 = name; end
				if ( numarg == 7 ) then arg7 = name; end
				if ( numarg == 8 ) then arg8 = name; end
				if ( numarg == 9 ) then arg9 = name; end				
			end
		end
	end

	if ( numarg == 1 ) then
		-- complete the name in the text field if only one left
		if ( strupper(HF_AutoComplete_OldText) ~= strupper(text) ) then
			self:SetText(arg1);
			self:SetCursorPosition(cursorpos);
			self:HighlightText(cursorpos, -1);
		end
		HF_AutoComplete_OldText = text;
		return arg1;
	end
	HF_AutoComplete_OldText = text;

	if ( numarg == 2 ) then return arg1, arg2; end
	if ( numarg == 3 ) then return arg1, arg2, arg3; end
	if ( numarg == 4 ) then return arg1, arg2, arg3, arg4; end
	if ( numarg == 5 ) then return arg1, arg2, arg3, arg4, arg5; end
	if ( numarg == 6 ) then return arg1, arg2, arg3, arg4, arg5, arg6; end
	if ( numarg == 7 ) then return arg1, arg2, arg3, arg4, arg5, arg6, arg7; end
	if ( numarg == 8 ) then return arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8; end
	if ( numarg == 9 ) then return arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9; end
end


function HoloFriends_AutoComplete_Update(parent, text, cursorPosition)
	if ( not parent.autoCompleteParams ) then 
		return;
	end
	if ( not text or (text == "") ) then
		return;
	end
	if ( not cursorPosition or (cursorPosition > strlen(text)) ) then
		return;
	end
	local include = parent.autoCompleteParams.include;
	if ( (include ~= AUTOCOMPLETE_FLAG_ALL) and (include ~= AUTOCOMPLETE_FLAG_FRIEND) ) then
		return;
	end
	local exclude = parent.autoCompleteParams.exclude;
	if ( (exclude == AUTOCOMPLETE_FLAG_ALL) or (exclude == AUTOCOMPLETE_FLAG_FRIEND) ) then
		return;
	end
	local maxarg = AUTOCOMPLETE_MAX_BUTTONS + 1;
	local numarg = select("#", GetAutoCompleteResults(text,	include, exclude, maxarg, cursorPosition));
	if ( (numarg <= 9) and (numarg < maxarg) ) then
		AutoComplete_UpdateResults(AutoCompleteBox,
			HFF_AutoComplete_Update(parent, text, cursorPosition, AUTOCOMPLETE_MAX_BUTTONS+1,
				GetAutoCompleteResults(text, include, exclude, maxarg, cursorPosition)));
	end
end


-- function to manage drop down menu background (initialized in HoloFriendsInit_OnLoadAll)
-- executed at every display of any pull down menu
function HoloFriends_UIDropDownMenu_Initialize(self)
	if ( HOLOFRIENDS_OPTIONS.ShowDropdownBG or HOLOFRIENDS_OPTIONS.ShowDropdownAllBG ) then
		local window = self:GetName();
		if ( (window and (strsub(window,1,4) == "Holo")) or HOLOFRIENDS_OPTIONS.ShowDropdownAllBG ) then

			-- Add a black background to the default pull down menu
			local listFrame = getglobal("DropDownList1");
			local tex = getglobal("DropDownList1_HoloFriendsBG");
			tex:SetTexture([[Interface\ChatFrame\ChatFrameBackground]]);
			tex:SetPoint("TOPLEFT",listFrame,"TOPLEFT",4,-5);
			tex:SetPoint("BOTTOMRIGHT",listFrame,"BOTTOMRIGHT",-4,5);
			tex:SetVertexColor(0.0, 0.0, 0.0);

			return;
		end
	end

	-- remove background texture from default drop down menu
	getglobal("DropDownList1_HoloFriendsBG"):SetTexture(nil);
	getglobal("DropDownList1_HoloFriendsBG"):ClearAllPoints();
end


-- Process drop down menu click
function HoloFriends_UnitPopup_OnClick(self)
	local dropdownFrame = UIDROPDOWNMENU_INIT_MENU;
	local button = self.value;
	local name = dropdownFrame.name;
	local id = dropdownFrame.userData;

	if ( button == "HOLOFRIENDS_ADDCOMMENT" ) then
		if ( dropdownFrame == HoloFriendsDropDown ) then
			local list = HoloFriends_GetList();
			local index = HoloFriends_GetLastClickedIndex();
			list[index].remove = nil;
			StaticPopup_Show("HOLOFRIENDS_ADDCOMMENT", name);
		elseif ( dropdownFrame == HoloIgnoreDropDown ) then
			StaticPopup_Show("HOLOIGNORE_ADDCOMMENT", name);
		end
	elseif ( button == "HOLOFRIENDS_ADDGROUP" ) then
		StaticPopup_Show("HOLOFRIENDS_ADDGROUP");
	elseif ( button == "HOLOFRIENDS_REMOVEGROUP" ) then
		if ( dropdownFrame == HoloFriendsDropDown ) then
			HoloFriendsLists_RemoveGroup(HoloFriends_GetList(), id, FRIENDS);
			HoloFriends_DeselectEntry();
			HoloFriends_chat("HoloFriends_List_Update at button == HOLOFRIENDS_REMOVEGROUP", HF_DEBUG_OUTPUT);
			HoloFriends_List_Update();
			if ( HoloFriends_ShareFrame:IsVisible() ) then
				HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
			end
		elseif ( dropdownFrame == HoloIgnoreDropDown ) then
			HoloFriendsLists_RemoveGroup(HoloIgnore_GetList(), id, IGNORE);
			HoloIgnore_DeselectEntry();
			HoloFriends_chat("HoloIgnore_List_Update at button == HOLOFRIENDS_REMOVEGROUP", HF_DEBUG_OUTPUT);
			HoloIgnore_List_Update();
		end
	elseif ( button == "HOLOFRIENDS_ADDFRIEND" ) then
		HoloFriends_AddFriend(name);
	elseif ( button == "HOLOFRIENDS_ADDIGNORE" ) then
		local unit = dropdownFrame.unit;
		local server = dropdownFrame.server;
		if ( server and (not unit or not UnitIsSameServer("player", unit)) ) then
			name = name.."-"..server;
		end
		HoloIgnore_AddIgnore(name);
	elseif ( button == "HOLOFRIENDS_WHOREQUEST" ) then
		local list = HoloFriends_GetList();
		local index = HoloFriendsLists_ContainsPlayer(list, name);
		if ( HoloFriendsLists_IsRealID(list, index) ) then
			local tname = HoloFriendsLists_GetToon(list, index);
			if ( tname ) then SendWho("n-"..tname); end
		else
			SendWho("n-"..name);
		end
	elseif ( button == "HOLOFRIENDS_RENAMEGROUP" ) then
		if ( dropdownFrame == HoloFriendsDropDown ) then
			StaticPopup_Show("HOLOFRIENDS_RENAMEGROUP");
		elseif ( dropdownFrame == HoloIgnoreDropDown ) then
			StaticPopup_Show("HOLOIGNORE_RENAMEGROUP");
		end
	elseif ( button == "HOLOFRIENDS_INVITE" ) then
		local list = HoloFriends_GetList();
		local index = HoloFriendsLists_ContainsPlayer(list, name);
		if ( HoloFriendsLists_IsRealID(list, index) ) then
			local tname = HoloFriendsLists_GetToon(list, index);
			if ( tname ) then InviteUnit(tname); end
		else
			InviteUnit(name);
		end
	end
end


local function HFF_ShowMenuButtonTooltip(index)
	local listFrame = _G["DropDownList1"];
	local listFrameName = listFrame:GetName();
	local buttonName = listFrameName.."Button"..index;
	local button = _G[buttonName]
	local invisibleButton = _G[buttonName.."InvisibleButton"];

	invisibleButton:Hide();
	button:Enable();
	button.tooltipTitle = HOLOFRIENDS_TOOLTIPDISABLEDMENUENTRYTITLE;
	button.tooltipText = HOLOFRIENDS_TOOLTIPDISABLEDMENUENTRYHINT;
	button.tooltipOnButton = 1;
	button.tooltipWhileDisabled = 1;
	button:Disable();
	invisibleButton:Show();
end


-- Disable buttons in opend drop down menu
function HoloFriends_UnitPopup_OnUpdate(elapsed)
	if ( not DropDownList1:IsShown() ) then
		return;
	end

	-- If none of the untipopup frames are visible then return
	for index, value in pairs(UnitPopupFrames) do
		if ( UIDROPDOWNMENU_OPEN_MENU:GetName() == value ) then
			break;
		elseif ( index == #UnitPopupFrames ) then
			return;
		end
	end

	local dropdown = UIDROPDOWNMENU_OPEN_MENU;
	local which = dropdown.which;
	local name = dropdown.name;
	if ( not name ) then
		name = UnitName(dropdown.unit);
	end

	if ( (which == "PARTY") or (which == "PLAYER") or (which == "RAID") or (which == "FRIEND") ) then
		local nameinignore = HoloFriendsLists_ContainsPlayer(HoloIgnore_GetList(),name);
		local nameinfriends = HoloFriendsLists_ContainsPlayer(HoloFriends_GetList(), name);
		local myname = UnitName("player");
		local count = 0;
		for index, value in ipairs(UnitPopupMenus[which]) do
			if ( UnitPopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] == 1 ) then
				count = count + 1;
				-- disable add player to list if it exist already at one of the lists
				if ( nameinignore or nameinfriends or (name == myname) ) then
					if ( (value == "HOLOFRIENDS_ADDIGNORE") or
					     (value == "HOLOFRIENDS_ADDFRIEND") )
					then
						UIDropDownMenu_DisableButton(1, count + 1);
					end
				end
				-- disable the protected function set focus for this tainted menu (gives en error)
				if ( (value == "SET_FOCUS") and (which == "PLAYER") and HoloFriends_MenuModTDone ) then
					HFF_ShowMenuButtonTooltip(count+1);
					UIDropDownMenu_DisableButton(1, count + 1);
				end
				if ( (value == "SET_FOCUS") and (which == "PARTY") and HoloFriends_MenuModPDone ) then
					HFF_ShowMenuButtonTooltip(count+1);
					UIDropDownMenu_DisableButton(1, count + 1);
				end
				if ( (value == "SET_FOCUS") and (which == "RAID") and HoloFriends_MenuModRDone ) then
					HFF_ShowMenuButtonTooltip(count+1);
					UIDropDownMenu_DisableButton(1, count + 1);
				end
				if ( (value == "RAID_MAINTANK") and (which == "RAID") and HoloFriends_MenuModRDone ) then
					HFF_ShowMenuButtonTooltip(count+1);
					UIDropDownMenu_DisableButton(1, count + 1);
				end
				if ( (value == "TARGET") and (which == "FRIEND") and HoloFriends_MenuModFDone ) then
					HFF_ShowMenuButtonTooltip(count+1);
					UIDropDownMenu_DisableButton(1, count + 1);
				end
			end
		end
	end
end


-- Remove original IGNORE-button in modified drop down menu
function HoloFriends_UnitPopup_HideButtons()
	local dropdownMenu = UIDROPDOWNMENU_INIT_MENU;
	local which = dropdownMenu.which;
	if ( which == "FRIEND" and HoloFriends_MenuModFDone ) then
		for index, value in ipairs(UnitPopupMenus[which]) do
			if ( value == "IGNORE" ) then
				UnitPopupShown[UIDROPDOWNMENU_MENU_LEVEL][index] = 0;
			end
		end
	end
end


-- Filter to ignore messages for offline ignores
local HF_OldMsgID = "";
local HF_MsgID = "";
function HoloFriends_IgnoreChatMsg_EventFilter(self, event, msg, author)
	if ( not msg or (msg == "") ) then return; end
	local list = HoloIgnore_GetList();
	local index = HoloFriendsLists_ContainsPlayer(list, author);
	if ( index and (list[index].name == UnitName("player")) ) then index = nil; end -- prevent endless loop
	if ( index and not list[index].notify ) then
		if ( (event == "CHAT_MSG_WHISPER") and HOLOFRIENDS_OPTIONS.MsgIgnoredWhisper ) then
			HF_MsgID = author.."-"..msg;
			if ( HF_MsgID ~= HF_OldMsgID ) then
				local name = UnitName("player");
				local message = format(CHAT_IGNORED, name).." (HoloFriends)";
				SendChatMessage(message, "WHISPER", nil, author);
				HF_OldMsgID = HF_MsgID;
			end
		end
		return true;
	end
end


-- Event filter for CHAT_MSG_SYSTEM messages
function HoloFriends_ChatMsgSystem_EventFilter(self, event, msg, ...)
	if ( type(msg) ~= "string" ) then return; end

	local skipmsg = false;

	-- friends handling

	if ( string.match(msg, HF_ERR_FRIEND_ADDED_S) ) then
		if ( HoloFriends_EventFlags.SetNotifyOn ) then
			HoloFriends_EventFlags.ListMSGEvent = true;
		end
		if ( HoloFriends_EventFlags.IgnoreAddSysMsg ) then
			HoloFriends_EventFlags.IgnoreAddSysMsg = false;
			skipmsg = true;
			if ( not HoloFriends_EventFlags.Quiet ) then
				local name = HoloFriends_EventFlags.Name;
				local msg = format(HOLOFRIENDS_MSGFRIENDONLINEENABLED, name);
				HoloFriendsFuncs_SystemMessage(msg);
			end
		end
	end

	if ( string.match(msg, HF_ERR_FRIEND_REMOVED_S) ) then
		if ( HoloFriends_EventFlags.SetNotifyOff ) then
			HoloFriends_EventFlags.ListMSGEvent = true;
		end
		if ( HoloFriends_EventFlags.IgnoreRemoveSysMsg ) then
			HoloFriends_EventFlags.IgnoreRemoveSysMsg = false;
			skipmsg = true;
			if ( not HoloFriends_EventFlags.Quiet ) then
				local name = HoloFriends_EventFlags.Name;
				local msg = format(HOLOFRIENDS_MSGFRIENDONLINEDISABLED, name);
				HoloFriendsFuncs_SystemMessage(msg);
			end
		end
	end

	if ( string.match(msg, HF_ERR_FRIEND_ALREADY_S) ) then HoloFriends_EventFlags.ListMSGEvent = true; end
	if ( string.match(msg, ERR_FRIEND_LIST_FULL) ) then HoloFriends_EventFlags.ListMSGEvent = true; end
	if ( string.match(msg, ERR_FRIEND_NOT_FOUND) ) then
		HoloFriends_EventFlags.ListMSGEvent = true;
		HoloFriends_EventFlags.ListUPDATEEvent = true; -- because, this give no UPDATEevent
	end
	if ( string.match(msg, ERR_FRIEND_SELF) ) then
		HoloFriends_EventFlags.ListMSGEvent = true;
		HoloFriends_EventFlags.ListUPDATEEvent = true; -- because, this give no UPDATEevent
	end
	if ( string.match(msg, ERR_FRIEND_WRONG_FACTION) ) then
		HoloFriends_EventFlags.ListMSGEvent = true;
		HoloFriends_EventFlags.ListUPDATEEvent = true; -- because, this give no UPDATEevent
	end

	if ( HoloFriends_EventFlags.RunListUpdate == "" ) then
		HoloFriends_EventFlags.ListMSGEvent = false;
	end

	if ( HoloFriends_EventFlags.ListMSGEvent ) then HoloFriends_chat("HF ListMSGEvent", HF_DEBUG_OUTPUT); end

	if ( HoloFriends_EventFlags.ListMSGEvent and HoloFriends_EventFlags.ListUPDATEEvent ) then
		HoloFriendsFuncs_CheckRunListUpdate(HoloFriends_EventFlags);
	end

	-- ignoress handling

	if ( string.match(msg, HF_ERR_IGNORE_ADDED_S) ) then
		if ( HoloIgnore_EventFlags.SetNotifyOn ) then
			HoloIgnore_EventFlags.ListMSGEvent = true;
		end
		if ( HoloIgnore_EventFlags.IgnoreAddSysMsg ) then
			HoloIgnore_EventFlags.IgnoreAddSysMsg = false;
			skipmsg = true;
			if ( not HoloIgnore_EventFlags.Quiet ) then
				local name = HoloIgnore_EventFlags.Name;
				local msg = format(HOLOFRIENDS_MSGIGNOREONLINEENABLED, name);
				HoloFriendsFuncs_SystemMessage(msg);
			end
		end
	end

	if ( string.match(msg, HF_ERR_IGNORE_REMOVED_S) ) then
		if ( HoloIgnore_EventFlags.SetNotifyOff ) then
			HoloIgnore_EventFlags.ListMSGEvent = true;
		end
		if ( HoloIgnore_EventFlags.IgnoreRemoveSysMsg ) then
			HoloIgnore_EventFlags.IgnoreRemoveSysMsg = false;
			skipmsg = true;
			if ( not HoloIgnore_EventFlags.Quiet ) then
				local name = HoloIgnore_EventFlags.Name;
				local msg = format(HOLOFRIENDS_MSGIGNOREONLINEDISABLED, name);
				HoloFriendsFuncs_SystemMessage(msg);
			end
		end
	end

	if ( string.match(msg, HF_ERR_IGNORE_ALREADY_S) ) then HoloIgnore_EventFlags.ListMSGEvent = true; end
	if ( string.match(msg, ERR_IGNORE_FULL) ) then HoloIgnore_EventFlags.ListMSGEvent = true; end
	if ( string.match(msg, ERR_IGNORE_NOT_FOUND) ) then
		HoloIgnore_EventFlags.ListMSGEvent = true;
		HoloIgnore_EventFlags.ListUPDATEEvent = true; -- because, this give no UPDATEevent
	end
	if ( string.match(msg, ERR_IGNORE_SELF) ) then
		HoloIgnore_EventFlags.ListMSGEvent = true;
		HoloIgnore_EventFlags.ListUPDATEEvent = true; -- because, this give no UPDATEevent
	end

	if ( HoloIgnore_EventFlags.RunListUpdate == "" ) then
		HoloIgnore_EventFlags.ListMSGEvent = false;
	end

	if ( HoloIgnore_EventFlags.ListMSGEvent ) then HoloFriends_chat("HI ListMSGEvent", HF_DEBUG_OUTPUT); end

	if ( HoloIgnore_EventFlags.ListMSGEvent and HoloIgnore_EventFlags.ListUPDATEEvent ) then
		HoloFriendsFuncs_CheckRunListUpdate(HoloIgnore_EventFlags);
	end

	if ( skipmsg ) then return true; end

	-- who-scan handling

	if ( GetTime() < (HoloFriends_interceptWhoResults + HoloFriends_whoCheckInterval) ) then
		if ( string.match(msg, HF_WHO_LIST_FORMAT) ) then
			HoloFriends_chat("Intercepted who result: "..msg, HF_DEBUG_OUTPUT);
			return true;
		elseif ( string.match(msg, HF_WHO_LIST_GUILD_FORMAT) ) then
			HoloFriends_chat("Intercepted who result: "..msg, HF_DEBUG_OUTPUT);
			return true;
		elseif ( string.match(msg, HoloFriends_WHO_NUM_RESULTS) ) then
			HoloFriends_chat("Intercepted who total: "..msg, HF_DEBUG_OUTPUT);
			HoloFriends_interceptWhoResults = 0;
			return true;
		end
	else
		HoloFriends_interceptWhoResults = 0;
	end
end


-- Prevent popup of who-window during scan in case of many who-results
function HoloFriends_FriendsFrame_OnEvent(self, event, ...)
	local skip = false;
	if ( (event == "WHO_LIST_UPDATE") and 
	     (GetTime() < (HoloFriends_interceptWhoResults + HoloFriends_whoCheckInterval)) )
	then
		skip = true;
	end
	if ( not skip ) then
		HFF_FriendsFrame_OnEvent_Orig(self, event, ...);
	end
end
