--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines static dialogs for *_friends, *_ignore and *_share

]]


-- scale the window to the text width
local function HFF_FormatDialogBox(self, which, width)
	local text = getglobal(self:GetName().."Text");
	local button1 = getglobal(self:GetName().."Button1");
	local minwidth = 300;
	if ( StaticPopupDialogs[which].button3 ) then minwidth = 420; end
	local maxwidth = 600;
	text:SetWidth(maxwidth);
	local twidth = text:GetStringWidth();
	if ( width ) then twidth = width; end
	if ( twidth < minwidth ) then twidth = minwidth; end
	text:SetWidth(twidth);
	self:SetWidth(text:GetWidth() + 40);
	self:SetHeight(16 + text:GetHeight() + 8 + button1:GetHeight() + 16);
	self:SetFrameStrata("TOOLTIP");
end


-- set a black opaque window background
local function HFF_SetOpaqueBG(self)
	local name = self:GetName();
	self:CreateTexture(name.."_HoloFriendsBG", "BACKGROUND");
	local tex = getglobal(name.."_HoloFriendsBG");
	tex:SetTexture([[Interface\ChatFrame\ChatFrameBackground]]);
	tex:SetPoint("TOPLEFT",self,"TOPLEFT",4,-5);
	tex:SetPoint("BOTTOMRIGHT",self,"BOTTOMRIGHT",-4,5);
	tex:SetVertexColor(0.0, 0.0, 0.0);
end


-- hide the black opaque window background and reset text-space
local function HFF_HideOpaqueBG(self)
	local name = self:GetName();
	local text = getglobal(name.."Text");
	text:SetWidth(300);
	local tex = getglobal(name.."_HoloFriendsBG");
	tex:SetTexture(nil);
	tex:ClearAllPoints();
end


-- erase the editBox on hide
local function HFF_EraseEditBox(self)
	ChatEdit_FocusActiveWindow();
	self.editBox:SetText("");
end


-- erase the editBox on hide
local function HFF_EraseWideEditBox(self)
	ChatEdit_FocusActiveWindow();
	self.wideEditBox:SetText("");
end


-- ---------------------------------------------------------------
-- HoloFriends dialogs
-- ---------------------------------------------------------------

