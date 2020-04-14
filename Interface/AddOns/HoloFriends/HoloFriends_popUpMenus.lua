--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines pop-up-menus for *_friends and *_ignore

]]

HoloFriends_MenuModTDone = false;
HoloFriends_MenuModPDone = false;
HoloFriends_MenuModRDone = false;
HoloFriends_MenuModFDone = false;


-- BEGIN OF LIST DROP DOWN MENU

function HoloFriends_AddToDropDown()
	-- list drop down
	UnitPopupButtons["HOLOFRIENDS_ADDCOMMENT"]  = { text = TEXT(HOLOFRIENDS_WINDOWMAINADDCOMMENT), dist = 0 };
	UnitPopupButtons["HOLOFRIENDS_RENAMEGROUP"] = { text = TEXT(HOLOFRIENDS_WINDOWMAINRENAMEGROUP), dist = 0 };
	UnitPopupButtons["HOLOFRIENDS_REMOVEGROUP"] = { text = TEXT(HOLOFRIENDS_WINDOWMAINREMOVEGROUP), dist = 0 };
	UnitPopupButtons["HOLOFRIENDS_ADDFRIEND"]   = { text = TEXT(ADD_FRIEND), dist = 0 };
	UnitPopupButtons["HOLOFRIENDS_ADDIGNORE"]   = { text = TEXT(IGNORE_PLAYER), dist = 0 };
	UnitPopupButtons["HOLOFRIENDS_WHOREQUEST"]  = { text = TEXT(HOLOFRIENDS_WINDOWMAINWHOREQUEST), dist = 0 };
	UnitPopupButtons["HOLOFRIENDS_INVITE"]      = { text = TEXT(INVITE), dist = 0 };

	--extend the existing drop down menus
	if ( HOLOFRIENDS_OPTIONS.MenuModT ) then
		HoloFriends_MenuModTDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["PLAYER"]);
	end
	if ( HOLOFRIENDS_OPTIONS.MenuModP ) then
		HoloFriends_MenuModPDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["PARTY"]);
	end
	if ( HOLOFRIENDS_OPTIONS.MenuModR ) then
		HoloFriends_MenuModRDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["RAID"]);
	end
	if ( HOLOFRIENDS_OPTIONS.MenuModF ) then
		HoloFriends_MenuModFDone = true;
		HoloFriends_ExtendDropdown(UnitPopupMenus["FRIEND"]);
	end
end


function HoloFriends_ExtendDropdown(dropdown)
	if ( not (dropdown and type(dropdown) == "table") ) then
		return;
	end

	table.insert(dropdown, table.getn(dropdown), "HOLOFRIENDS_ADDFRIEND");
	table.insert(dropdown, table.getn(dropdown), "HOLOFRIENDS_ADDIGNORE");
	table.insert(dropdown, table.getn(dropdown), "HOLOFRIENDS_WHOREQUEST");
end


function HoloFriends_InsertDropDown()
	UnitPopupMenus["HOLOFRIENDS_LIST"] = {	"WHISPER",
						"HOLOFRIENDS_INVITE",
						"HOLOFRIENDS_ADDCOMMENT",
						"HOLOFRIENDS_RENAMEGROUP",
						"HOLOFRIENDS_REMOVEGROUP",
						"HOLOFRIENDS_WHOREQUEST",
						"CANCEL" };
end


function HoloIgnore_InsertDropDown()
	UnitPopupMenus["HOLOIGNORE_LIST"] = {	"HOLOFRIENDS_ADDCOMMENT",
						"HOLOFRIENDS_RENAMEGROUP",
						"HOLOFRIENDS_REMOVEGROUP",
						"CANCEL" };
end

-- END OF LIST DROP DOWN MENU


-- HoloFriends specific functions

function HoloFriends_ListDropDown_Initialize()
	UnitPopup_ShowMenu(UIDROPDOWNMENU_OPEN_MENU,
			   "HOLOFRIENDS_LIST",
			   nil,
			   HoloFriendsDropDown.name,
			   HoloFriendsDropDown.userData);
end


function HoloFriends_ShowListDropdown(id)
	local list = HoloFriends_GetList();

	HideDropDownMenu(1);

	HoloFriendsDropDown.initialize = HoloFriends_ListDropDown_Initialize;
	HoloFriendsDropDown.displayMode = "MENU";
	HoloFriendsDropDown.name = HoloFriendsLists_GetName(list, id, HF_DISPLAY);
	HoloFriendsDropDown.userData = id;
	ToggleDropDownMenu(1, nil, HoloFriendsDropDown, "cursor");
	local myself = 0;
	if ( HoloFriendsLists_GetName(list, id) == UnitName("player")) then myself = 1; end

	-- hide the whisper, invite, and who buttons, if player offline
	if ( not HoloFriendsLists_IsConnected(list, id) ) then
		UIDropDownMenu_DisableButton(1, 2);
		UIDropDownMenu_DisableButton(1, 3 - myself);
		UIDropDownMenu_DisableButton(1, 7 - myself);
	end

	-- hide the who and invite button, if different faction, or realm
	if ( HoloFriendsLists_IsRealID(list, id) ) then
		if ( not HoloFriendsLists_SameFaction(list, id) or
		     not HoloFriendsLists_SameRealm(list, id) ) then
			UIDropDownMenu_DisableButton(1, 3);
			UIDropDownMenu_DisableButton(1, 7);
		end
	end

	-- hide the remove, and rename group button, if no group
	if ( not HoloFriendsLists_IsGroup(list, id) or 
	     HoloFriendsLists_GetGroup(list, id) == FRIENDS )
	then
		UIDropDownMenu_DisableButton(1, 5 - myself);
		UIDropDownMenu_DisableButton(1, 6 - myself);
	end
end

-- end of HoloFriends specific functions


-- HoloIgnore specific functions

function HoloIgnore_ListDropDown_Initialize()
	UnitPopup_ShowMenu(UIDROPDOWNMENU_OPEN_MENU,
			   "HOLOIGNORE_LIST",
			   nil,
			   HoloIgnoreDropDown.name,
			   HoloIgnoreDropDown.userData);
end


function HoloIgnore_ShowListDropdown(id)
	local list = HoloIgnore_GetList();

	HideDropDownMenu(1);

	HoloIgnoreDropDown.initialize = HoloIgnore_ListDropDown_Initialize;
	HoloIgnoreDropDown.displayMode = "MENU";
	HoloIgnoreDropDown.name = HoloFriendsLists_GetName(list, id, HF_DISPLAY);
	HoloIgnoreDropDown.userData = id;
	ToggleDropDownMenu(1, nil, HoloIgnoreDropDown, "cursor");

	-- hide the remove, and rename group button, if no group
	if( not HoloFriendsLists_IsGroup(list, id) or 
	    HoloFriendsLists_GetGroup(list, id) == IGNORE )
	then
		UIDropDownMenu_DisableButton(1, 3);
		UIDropDownMenu_DisableButton(1, 4);
	end
end

-- end of HoloFriends specific functions
