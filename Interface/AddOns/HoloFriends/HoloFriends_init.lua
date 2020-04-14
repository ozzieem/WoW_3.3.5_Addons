--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]


--[[

This file manages the initialisation of the addon.

]]


-- define some constants
HF_ONLINE = true;
HF_OFFLINE = nil;
HF_QUIET = true;
HF_UNQUIET = false;
HF_DISPLAY = true;
HF_DEBUG_OUTPUT = 1;
HF_HFLIST = true;
HF_HILIST = false;
HF_SHARE = true;

-- saved lists
HOLOFRIENDS_LIST = {};
HOLOIGNORE_LIST = {};
HOLOFRIENDS_FACTIONS = {};
HOLOFRIENDS_MYCHARS = {};

-- timer to run the list update only once a time
HoloFriends_ListUpdateRefTime = time();
HoloFriends_ListUpdateStartTime = HoloFriends_ListUpdateRefTime;
HoloFriends_ListUpdateMaxSec = 3;

-- show all online friends during login
HoloFriends_ShowOnlineChat = false;

HoloFriends_Loaded = false;


function HoloFriends_SlashCommand(msg)
	if ( not HoloFriends_Loaded ) then return; end

	local cmd, subCmd = HoloFriendsFuncs_SeparateFirstString(msg);

	if ( (cmd == "delete") and (subCmd ~= "") ) then
		local dialog = StaticPopup_Show("HOLOFRIENDS_DELETECHARDATA", subCmd);
		if ( dialog ) then
			dialog.data = subCmd;
		end
	end
end


-- check the faction list
local function HFF_CheckFactionList()
	local realm = GetCVar("realmName");
	local faction = UnitFactionGroup("player");
	local name = UnitName("player");

	local result = nil;
	local nlist = nil;
	local index = 0;

	-- create list if not existing
	result = HOLOFRIENDS_FACTIONS[realm];
	if ( not result ) then HOLOFRIENDS_FACTIONS[realm] = {}; end

	-- add faction if not existing
	result = HOLOFRIENDS_FACTIONS[realm][faction];
	if ( not result ) then HOLOFRIENDS_FACTIONS[realm][faction] = {}; end

	-- add list for chars with unknown faction if not existing
	result = HOLOFRIENDS_FACTIONS[realm]["unknown"];
	if ( not result ) then
		HOLOFRIENDS_FACTIONS[realm]["unknown"] = {};
		nlist = HOLOFRIENDS_FACTIONS[realm]["unknown"];
		-- add all chars of this realm to the "unknown" list
		local charList = HoloFriendsFuncs_RealmGetOwnChars(); 
		for key, pname in pairs(charList) do
			table.insert(nlist, pname);
		end
		table.sort(nlist, function (a,b) return a < b; end);
	end

	-- remove this char from "unknown" list, if included
	nlist = HOLOFRIENDS_FACTIONS[realm]["unknown"];
	index = 0;
	for idx = 1, table.getn(nlist) do
		if (nlist[idx] == name) then index = idx; end
	end
	if (index ~= 0) then table.remove(nlist, index); end

	-- add this char to faction list, if not included
	nlist = HOLOFRIENDS_FACTIONS[realm][faction];
	index = 0;
	for idx = 1, table.getn(nlist) do
		if (nlist[idx] == name) then index = idx; end
	end
	if (index == 0) then
		table.insert(nlist, name);
		table.sort(nlist, function (a,b) return a < b; end);
	end
end


-- check the mychars list
local function HFF_CheckMycharsList()
	local realm = GetCVar("realmName");
	local name = UnitName("player");
	local result = nil;

	result = HOLOFRIENDS_MYCHARS[realm];
	if ( not result ) then HOLOFRIENDS_MYCHARS[realm] = {}; end
	result = HOLOFRIENDS_MYCHARS[realm][name];
	if ( not result ) then HOLOFRIENDS_MYCHARS[realm][name] = {}; end

	-- add data from MYCHARS list to the actual loaded HoloFriends list
	local list = HoloFriends_GetList();
	for char, _ in pairs(HOLOFRIENDS_MYCHARS[realm]) do
		local index = HoloFriendsLists_ContainsPlayer(list, char);
		if ( index ) then
			local centry = HOLOFRIENDS_MYCHARS[realm][char];
			local lentry = list[index];
			if ( centry.class ) then lentry.class = centry.class; end
			if ( centry.lc_class ) then lentry.lc_class = centry.lc_class; end
			if ( centry.level ) then lentry.level = centry.level; end
			if ( centry.area ) then lentry.area = centry.area; end
			if ( centry.lastSeen ) then lentry.lastSeen = centry.lastSeen; end
		end
	end
