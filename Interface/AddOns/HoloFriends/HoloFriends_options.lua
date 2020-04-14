--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]


local HF_Options_Loaded = false;

-- define all the names of the options
local HF_OptionNames = {};
HF_OptionNames[1]  = "ShowClassIcons";
HF_OptionNames[2]  = "ShowClassColor";
HF_OptionNames[3]  = "ShowLevel";
HF_OptionNames[4]  = "BNShowCharName";
HF_OptionNames[5]  = "ShowGroups";
HF_OptionNames[6]  = "SortOnline";
HF_OptionNames[7]  = "SetDateFormat";
HF_OptionNames[8]  = "MergeNotes";
HF_OptionNames[9]  = "NotesPriorityOn";
HF_OptionNames[10]  = "NotesPriorityOff";
HF_OptionNames[11] = "MergeComments";
HF_OptionNames[12] = "MarkRemove";
HF_OptionNames[13] = "MenuModT";
HF_OptionNames[14] = "MenuModP";
HF_OptionNames[15] = "MenuModR";
HF_OptionNames[16] = "MenuModF";
HF_OptionNames[17] = "ShowDropdownBG";
HF_OptionNames[18] = "ShowDropdownAllBG";
HF_OptionNames[19] = "ShowOnlineAtLogin";
HF_OptionNames[20] = "MsgIgnoredWhisper";

-- define the defaults for all options
local HF_DefaultOptions = {};
HF_DefaultOptions[1]  = true;
HF_DefaultOptions[2]  = true;
HF_DefaultOptions[3]  = false;
HF_DefaultOptions[4]  = true;
HF_DefaultOptions[5]  = true;
HF_DefaultOptions[6]  = false;
HF_DefaultOptions[7]  = false;
HF_DefaultOptions[8]  = true; -- trigger for option 9 and 10
HF_DefaultOptions[9]  = false;
HF_DefaultOptions[10]  = false;
HF_DefaultOptions[11] = true;
HF_DefaultOptions[12]  = true;
HF_DefaultOptions[13] = true;
HF_DefaultOptions[14] = true;
HF_DefaultOptions[15] = true;
HF_DefaultOptions[16] = true;
HF_DefaultOptions[17] = true;
HF_DefaultOptions[18] = false;
HF_DefaultOptions[19] = false;
HF_DefaultOptions[20] = true;

-- temporary options for the options pannel
local HF_TempOptions = {};
for index = 1, table.getn(HF_DefaultOptions) do
	HF_TempOptions[index] = HF_DefaultOptions[index];
end
HoloFriends_TempTTDateFormat = HOLOFRIENDS_TOOLTIPDATEFORMAT;

-- copy the option strings to the strings array (numbered by the IDs)
local HF_OptionStrings = {};
HF_OptionStrings[1]  = HOLOFRIENDS_OPTIONS1SECTIONFLW;
HF_OptionStrings[2]  = HOLOFRIENDS_OPTIONS1SHOWCLASSICONS;
HF_OptionStrings[3]  = HOLOFRIENDS_OPTIONS1SHOWCLASSCOLOR;
HF_OptionStrings[4]  = HOLOFRIENDS_OPTIONS1SHOWLEVEL;
HF_OptionStrings[5]  = HOLOFRIENDS_OPTIONS1BNSHOWCHARNAME;
HF_OptionStrings[6]  = HOLOFRIENDS_OPTIONS1SHOWGROUPS;
HF_OptionStrings[7]  = HOLOFRIENDS_OPTIONS1SORTONLINE;
HF_OptionStrings[8]  = HOLOFRIENDS_OPTIONS1SETDATEFORMAT;
HF_OptionStrings[9]  = HOLOFRIENDS_OPTIONS2SECTIONNOTES;
HF_OptionStrings[10]  = HOLOFRIENDS_OPTIONS2MERGENOTES.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0NOTFACTION..")|r";
HF_OptionStrings[11] = HOLOFRIENDS_OPTIONS2NOTESPRIORITYON;
HF_OptionStrings[12] = HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFF.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0REALID..")|r";
HF_OptionStrings[13] = HOLOFRIENDS_OPTIONS3SECTIONSHARE;
HF_OptionStrings[14] = HOLOFRIENDS_OPTIONS3MERGECOMMENTS.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0NEEDACCEPT..")|r";
HF_OptionStrings[15] = HOLOFRIENDS_OPTIONS3MARKREMOVE;
HF_OptionStrings[16] = HOLOFRIENDS_OPTIONS4SECTIONMENU;
HF_OptionStrings[17] = HOLOFRIENDS_OPTIONS4MENUMODT.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0NEEDRELOAD..")|r";
HF_OptionStrings[18] = HOLOFRIENDS_OPTIONS4MENUMODP.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0NEEDRELOAD..")|r";
HF_OptionStrings[19] = HOLOFRIENDS_OPTIONS4MENUMODR.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0NEEDRELOAD..")|r";
HF_OptionStrings[20] = HOLOFRIENDS_OPTIONS4MENUMODF.."\n|cffffd200("..HOLOFRIENDS_OPTIONS0NEEDRELOAD..")|r";
HF_OptionStrings[21] = HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBG;
HF_OptionStrings[22] = HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBG;
HF_OptionStrings[23] = HOLOFRIENDS_OPTIONS5SECTIONMENU;
HF_OptionStrings[24] = HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGIN;
HF_OptionStrings[25] = HOLOFRIENDS_OPTIONS6SECTIONMENU;
HF_OptionStrings[26] = HOLOFRIENDS_OPTIONS6MSGIGNOREDWHISPER;