-- dialog to add comment
StaticPopupDialogs["HOLOFRIENDS_ADDCOMMENT"] = {
	text = TEXT(SET_FRIENDNOTE_LABEL),
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 500,
	hasWideEditBox = 1,
	OnAccept = function(self)
		local index = HoloFriends_GetLastClickedIndex();
		local text = self.wideEditBox:GetText();
		HoloFriendsLists_SetComment(HoloFriends_GetList(), index, text, HF_HFLIST);
		HoloFriends_List_Update();
	end,
	OnShow = function(self)
		local index = HoloFriends_GetLastClickedIndex();
		HoloFriendsFuncs_CheckComment(index);
		local comment = HoloFriendsLists_GetComment(HoloFriends_GetList(), index);
		self:SetWidth(420);
		self.wideEditBox:SetText(comment);
		self.wideEditBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseWideEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		local parent = self:GetParent();
		local index = HoloFriends_GetLastClickedIndex();
		local text = parent.wideEditBox:GetText();
		HoloFriendsLists_SetComment(HoloFriends_GetList(), index, text, HF_HFLIST);
		HoloFriends_List_Update();
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog for adding groups
StaticPopupDialogs["HOLOFRIENDS_ADDGROUP"] = {
	text = TEXT(HOLOFRIENDS_WINDOWMAINADDGROUP),
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 29,
	OnAccept = function(self)
		HoloFriendsLists_AddGroup(HoloFriends_GetList(), self.editBox:GetText());
		HoloFriends_DeselectEntry();
		HoloFriends_List_Update();
		if ( HoloFriends_ShareFrame:IsVisible() ) then
			HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
		end
	end,
	OnShow = function(self)
		self.editBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		local parent = self:GetParent();
		HoloFriendsLists_AddGroup(HoloFriends_GetList(), parent.editBox:GetText());
		HoloFriends_DeselectEntry();
		HoloFriends_List_Update();
		if ( HoloFriends_ShareFrame:IsVisible() ) then
			HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
		end
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog for renaming groups
StaticPopupDialogs["HOLOFRIENDS_RENAMEGROUP"] = {
	text = TEXT(HOLOFRIENDS_WINDOWMAINRENAMEGROUP),
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 29,
	OnAccept = function(self)
		local index = HoloFriends_GetLastClickedIndex();
		local text = self.editBox:GetText();
		HoloFriendsLists_RenameGroup(HoloFriends_GetList(), index, text);
		HoloFriends_DeselectEntry();
		HoloFriends_List_Update();
		if ( HoloFriends_ShareFrame:IsVisible() ) then
			HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
		end
	end,
	OnShow = function(self)
		local index = HoloFriends_GetLastClickedIndex();
		local group = HoloFriendsLists_GetGroup(HoloFriends_GetList(), index);
		self.editBox:SetText(group);
		self.editBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		local parent = self:GetParent();
		local index = HoloFriends_GetLastClickedIndex();
		local text = parent.editBox:GetText();
		HoloFriendsLists_RenameGroup(HoloFriends_GetList(), index, text);
		HoloFriends_DeselectEntry();
		HoloFriends_List_Update();
		if ( HoloFriends_ShareFrame:IsVisible() ) then
			HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
		end
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog for deleting a char
StaticPopupDialogs["HOLOFRIENDS_DELETECHARDATA"] = {
	text = HOLOFRIENDS_MSGDELETECHARDIALOG,
	button1 = TEXT(OKAY),
	button2 = TEXT(CANCEL),
	OnAccept = function(self) HoloFriendsFuncs_DeleteChar(self.data); end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog to load the faction wide ignore list if not used for a long time
StaticPopupDialogs["HOLOFRIENDS_LOADFACTIONSFRIENDSLIST"] = {
	text = HOLOFRIENDS_INITLOADFACTIONSFRIENDSLIST,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		local list = HoloFriends_GetList();
		local index = HoloFriendsLists_ContainsGroup(list, FRIENDS);
		-- check that the list is realy the temporary one
		if ( list[index].temporary ) then
			-- mark it to be removed and replaced by the faction wide friends list
			list[index].remove = 1;
			HoloFriends_LoadList();
			HoloFriends_List_Update();
			if ( HoloFriends_ShareFrame:IsVisible() ) then
				HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
			end
		end
	end,
	OnCancel = function (self)
		local list = HoloFriends_GetList();
		local index = HoloFriendsLists_ContainsGroup(list, FRIENDS);
		-- remove temporary state and continue to use this list
		list[index].temporary = nil;
		if ( HoloFriends_ShareFrame:IsVisible() ) then
			HoloFriends_List_Update();
			HoloFriendsShare_OnShow(HoloFriends_ShareFrame);
		end
	end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
};

-- ---------------------------------------------------------------
-- HoloIgnore dialogs
-- ---------------------------------------------------------------

-- dialog to add comment
StaticPopupDialogs["HOLOIGNORE_ADDCOMMENT"] = {
	text = TEXT(SET_FRIENDNOTE_LABEL),
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 500,
	hasWideEditBox = 1,
	OnAccept = function(self)
		local index = HoloIgnore_GetLastClickedIndex();
		local text = self.wideEditBox:GetText();
		HoloFriendsLists_SetComment(HoloIgnore_GetList(), index, text);
		HoloIgnore_List_Update();
	end,
	OnShow = function(self)
		local index = HoloIgnore_GetLastClickedIndex();
		local comment = HoloFriendsLists_GetComment(HoloIgnore_GetList(), index);
		self:SetWidth(420);
		self.wideEditBox:SetText(comment);
		self.wideEditBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseWideEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		local parent = self:GetParent();
		local index = HoloIgnore_GetLastClickedIndex();
		local text = parent.wideEditBox:GetText();
		HoloFriendsLists_SetComment(HoloIgnore_GetList(), index, text);
		HoloIgnore_List_Update();
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog for adding groups
StaticPopupDialogs["HOLOIGNORE_ADDGROUP"] = {
	text = TEXT(HOLOFRIENDS_WINDOWMAINADDGROUP),
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 29,
	OnAccept = function(self)
		HoloFriendsLists_AddGroup(HoloIgnore_GetList(), self.editBox:GetText());
		HoloIgnore_DeselectEntry();
		HoloIgnore_List_Update();
	end,
	OnShow = function(self)
		self.editBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		local parent = self:GetParent();
		HoloFriendsLists_AddGroup(HoloIgnore_GetList(), parent.editBox:GetText());
		HoloIgnore_DeselectEntry();
		HoloIgnore_List_Update();
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog for renaming groups
StaticPopupDialogs["HOLOIGNORE_RENAMEGROUP"] = {
	text = TEXT(HOLOFRIENDS_WINDOWMAINRENAMEGROUP),
	button1 = TEXT(ACCEPT),
	button2 = TEXT(CANCEL),
	hasEditBox = 1,
	maxLetters = 29,
	OnAccept = function(self)
		local index = HoloIgnore_GetLastClickedIndex();
		local text = self.editBox:GetText();
		HoloFriendsLists_RenameGroup(HoloIgnore_GetList(), index, text);
		HoloIgnore_DeselectEntry();
		HoloIgnore_List_Update();
	end,
	OnShow = function(self)
		local index = HoloIgnore_GetLastClickedIndex();
		local group = HoloFriendsLists_GetGroup(HoloIgnore_GetList(), index);
		self.editBox:SetText(group);
		self.editBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		local parent = self:GetParent();
		local index = HoloIgnore_GetLastClickedIndex();
		local text = parent.editBox:GetText();
		HoloFriendsLists_RenameGroup(HoloIgnore_GetList(), index, text);
		HoloIgnore_DeselectEntry();
		HoloIgnore_List_Update();
		parent:Hide();
	end,
	EditBoxOnEscapePressed = function(self) self:GetParent():Hide(); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

-- the dialog to load the faction wide friends list if not used for a long time
StaticPopupDialogs["HOLOFRIENDS_LOADFACTIONSIGNORELIST"] = {
	text = HOLOFRIENDS_INITLOADFACTIONIGNORELIST,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		local list = HoloIgnore_GetList();
		local index = HoloFriendsLists_ContainsGroup(list, IGNORE);
		-- check that the list is realy the temporary one
		if ( list[index].temporary ) then
			-- mark it to be removed and replaced by the faction wide friends list
			list[index].remove = 1;
			HoloIgnore_LoadList();
			HoloIgnore_List_Update();
		end
	end,
	OnCancel = function (self)
		local list = HoloFriends_GetList();
		local index = HoloFriendsLists_ContainsGroup(list, FRIENDS);
		-- remove temporary state and continue to use this list
		list[index].temporary = nil;
	end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
};

-- ---------------------------------------------------------------
-- HoloShare dialogs
-- ---------------------------------------------------------------

-- the dialog for merging friends to the factions friends list
StaticPopupDialogs["HOLOSHARE_FRIENDSMERGEFACTION"] = {
	text = HOLOFRIENDS_DIALOGFACTIONMERGEFRIENDWARNING,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self) self:Hide(); HoloFriendsShare_MergeGroupsDialog(HoloFriends_ShareFrame); end,
	OnCancel = function (self) HoloFriendsFuncs_SystemMessage(HOLOFRIENDS_MSGFACTIONNOMERGE); end,
	OnUpdate = function(self) HFF_FormatDialogBox(self,"HOLOSHARE_FRIENDSMERGEFACTION"); end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
};


-- the dialog for merging ignore to the factions ignore list
StaticPopupDialogs["HOLOSHARE_IGNOREMERGEFACTION"] = {
	text = HOLOFRIENDS_DIALOGFACTIONMERGEIGNOREWARNING,
	button1 = YES,
	button2 = NO,
	OnAccept = function(self) self:Hide(); HoloFriendsShare_MergeGroupsDialog(HoloIgnore_ShareFrame); end,
	OnCancel = function (self) HoloFriendsFuncs_SystemMessage(HOLOFRIENDS_MSGFACTIONNOMERGE); end,
	OnUpdate = function(self) HFF_FormatDialogBox(self,"HOLOSHARE_IGNOREMERGEFACTION"); end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
};


-- dialog to ask for the use of the groups of the friends list during merging to the factions friends list
StaticPopupDialogs["HOLOSHARE_FRIENDSMERGEFACTIONGROUPS"] = {
	text = HOLOFRIENDS_DIALOGFACTIONASKMERGEFRIENDGROUPS,
	button1 = YES,
	button3 = NO,
	button2 = CANCEL,
	OnAccept = function(self) HoloFriendsShare_MergeChar(HoloFriends_ShareFrame, true); end,
	OnAlt = function(self) HoloFriendsShare_MergeChar(HoloFriends_ShareFrame, false); end,
	OnCancel = function (self) HoloFriendsFuncs_SystemMessage(HOLOFRIENDS_MSGFACTIONNOMERGE); end,
	OnUpdate = function(self) HFF_FormatDialogBox(self,"HOLOSHARE_FRIENDSMERGEFACTIONGROUPS", 420); end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
};


-- dialog to ask for the use of the groups of the ignore list during merging to the factions ignore list
StaticPopupDialogs["HOLOSHARE_IGNOREMERGEFACTIONGROUPS"] = {
	text = HOLOFRIENDS_DIALOGFACTIONASKMERGEIGNOREGROUPS,
	button1 = YES,
	button3 = NO,
	button2 = CANCEL,
	OnAccept = function(self) HoloFriendsShare_MergeChar(HoloIgnore_ShareFrame, true); end,
	OnAlt = function(self) HoloFriendsShare_MergeChar(HoloIgnore_ShareFrame, false); end,
	OnCancel = function (self) HoloFriendsFuncs_SystemMessage(HOLOFRIENDS_MSGFACTIONNOMERGE); end,
	OnUpdate = function(self) HFF_FormatDialogBox(self,"HOLOSHARE_IGNOREMERGEFACTIONGROUPS", 420); end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
};


-- the dialog for merging a char to the factions friends list
StaticPopupDialogs["HOLOSHARE_FRIENDSMERGEFACTIONPRIORITY"] = {
	text = HOLOFRIENDS_DIALOGFACTIONPRIORITYFRIENDWARNING,
	button1 = CONTINUE,
	button2 = CANCEL,
	OnAccept = function(self) HoloFriendsShare_MergeChar(HoloFriends_ShareFrame, true); end,
	OnCancel = function (self) HoloFriendsFuncs_SystemMessage(HOLOFRIENDS_MSGFACTIONNOMERGE); end,
	OnUpdate = function(self) HFF_FormatDialogBox(self,"HOLOSHARE_FRIENDSMERGEFACTIONPRIORITY", 300); end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
};


-- the dialog for merging a char to the factions ignore list
StaticPopupDialogs["HOLOSHARE_IGNOREMERGEFACTIONPRIORITY"] = {
	text = HOLOFRIENDS_DIALOGFACTIONPRIORITYIGNOREWARNING,
	button1 = CONTINUE,
	button2 = CANCEL,
	OnAccept = function(self) HoloFriendsShare_MergeChar(HoloIgnore_ShareFrame, true); end,
	OnCancel = function (self) HoloFriendsFuncs_SystemMessage(HOLOFRIENDS_MSGFACTIONNOMERGE); end,
	OnUpdate = function(self) HFF_FormatDialogBox(self,"HOLOSHARE_IGNOREMERGEFACTIONPRIORITY", 300); end,
	OnShow = function(self) HFF_SetOpaqueBG(self); end,
	OnHide = function(self) HFF_HideOpaqueBG(self); end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1,
};

-- ---------------------------------------------------------------
-- HoloOptions dialogs
-- ---------------------------------------------------------------

-- the dialog to change the date and time format
StaticPopupDialogs["HOLOOPTIONS_DATEFORMAT"] = {
	text = TEXT(HOLOFRIENDS_DIALOGDATEFORMAT),
	button1 = CONTINUE,
	hasEditBox = 1,
	maxLetters = 39,
	hasWideEditBox = 1,
	OnAccept = function(self)
		HoloFriends_TempTTDateFormat = self.wideEditBox:GetText();
		local text = HOLOFRIENDS_OPTIONS1SETDATEFORMAT.." ("..HoloFriends_TempTTDateFormat..")";
		HoloFriends_OptionsFrameScrollChild_ID7_Text:SetText(text);
	end,
	OnShow = function(self)
		self.wideEditBox:SetText(HoloFriends_TempTTDateFormat);
		self:SetWidth(420);
		getglobal(self:GetName().."Text"):SetWidth(390);
		self.wideEditBox:SetFocus();
	end,
	OnHide = function(self) HFF_EraseWideEditBox(self); end,
	EditBoxOnEnterPressed = function(self)
		HoloFriends_TempTTDateFormat = self.wideEditBox:GetText();
		local text = HOLOFRIENDS_OPTIONS1SETDATEFORMAT.." ("..HoloFriends_TempTTDateFormat..")";
		HoloFriends_OptionsFrameScrollChild_ID7_Text:SetText(text);
		parent:Hide();
	end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
};