end


-- init friends list window
local function HFF_OnLoad()
	-- init friends list drop down menu
	HoloFriends_InsertDropDown();

	-- modify the ADD_FRIEND popup
	StaticPopupDialogs["ADD_FRIEND"].OnAccept = function(self)
		HoloFriends_AddFriend(self.editBox:GetText());
	end
	StaticPopupDialogs["ADD_FRIEND"].EditBoxOnEnterPressed = function(self)
		HoloFriends_AddFriend(self:GetParent().editBox:GetText());
		self:GetParent():Hide();
	end

	-- modify the FRIEND command line commands
	SlashCmdList["FRIENDS"] = function(msg)
		local player, note = HoloFriendsFuncs_SeparateFirstString(msg);
		if ( (player ~= "") or (UnitIsPlayer("target") and UnitCanCooperate("player", "target")) ) then
			HoloFriends_AddFriend(player, note);
		else
			ToggleFriendsPanel();
		end
	end
	SlashCmdList["REMOVEFRIEND"] = function(msg)
		ToggleFriendsPanel();
	end

	-- hide the button on the drag item
	HoloFriendsNameButtonDrag:SetNormalTexture("");
	HoloFriendsNameButtonDragClassIcon:Hide();
	HoloFriendsNameButtonDragServer:Hide();
	HoloFriendsNameButtonDragName:SetPoint("TOPLEFT", "HoloFriendsNameButtonDrag", "TOPLEFT", 20, 0);
	HoloFriendsNameButtonDrag:Hide();

	-- load the friends list
	HoloFriends_LoadList();
end


-- init friends list window
local function HIF_OnLoad()
	-- init ignore list drop down menu
	HoloIgnore_InsertDropDown();

	-- modify the ADD_IGNORE popup
	StaticPopupDialogs["ADD_IGNORE"].OnAccept = function(self)
		HoloIgnore_AddIgnore(self.editBox:GetText());
	end
	StaticPopupDialogs["ADD_IGNORE"].EditBoxOnEnterPressed = function(self)
		HoloIgnore_AddIgnore(self:GetParent().editBox:GetText());
		self:GetParent():Hide();
	end

	-- modify the IGNORE command line commands
	SlashCmdList["IGNORE"] = function(msg)
		local player, note = HoloFriendsFuncs_SeparateFirstString(msg);
		if ( (player ~= "") or UnitIsPlayer("target") ) then
			HoloIgnore_AddIgnore(player, note);
		else
			ToggleIgnorePanel();
		end
	end
	SlashCmdList["UNIGNORE"] = function(msg)
		ToggleIgnorePanel();
	end

	-- hide the button on the drag item
	HoloIgnoreNameButtonDrag:SetNormalTexture("");
	HoloIgnoreNameButtonDragServer:Hide();
	HoloIgnoreNameButtonDragName:SetPoint("TOPLEFT", "HoloIgnoreNameButtonDrag", "TOPLEFT", 20, 0);
	HoloIgnoreNameButtonDrag:Hide();

	-- load the ignore list
	HoloIgnore_LoadList();
end


-- init all HoloFriends modules OnLoad
function HoloFriendsInit_OnLoadAll()
	-- Add a background texture to the default pull down menus
	getglobal("DropDownList1"):CreateTexture("DropDownList1_HoloFriendsBG", "BACKGROUND");

	-- setup of the options
	HoloFriendsOptions_VariablesLoaded();

	-- hook functions
	HoloFriendsHooks_OnLoad();

	-- insert additions to the drop down menus
	HoloFriends_AddToDropDown();

	-- init friends list specific parts
	HFF_OnLoad();
	HIF_OnLoad();
	HoloFriends_Loaded = true;

	-- init the faction list
	HFF_CheckFactionList();

	-- set own char entries from MYCHARS list
	HFF_CheckMycharsList();

	SlashCmdList["HOLOFRIENDS"] = HoloFriends_SlashCommand;
	SLASH_HOLOFRIENDS1 = "/holofriends";
	SLASH_HOLOFRIENDS2 = "/hfriends";

	if ( DEFAULT_CHAT_FRAME ) then
		local msg = format(HOLOFRIENDS_INITADDONLOADED, HoloFriendsFuncs_Version());
		HoloFriendsFuncs_SystemMessage(msg);
	end

	if ( HOLOFRIENDS_OPTIONS.ShowOnlineAtLogin ) then
		HoloFriends_ShowOnlineChat = true;
		HoloFriends_chat("HoloFriends_List_Update at login", HF_DEBUG_OUTPUT);
		HoloFriends_List_Update();
	end
end