-- copy the option tooltip strings to the strings array (numbered by the IDs)
local HF_ToolTipStrings = {};
HF_ToolTipStrings[1]  = "";
HF_ToolTipStrings[2]  = HOLOFRIENDS_OPTIONS1SHOWCLASSICONSTT;
HF_ToolTipStrings[3]  = HOLOFRIENDS_OPTIONS1SHOWCLASSCOLORTT;
HF_ToolTipStrings[4]  = HOLOFRIENDS_OPTIONS1SHOWLEVELTT;
HF_ToolTipStrings[5]  = HOLOFRIENDS_OPTIONS1BNSHOWCHARNAMETT;
HF_ToolTipStrings[6]  = HOLOFRIENDS_OPTIONS1SHOWGROUPSTT;
HF_ToolTipStrings[7]  = HOLOFRIENDS_OPTIONS1SORTONLINETT;
HF_ToolTipStrings[8]  = HOLOFRIENDS_OPTIONS1SETDATEFORMATTT;
HF_ToolTipStrings[9]  = "";
HF_ToolTipStrings[10]  = HOLOFRIENDS_OPTIONS2MERGENOTESTT;
HF_ToolTipStrings[11] = HOLOFRIENDS_OPTIONS2NOTESPRIORITYONTT;
HF_ToolTipStrings[12] = HOLOFRIENDS_OPTIONS2NOTESPRIORITYOFFTT;
HF_ToolTipStrings[13] = "";
HF_ToolTipStrings[14] = HOLOFRIENDS_OPTIONS3MERGECOMMENTSTT;
HF_ToolTipStrings[15] = HOLOFRIENDS_OPTIONS3MARKREMOVETT;
HF_ToolTipStrings[16] = "";
HF_ToolTipStrings[17] = HOLOFRIENDS_OPTIONS4MENUMODTT;
HF_ToolTipStrings[18] = HOLOFRIENDS_OPTIONS4MENUMODTT;
HF_ToolTipStrings[19] = HOLOFRIENDS_OPTIONS4MENUMODTT;
HF_ToolTipStrings[20] = HOLOFRIENDS_OPTIONS4MENUMODTT;
HF_ToolTipStrings[21] = HOLOFRIENDS_OPTIONS4SHOWDROPDOWNBGTT;
HF_ToolTipStrings[22] = HOLOFRIENDS_OPTIONS4SHOWDROPDOWNALLBGTT;
HF_ToolTipStrings[23] = "";
HF_ToolTipStrings[24] = HOLOFRIENDS_OPTIONS5SHOWONLINEATLOGINTT;
HF_ToolTipStrings[25] = "";
HF_ToolTipStrings[26] = HOLOFRIENDS_OPTIONS6MSGIGNOREDWHISPERTT;

-- relate all the IDs to the options
local HF_OptionIDs = {};
local idx = 0;
for index = 1, table.getn(HF_ToolTipStrings) do
	if ( HF_ToolTipStrings[index] ~= "" ) then
		idx = idx + 1;
		HF_OptionIDs[index] = idx;
	else
		HF_OptionIDs[index] = 0;
	end
end

local HF_FAQStrings = {};
-- FAQ
HF_FAQStrings[1] = "|cffffd200"..HOLOFRIENDS_FAQ011QUESTION.."|r\n"..HOLOFRIENDS_FAQ012ANSWER;
HF_FAQStrings[2] = "|cffffd200"..HOLOFRIENDS_FAQ21QUESTION.."|r\n"..HOLOFRIENDS_FAQ22ANSWER;
HF_FAQStrings[3] = "|cffffd200"..HOLOFRIENDS_FAQ31QUESTION.."|r\n"..HOLOFRIENDS_FAQ32ANSWER;
HF_FAQStrings[4] = "|cffffd200"..HOLOFRIENDS_FAQ41QUESTION.."|r\n"..HOLOFRIENDS_FAQ42ANSWER;
HF_FAQStrings[5] = "|cffffd200"..HOLOFRIENDS_FAQ51QUESTION.."|r\n"..HOLOFRIENDS_FAQ52ANSWER;
HF_FAQStrings[6] = "|cffffd200"..HOLOFRIENDS_FAQ61QUESTION.."|r\n"..HOLOFRIENDS_FAQ62ANSWER;
HF_FAQStrings[7] = "|cffffd200"..HOLOFRIENDS_FAQ71QUESTION.."|r\n"..HOLOFRIENDS_FAQ72ANSWER;
HF_FAQStrings[8] = "|cffffd200"..HOLOFRIENDS_FAQ81QUESTION.."|r\n"..HOLOFRIENDS_FAQ82ANSWER;
HF_FAQStrings[9] = "|cffffd200"..HOLOFRIENDS_FAQ091QUESTION.."|r\n"..HOLOFRIENDS_FAQ092ANSWER;
HF_FAQStrings[10] = "|cffffd200"..HOLOFRIENDS_FAQ101QUESTION.."|r\n"..HOLOFRIENDS_FAQ102ANSWER;
HF_FAQStrings[11] = "|cffffd200"..HOLOFRIENDS_FAQ111QUESTION.."|r\n"..HOLOFRIENDS_FAQ112ANSWER;

-- feature list upended to the FAQ
idx = 12;
HF_FAQStrings[idx] = "|cffffd200"..HOLOFRIENDS_LISTFEATURES0TITLE.."|r";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES11.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES12;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES13.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES14;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES15.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES16.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES17.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES18;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES19.." (|cffff0000"..NEW.."|r)";
idx = 13;
HF_FAQStrings[idx] = "- "..HOLOFRIENDS_LISTFEATURES21;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES22;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES23;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES24;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES25.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES26;
idx = 14;
HF_FAQStrings[idx] = "- "..HOLOFRIENDS_LISTFEATURES31;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES32;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES33;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES34;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES35;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES36;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES37.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES38.." (|cffff0000"..NEW.."|r)";
idx = 15;
HF_FAQStrings[idx] = "- "..HOLOFRIENDS_LISTFEATURES41;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES42;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES43;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES44;
idx = 16;
HF_FAQStrings[idx] = "- "..HOLOFRIENDS_LISTFEATURES51.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES52.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES53;
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES54.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES55.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES56.." (|cffff0000"..NEW.."|r)";
HF_FAQStrings[idx] = HF_FAQStrings[idx].."\n- "..HOLOFRIENDS_LISTFEATURES57.." (|cffff0000"..NEW.."|r)";

function HoloFriendsFAQ_OnLoad(self)
	self.name = HELP_LABEL;
	self.parent = HOLOFRIENDS_OPTIONS0LISTENTRY;
	InterfaceOptions_AddCategory(self);
end


-- executed if every text field in the FAQ frame is loaded
function HoloFriendsOptions_FAQ_OnLoad(self)
	local tname = self:GetName().."_Text";
	local text = HF_FAQStrings[self:GetID()];
	getglobal(tname):SetText(text);
end


function HoloFriendsOptions_OnLoad(self)
	self.name = HOLOFRIENDS_OPTIONS0LISTENTRY;
	self.okay = function (self) HoloFriendsOptions_Okay(); end;
	self.cancel = function (self) HoloFriendsOptions_Cancel(); end;
	self.default = function (self) HoloFriendsOptions_SetAllToDefault(); end;
	InterfaceOptions_AddCategory(self);
end


-- executet by HoloFriends_OnLoad
function HoloFriendsOptions_VariablesLoaded()
	-- initialize our SavedVariable
	if ( not HOLOFRIENDS_OPTIONS ) then 
	 	HOLOFRIENDS_OPTIONS = {}; 
	end

	-- load each option, set default if not there
	for index = 1, table.getn(HF_TempOptions) do
		if ( HOLOFRIENDS_OPTIONS[HF_OptionNames[index]] == nil ) then
			HOLOFRIENDS_OPTIONS[HF_OptionNames[index]] = HF_DefaultOptions[index];
		else
			HF_TempOptions[index] = HOLOFRIENDS_OPTIONS[HF_OptionNames[index]];
		end
	end
	if ( not HOLOFRIENDS_OPTIONS.TTDateFormat ) then
		HOLOFRIENDS_OPTIONS.TTDateFormat = HOLOFRIENDS_TOOLTIPDATEFORMAT;
	end
	if ( not HOLOFRIENDS_OPTIONS.SetDateFormat ) then
		HOLOFRIENDS_OPTIONS.TTDateFormat = HOLOFRIENDS_TOOLTIPDATEFORMAT;
	end
	HoloFriends_TempTTDateFormat = HOLOFRIENDS_OPTIONS.TTDateFormat;

	-- record that we have been loaded
	HF_Options_Loaded = true;

	-- apply the options
	HoloFriendsOptions_Apply();
end


-- executed if every text field in the option frame is loaded
function HoloFriendsOptions_Text_OnLoad(self)
	local chapter = ( HF_ToolTipStrings[self:GetID()] == "" );
	local cname = self:GetName().."_Chapter";
	local tname = self:GetName().."_Text";
	local bname = self:GetName().."_Button";
	local text = HF_OptionStrings[self:GetID()];
	if ( chapter ) then
		getglobal(cname):SetText(text);
		getglobal(tname):Hide();
		getglobal(bname):Hide();
	else
		getglobal(cname):Hide();
		getglobal(tname):SetText(text);
	end
end


-- executed if the options window is shown
function HoloFriendsOptions_OnShow()
	-- make sure that our profile has been loaded
	if ( not HF_Options_Loaded ) then
		return;
	end

	local button;
	for index = 1, table.getn(HF_OptionIDs) do
		if ( HF_OptionIDs[index] > 0 ) then
			button = getglobal("HoloFriends_OptionsFrameScrollChild_ID"..index.."_Button");
			button:SetChecked(HF_TempOptions[HF_OptionIDs[index]]);
		end
	end

	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOFRIENDS_LIST, UnitName("player"));
	if ( HF_TempOptions[8] and NotFaction ) then
		HoloFriends_OptionsFrameScrollChild_ID11_Button:Enable();
		HoloFriends_OptionsFrameScrollChild_ID11_Text:SetTextColor(1.0,1.0,1.0);
		HoloFriends_OptionsFrameScrollChild_ID12_Button:Disable();
		HoloFriends_OptionsFrameScrollChild_ID12_Text:SetTextColor(0.4,0.4,0.4);
	else
		if ( not NotFaction ) then
			HoloFriends_OptionsFrameScrollChild_ID10_Button:Disable();
			HoloFriends_OptionsFrameScrollChild_ID10_Text:SetTextColor(0.4,0.4,0.4);
		end
		HoloFriends_OptionsFrameScrollChild_ID11_Button:Disable();
		HoloFriends_OptionsFrameScrollChild_ID11_Text:SetTextColor(0.4,0.4,0.4);
		HoloFriends_OptionsFrameScrollChild_ID12_Button:Enable();
		HoloFriends_OptionsFrameScrollChild_ID12_Text:SetTextColor(1.0,1.0,1.0);
	end

	local text = HOLOFRIENDS_OPTIONS1SETDATEFORMAT.." ("..HoloFriends_TempTTDateFormat..")";
	HoloFriends_OptionsFrameScrollChild_ID8_Text:SetText(text);
end


-- executed from every option if the options window is changed
function HoloFriendsOptions_Button_OnUpdate(self)
	local chapter = ( HF_ToolTipStrings[self:GetID()] == "" );
	local text;
	if ( chapter ) then
		text = getglobal(self:GetName().."_Chapter");
	else
		text = getglobal(self:GetName().."_Text");
	end
	text:SetWidth(InterfaceOptionsFramePanelContainer:GetWidth()-65);
	local height = text:GetHeight();
	if ( math.max(20,height) == 20 ) then height = 20; end
	if ( chapter ) then height = height + 10; end
	self:SetHeight(height + 5);
end


-- executed if the mouse enter the check button
function HoloFriendsOptions_Button_OnEnter(self)
	local text = HF_ToolTipStrings[self:GetParent():GetID()];
	GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT");
	GameTooltip:SetText(text, 1.0, 1.0, 1.0, 1.0, 1);
end


-- executed if a check button is clicked
function HoloFriendsOptions_Button_OnClick(self)
	local index = HF_OptionIDs[self:GetParent():GetID()];
	if ( index ) then
		if(self:GetChecked()) then
			PlaySound("igMainMenuOptionCheckBoxOn");
			HF_TempOptions[index] = true;
			if ( index == 6 ) then
				StaticPopup_Show("HOLOOPTIONS_DATEFORMAT");
			end
			if ( index == 8 ) then
				HoloFriends_OptionsFrameScrollChild_ID11_Button:Enable();
				HoloFriends_OptionsFrameScrollChild_ID11_Text:SetTextColor(1.0,1.0,1.0);
				HoloFriends_OptionsFrameScrollChild_ID12_Button:Disable();
				HoloFriends_OptionsFrameScrollChild_ID12_Text:SetTextColor(0.4,0.4,0.4);
			end
		else
			HF_TempOptions[index] = false;
			if ( index == 7 ) then
				HoloFriends_TempTTDateFormat = HOLOFRIENDS_TOOLTIPDATEFORMAT;
				local text = HOLOFRIENDS_OPTIONS1SETDATEFORMAT.." ("..HoloFriends_TempTTDateFormat..")";
				HoloFriends_OptionsFrameScrollChild_ID8_Text:SetText(text);
			end
			if ( index == 8 ) then
				HoloFriends_OptionsFrameScrollChild_ID11_Button:Disable();
				HoloFriends_OptionsFrameScrollChild_ID11_Text:SetTextColor(0.4,0.4,0.4);
				HoloFriends_OptionsFrameScrollChild_ID12_Button:Enable();
				HoloFriends_OptionsFrameScrollChild_ID12_Text:SetTextColor(1.0,1.0,1.0);
			end
		end

	end
end


-- executed if Okay-Button is pressed
function HoloFriendsOptions_Okay()
	-- make sure that our profile has been loaded
	if ( not HF_Options_Loaded ) then
		return;
	end

	for index = 1, table.getn(HF_TempOptions) do
		HOLOFRIENDS_OPTIONS[HF_OptionNames[index]] = HF_TempOptions[index];
	end
	HOLOFRIENDS_OPTIONS.TTDateFormat = HoloFriends_TempTTDateFormat;

	HoloFriendsOptions_Apply();
end


-- executed if Cancel-Button is pressed
function HoloFriendsOptions_Cancel()
	-- make sure that our profile has been loaded
	if ( not HF_Options_Loaded ) then
		return;
	end

	for index = 1, table.getn(HF_TempOptions) do
		HF_TempOptions[index] = HOLOFRIENDS_OPTIONS[HF_OptionNames[index]];
	end
	HoloFriends_TempTTDateFormat = HOLOFRIENDS_OPTIONS.TTDateFormat;
end


-- reset all options to defaults (Reset-Button pressed)
function HoloFriendsOptions_SetAllToDefault()
	-- make sure that our profile has been loaded
	if ( not HF_Options_Loaded ) then
		return;
	end

	-- set our profile to defaults
	for index = 1, table.getn(HF_TempOptions) do
		HF_TempOptions[index] = HF_DefaultOptions[index];
	end
	HoloFriends_TempTTDateFormat = HOLOFRIENDS_TOOLTIPDATEFORMAT;

	HoloFriendsOptions_OnShow()
end


-- apply the options
function HoloFriendsOptions_Apply()
	-- make sure that our profile has been loaded
	if ( not HF_Options_Loaded ) then
		return;
	end

	local NotFaction = HoloFriendsFuncs_IsCharDataAvailable(HOLOFRIENDS_LIST, UnitName("player"));
	if ( HOLOFRIENDS_OPTIONS.MergeNotes and NotFaction ) then
		HOLOFRIENDS_OPTIONS.NotesPriority = HOLOFRIENDS_OPTIONS.NotesPriorityOn;
	else
		HOLOFRIENDS_OPTIONS.NotesPriority = HOLOFRIENDS_OPTIONS.NotesPriorityOff;
	end

	HoloFriends_chat("HoloFriends_List_Update from HoloFriendsOptions_Apply", HF_DEBUG_OUTPUT);
	HoloFriends_List_Update();
end
