-- -------------------------------------------------------------------------- --
-- GridIndicatorSideIcons by kunda                                            --
-- -------------------------------------------------------------------------- --

local GridFrame = Grid:GetModule("GridFrame")
local L = GridIndicatorSideIcons_Locales
local AceOO = AceLibrary("AceOO-2.0")
local media = LibStub("LibSharedMedia-3.0", true)
local configMode = false

local GridIndicatorSideIcons = Grid:GetModule("GridStatus"):NewModule("GridIndicatorSideIcons")

GridIndicatorSideIcons.defaultDB = {
	iconSizeTop = 8,
	iconSizeBottom = 8,
	iconSizeLeft = 8,
	iconSizeRight = 8,
	xoffsetTB = 0,
	yoffsetTB = 0,
	xoffsetLR = 2,
	yoffsetLR = 2,
	iconBorderSize = 0,
	enableIconStackText = false,
	enableIconCooldown = false,
	IconStackTextSize = 8,
	IconStackTextXYaxis = 0,
	OriginalSize = false,
}

local indicators = GridFrame.frameClass.prototype.indicators
table.insert(indicators, { type = "icontop",		order = 7.11, name = L["Top Icon"] })
table.insert(indicators, { type = "iconbottom",	order = 7.12, name = L["Bottom Icon"] })
table.insert(indicators, { type = "iconleft",		order = 7.13, name = L["Left Icon"] })
table.insert(indicators, { type = "iconright",	order = 7.14, name = L["Right Icon"] })


local statusmap = GridFrame.db.profile.statusmap
if not statusmap["icontop"] then
	statusmap["icontop"] = {}
	statusmap["iconbottom"] = {}
	statusmap["iconleft"] = {}
	statusmap["iconright"] = {}
end

local GridIndicatorSideIconsFrameClass = AceOO.Class(GridFrame.frameClass)

local _frameClass = nil
if not _frameClass then
	_frameClass = GridFrame.frameClass
	GridFrame.frameClass = GridIndicatorSideIconsFrameClass
end

function GridIndicatorSideIcons:OnEnable()
	self:CleanOptionsMenu() -- hack for better indicator menu

	GridFrame.options.args.advanced.args["sideicons"] = {
		type = "group",
		icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-TRBL",
		name = L["Icon (Sides)"],
		desc = L["Options for Icon (Sides) indicators."],
		order = 106,
		args = {
			["configuration"] = {
				type = "toggle",
				name = L["Configuration Mode"],
				desc = L["Shows all Icon (Sides) indicators."],
				order = 10,
				get = function()
					return configMode
				end,
				set = function(v) 
					configMode = v
					GridFrame:WithAllFrames(function(f) f:GridIndicatorSideIconsConfig() end)
				end
			},
			["header1"] = {
				type = "header",
				order = 15,
				name = " ",
			},
			["xoffsetTB"] = {
				type = "range",
				name = L["Offset X-axis (top/bottom)"],
				desc = L["Adjust the offset of the X-axis for the top and bottom icon."],
				order = 20,
				min = -20,
				max = 20,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.xoffsetTB
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.xoffsetTB = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["yoffsetTB"] = {
				type = "range",
				name = L["Offset Y-axis (top/bottom)"],
				desc = L["Adjust the offset of the Y-axis for the top and bottom icon."],
				order = 30,
				min = -20,
				max = 20,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.yoffsetTB
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.yoffsetTB = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["xoffsetLR"] = {
				type = "range",
				name = L["Offset X-axis (left/right)"],
				desc = L["Adjust the offset of the X-axis for the left and right icon."],
				order = 40,
				min = -20,
				max = 20,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.xoffsetLR
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.xoffsetLR = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["yoffsetLR"] = {
				type = "range",
				name = L["Offset Y-axis (left/right)"],
				desc = L["Adjust the offset of the Y-axis for the left and right icon."],
				order = 50,
				min = -20,
				max = 20,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.yoffsetLR
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.yoffsetLR = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["header2"] = {
				type = "header",
				order = 55,
				name = " ",
			},
			["originalsize"] = {
				type = "toggle",
				name = L["Same settings as Grid"],
				desc = L["If enabled, the settings for the Icon (Sides) indicators are adjustable with the standard Grid options. If deactivated, you can set individual settings for the Icon (Sides) indicators."],
				order = 60,
				get = function()
					return GridIndicatorSideIcons.db.profile.OriginalSize
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.OriginalSize = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconbordersize"].disabled = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconcooldown"].disabled = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconstacktext"].disabled = v
					if GridIndicatorSideIcons.db.profile.OriginalSize then
						GridFrame.options.args.advanced.args["sideicons"].args["iconstacktextfontsize"].disabled = true
						GridFrame.options.args.advanced.args["sideicons"].args["iconstacktextxyoffset"].disabled = true
					else
						GridFrame.options.args.advanced.args["sideicons"].args["iconstacktextfontsize"].disabled = not GridIndicatorSideIcons.db.profile.enableIconStackText
						GridFrame.options.args.advanced.args["sideicons"].args["iconstacktextxyoffset"].disabled = not GridIndicatorSideIcons.db.profile.enableIconStackText
					end
					GridFrame.options.args.advanced.args["sideicons"].args["iconsizetop"].disabled = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconsizebottom"].disabled = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconsizeleft"].disabled = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconsizeright"].disabled = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(GridFrame.db.profile.cornerSize) end)
					if configMode then GridFrame:WithAllFrames(function(f) f:GridIndicatorSideIconsConfig() end) end
				end,
			},
			["iconbordersize"] = {
				type = "range",
				name = L["Icon Border Size"],
				desc = L["Adjust the size of the icon's border."],
				order = 70,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				min = 0,
				max = 4,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.iconBorderSize
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.iconBorderSize = v
					GridFrame:UpdateAllFrames()
					GridFrame:WithAllFrames(function(f) f:SetIconSize(nil, v) end)
					if configMode then GridFrame:WithAllFrames(function(f) f:GridIndicatorSideIconsConfig() end) end
				end,
			},
			["iconcooldown"] = {
				type = "toggle",
				name = L["Enable Icon Cooldown Frame"],
				desc = L["Toggle icon's cooldown frame."],
				order = 80,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				get = function()
					return GridIndicatorSideIcons.db.profile.enableIconCooldown
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.enableIconCooldown = v
					GridFrame:UpdateAllFrames()
					if configMode then GridFrame:WithAllFrames(function(f) f:GridIndicatorSideIconsConfig() end) end
				end,
			},
			["iconstacktext"] = {
				type = "toggle",
				name = L["Enable Icon Stack Text"],
				desc = L["Toggle icon's stack count text."],
				order = 90,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				get = function()
					return GridIndicatorSideIcons.db.profile.enableIconStackText
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.enableIconStackText = v
					GridFrame.options.args.advanced.args["sideicons"].args["iconstacktextfontsize"].disabled = not v
					GridFrame.options.args.advanced.args["sideicons"].args["iconstacktextxyoffset"].disabled = not v
					GridFrame:UpdateAllFrames()
					if configMode then GridFrame:WithAllFrames(function(f) f:GridIndicatorSideIconsConfig() end) end
				end,
			},
			["iconstacktextfontsize"] = {
				type = "range",
				name = L["Icon Stack Text: Font Size"],
				desc = L["Adjust the font size for Icon Stack Text."],
				order = 100,
				disabled = not GridIndicatorSideIcons.db.profile.enableIconStackText or GridIndicatorSideIcons.db.profile.OriginalSize,
				min = 6,
				max = 24,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.IconStackTextSize
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.IconStackTextSize = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["iconstacktextxyoffset"] = {
				type = "range",
				name = L["Icon Stack Text: Offset XY-axis"],
				desc = L["Adjust the offset for Icon Stack Text of the XY-axis."],
				order = 110,
				disabled = not GridIndicatorSideIcons.db.profile.enableIconStackText or GridIndicatorSideIcons.db.profile.OriginalSize,
				min = -4,
				max = 4,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.IconStackTextXYaxis
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.IconStackTextXYaxis = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["iconsizetop"] = {
				type = "range",
				icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-T",
				name = L["Icon Size Top"],
				desc = L["Adjust the size of the top icon."],
				order = 120,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				min = 5,
				max = 50,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.iconSizeTop
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.iconSizeTop = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["iconsizebottom"] = {
				type = "range",
				icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-B",
				name = L["Icon Size Bottom"],
				desc = L["Adjust the size of the bottom icon."],
				order = 130,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				min = 5,
				max = 50,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.iconSizeBottom
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.iconSizeBottom = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["iconsizeleft"] = {
				type = "range",
				icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-L",
				name = L["Icon Size Left"],
				desc = L["Adjust the size of the left icon."],
				order = 140,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				min = 5,
				max = 50,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.iconSizeLeft
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.iconSizeLeft = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			},
			["iconsizeright"] = {
				type = "range",
				icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-R",
				name = L["Icon Size Right"],
				desc = L["Adjust the size of the right icon."],
				order = 150,
				disabled = GridIndicatorSideIcons.db.profile.OriginalSize,
				min = 5,
				max = 50,
				step = 1,
				get = function()
					return GridIndicatorSideIcons.db.profile.iconSizeRight
				end,
				set = function(v)
					GridIndicatorSideIcons.db.profile.iconSizeRight = v
					GridFrame:WithAllFrames(function(f) f:SetIconSize(v) end)
				end,
			}
		}
	}
	hooksecurefunc(GridFrame, "UpdateOptionsMenu", GridIndicatorSideIcons.CleanOptionsMenu) -- hack for better indicator menu
	self:RegisterEvent("Grid_Enabled")
	self:RegisterEvent("Grid_Disabled")
end

function GridIndicatorSideIcons:Grid_Enabled()
	configMode = false
end

function GridIndicatorSideIcons:Grid_Disabled()
	configMode = false
end

function GridIndicatorSideIcons:CleanOptionsMenu()
	if not GridFrame.options.args.icontop then return end
	if not Grid:GetModule("GridStatus"):IsModuleActive("GridIndicatorSideIcons") then return end

	GridFrame.options.args["sideicons"] = {
		type = "group",
		icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-TRBL",
		name = L["Icon (Sides)"],
		desc = L["Options for Icon (Sides) indicators."],
		order = 57.1,
		args = {
			["icontop"]    = GridFrame.options.args.icontop,
			["iconbottom"] = GridFrame.options.args.iconbottom,
			["iconleft"]   = GridFrame.options.args.iconleft,
			["iconright"]  = GridFrame.options.args.iconright
		}
	}

	GridFrame.options.args["sideicons"].args["icontop"].icon  = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-T"
	GridFrame.options.args["sideicons"].args["iconbottom"].icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-B"
	GridFrame.options.args["sideicons"].args["iconleft"].icon  = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-L"
	GridFrame.options.args["sideicons"].args["iconright"].icon = "Interface\\AddOns\\GridIndicatorSideIcons\\GridIndicatorSideIcons-icon-R"

	GridFrame.options.args.icontop = nil
	GridFrame.options.args.iconbottom = nil
	GridFrame.options.args.iconleft = nil
	GridFrame.options.args.iconright = nil
end

function GridIndicatorSideIconsFrameClass.prototype:GridIndicatorSideIconsConfig()
	if configMode then
		local curTime = GetTime()
		self:SetIndicator("icontop",    {r=0.29, g=0.21, b=0.81, a=1}, "3", 3, 8, "Interface\\Icons\\Spell_Holy_ArcaneIntellect",      curTime, 10, 8)
		self:SetIndicator("iconbottom", {r=0.12, g=0.46, b=0.97, a=1}, "4", 4, 8, "Interface\\Icons\\Spell_Holy_PrayerOfFortitude",    curTime, 30, 8)
		self:SetIndicator("iconleft",   {r=0.42, g=0.07, b=0.24, a=1}, "5", 5, 8, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2", curTime, 50, 8)
		self:SetIndicator("iconright",  {r=0.16, g=0.78, b=0.21, a=1}, "8", 8, 8, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8", curTime, 80, 8)
	else
		self:ClearIndicator("icontop")
		self:ClearIndicator("iconbottom")
		self:ClearIndicator("iconleft")
		self:ClearIndicator("iconright")
		GridFrame:UpdateAllFrames()
	end
end

function GridIndicatorSideIconsFrameClass.prototype:CreateIndicator(indicator)
	GridIndicatorSideIconsFrameClass.super.prototype.CreateIndicator(self, indicator)
	local f = self.frame
	local font = media and media:Fetch("font", GridFrame.db.profile.font) or STANDARD_TEXT_FONT
	local xoffsetTB = GridIndicatorSideIcons.db.profile.xoffsetTB
	local yoffsetTB = GridIndicatorSideIcons.db.profile.yoffsetTB
	local xoffsetLR = GridIndicatorSideIcons.db.profile.xoffsetLR
	local yoffsetLR = GridIndicatorSideIcons.db.profile.yoffsetLR
	local borderSize = GridIndicatorSideIcons.db.profile.iconBorderSize
	local iconStackTextSize = GridIndicatorSideIcons.db.profile.IconStackTextSize
	local iconStackTextXYaxis = GridIndicatorSideIcons.db.profile.IconStackTextXYaxis
	if GridIndicatorSideIcons.db.profile.OriginalSize then
		borderSize = GridFrame.db.profile.iconBorderSize
		iconStackTextSize = GridFrame.db.profile.fontSize
		iconStackTextXYaxis = 2
	end

	if indicator == "icontop" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeTop
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			wh = GridFrame.db.profile.iconSize
		end

		-- create icon background/border
		f.icontopBG = CreateFrame("Frame", nil, f)
		f.icontopBG:SetWidth(wh + (2*borderSize))
		f.icontopBG:SetHeight(wh + (2*borderSize))
		f.icontopBG:SetPoint("TOP", f, "TOP", xoffsetTB, yoffsetTB)
		f.icontopBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.icontopBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.icontopBG:SetBackdropColor(0, 0, 0, 0)
		f.icontopBG:SetFrameLevel(5)
		f.icontopBG:Hide()

		-- create icon
		f.icontop = f.icontopBG:CreateTexture(nil, "OVERLAY")
		f.icontop:SetWidth(wh)
		f.icontop:SetHeight(wh)
		f.icontop:SetPoint("CENTER", f.icontopBG, "CENTER")
		f.icontop:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.icontop:SetTexture(1, 1, 1, 0)

		-- create icon text
		f.icontopText = f.icontopBG:CreateFontString(nil, "OVERLAY")
		f.icontopText:SetAllPoints(f.icontopBG)
		f.icontopText:SetFontObject(GameFontHighlightSmall)
		f.icontopText:SetFont(font, GridFrame.db.profile.fontSize)
		f.icontopText:SetJustifyH("CENTER")
		f.icontopText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.icontopCD = CreateFrame("Cooldown", nil, f.icontopBG, "CooldownFrameTemplate")
		f.icontopCD:SetAllPoints(f.icontop)
		f.icontopCD:SetScript("OnHide", function()
			f.icontopStackText:SetParent(f.icontopBG)
			f.icontopStackText:SetPoint("BOTTOMRIGHT", f.icontopBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		end)

		-- create icon stack text
		f.icontopStackText = f.icontopBG:CreateFontString(nil, "OVERLAY")
		f.icontopStackText:SetPoint("BOTTOMRIGHT", f.icontopBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		f.icontopStackText:SetFontObject(GameFontHighlightSmall)
		f.icontopStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.icontopStackText:SetJustifyH("RIGHT")
		f.icontopStackText:SetJustifyV("BOTTOM")
	elseif indicator == "iconbottom" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeBottom
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			wh = GridFrame.db.profile.iconSize
		end

		-- create icon background/border
		f.iconbottomBG = CreateFrame("Frame", nil, f)
		f.iconbottomBG:SetWidth(wh + (2*borderSize))
		f.iconbottomBG:SetHeight(wh + (2*borderSize))
		f.iconbottomBG:SetPoint("BOTTOM", f, "BOTTOM", xoffsetTB, (yoffsetTB*-1))
		f.iconbottomBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.iconbottomBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.iconbottomBG:SetBackdropColor(0, 0, 0, 0)
		f.iconbottomBG:SetFrameLevel(5)
		f.iconbottomBG:Hide()

		-- create icon
		f.iconbottom = f.iconbottomBG:CreateTexture(nil, "OVERLAY")
		f.iconbottom:SetWidth(wh)
		f.iconbottom:SetHeight(wh)
		f.iconbottom:SetPoint("CENTER", f.iconbottomBG, "CENTER")
		f.iconbottom:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.iconbottom:SetTexture(1, 1, 1, 0)

		-- create icon text
		f.iconbottomText = f.iconbottomBG:CreateFontString(nil, "OVERLAY")
		f.iconbottomText:SetAllPoints(f.iconbottomBG)
		f.iconbottomText:SetFontObject(GameFontHighlightSmall)
		f.iconbottomText:SetFont(font, GridFrame.db.profile.fontSize)
		f.iconbottomText:SetJustifyH("CENTER")
		f.iconbottomText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.iconbottomCD = CreateFrame("Cooldown", nil, f.iconbottomBG, "CooldownFrameTemplate")
		f.iconbottomCD:SetAllPoints(f.iconbottom)
		f.iconbottomCD:SetScript("OnHide", function()
			f.iconbottomStackText:SetParent(f.iconbottomBG)
			f.iconbottomStackText:SetPoint("BOTTOMRIGHT", f.iconbottomBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		end)

		-- create icon stack text
		f.iconbottomStackText = f.iconbottomBG:CreateFontString(nil, "OVERLAY")
		f.iconbottomStackText:SetPoint("BOTTOMRIGHT", f.iconbottomBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		f.iconbottomStackText:SetFontObject(GameFontHighlightSmall)
		f.iconbottomStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.iconbottomStackText:SetJustifyH("RIGHT")
		f.iconbottomStackText:SetJustifyV("BOTTOM")
	elseif indicator == "iconleft" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeLeft
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			wh = GridFrame.db.profile.iconSize
		end

		-- create icon background/border
		f.iconleftBG = CreateFrame("Frame", nil, f)
		f.iconleftBG:SetWidth(wh + (2*borderSize))
		f.iconleftBG:SetHeight(wh + (2*borderSize))
		f.iconleftBG:SetPoint("LEFT", f, "LEFT", (xoffsetLR*-1), yoffsetLR)
		f.iconleftBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.iconleftBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.iconleftBG:SetBackdropColor(0, 0, 0, 0)
		f.iconleftBG:SetFrameLevel(5)
		f.iconleftBG:Hide()

		-- create icon
		f.iconleft = f.iconleftBG:CreateTexture(nil, "OVERLAY")
		f.iconleft:SetWidth(wh)
		f.iconleft:SetHeight(wh)
		f.iconleft:SetPoint("CENTER", f.iconleftBG, "CENTER")
		f.iconleft:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.iconleft:SetTexture(1, 1, 1, 0)

		-- create icon text
		f.iconleftText = f.iconleftBG:CreateFontString(nil, "OVERLAY")
		f.iconleftText:SetAllPoints(f.iconleftBG)
		f.iconleftText:SetFontObject(GameFontHighlightSmall)
		f.iconleftText:SetFont(font, GridFrame.db.profile.fontSize)
		f.iconleftText:SetJustifyH("CENTER")
		f.iconleftText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.iconleftCD = CreateFrame("Cooldown", nil, f.iconleftBG, "CooldownFrameTemplate")
		f.iconleftCD:SetAllPoints(f.iconleft)
		f.iconleftCD:SetScript("OnHide", function()
			f.iconleftStackText:SetParent(f.iconleftBG)
			f.iconleftStackText:SetPoint("BOTTOMRIGHT", f.iconleftBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		end)

		-- create icon stack text
		f.iconleftStackText = f.iconleftBG:CreateFontString(nil, "OVERLAY")
		f.iconleftStackText:SetPoint("BOTTOMRIGHT", f.iconleftBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		f.iconleftStackText:SetFontObject(GameFontHighlightSmall)
		f.iconleftStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.iconleftStackText:SetJustifyH("RIGHT")
		f.iconleftStackText:SetJustifyV("BOTTOM")
	elseif indicator == "iconright" then
		local wh = GridIndicatorSideIcons.db.profile.iconSizeRight
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			wh = GridFrame.db.profile.iconSize
		end

		-- create icon background/border
		f.iconrightBG = CreateFrame("Frame", nil, f)
		f.iconrightBG:SetWidth(wh + (2*borderSize))
		f.iconrightBG:SetHeight(wh + (2*borderSize))
		f.iconrightBG:SetPoint("RIGHT", f, "RIGHT", xoffsetLR, yoffsetLR)
		f.iconrightBG:SetBackdrop( {
					edgeFile = "Interface\\Addons\\Grid\\white16x16", edgeSize = 2,
					insets = {left = 2, right = 2, top = 2, bottom = 2},
					})
		f.iconrightBG:SetBackdropBorderColor(1, 1, 1, 0)
		f.iconrightBG:SetBackdropColor(0, 0, 0, 0)
		f.iconrightBG:SetFrameLevel(5)
		f.iconrightBG:Hide()

		-- create icon
		f.iconright = f.iconrightBG:CreateTexture(nil, "OVERLAY")
		f.iconright:SetWidth(wh)
		f.iconright:SetHeight(wh)
		f.iconright:SetPoint("CENTER", f.iconrightBG, "CENTER")
		f.iconright:SetTexCoord(0.05, 0.95, 0.05, 0.95)
		f.iconright:SetTexture(1, 1, 1, 0)

		-- create icon text
		f.iconrightText = f.iconrightBG:CreateFontString(nil, "OVERLAY")
		f.iconrightText:SetAllPoints(f.iconrightBG)
		f.iconrightText:SetFontObject(GameFontHighlightSmall)
		f.iconrightText:SetFont(font, GridFrame.db.profile.fontSize)
		f.iconrightText:SetJustifyH("CENTER")
		f.iconrightText:SetJustifyV("CENTER")

		-- create icon cooldown
		f.iconrightCD = CreateFrame("Cooldown", nil, f.iconrightBG, "CooldownFrameTemplate")
		f.iconrightCD:SetAllPoints(f.iconright)
		f.iconrightCD:SetScript("OnHide", function()
			f.iconrightStackText:SetParent(f.iconrightBG)
			f.iconrightStackText:SetPoint("BOTTOMRIGHT", f.iconrightBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		end)

		-- create icon stack text
		f.iconrightStackText = f.iconrightBG:CreateFontString(nil, "OVERLAY")
		f.iconrightStackText:SetPoint("BOTTOMRIGHT", f.iconrightBG, iconStackTextXYaxis, -iconStackTextXYaxis)
		f.iconrightStackText:SetFontObject(GameFontHighlightSmall)
		f.iconrightStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.iconrightStackText:SetJustifyH("RIGHT")
		f.iconrightStackText:SetJustifyV("BOTTOM")
	end
end

function GridIndicatorSideIconsFrameClass.prototype:SetIndicator(indicator, color, text, value, maxValue, texture, start, duration, stack)
	GridIndicatorSideIconsFrameClass.super.prototype.SetIndicator(self, indicator, color, text, value, maxValue, texture, start, duration, stack)
	if indicator == "icontop"
	or indicator == "iconbottom"
	or indicator == "iconleft"
	or indicator == "iconright"
	then
		if not self.frame[indicator] then
			self:CreateIndicator(indicator)
		end
		if texture then
			local borderSize = GridIndicatorSideIcons.db.profile.iconBorderSize
			local enabledCD = GridIndicatorSideIcons.db.profile.enableIconCooldown
			local XYaxis = GridIndicatorSideIcons.db.profile.IconStackTextXYaxis
			local enabledStackTxt = GridIndicatorSideIcons.db.profile.enableIconStackText
			if GridIndicatorSideIcons.db.profile.OriginalSize then
				borderSize = GridFrame.db.profile.iconBorderSize
				enabledCD = GridFrame.db.profile.enableIconCooldown
				XYaxis = 2
				enabledStackTxt = GridFrame.db.profile.enableIconStackText
			end

			if type(texture) == "table" then
				self.frame[indicator]:SetTexture(texture.r, texture.g, texture.b, texture.a or 1)
			else
				self.frame[indicator]:SetTexture(texture)
			end

			if type(color) == "table" then
				if not color.ignore then
					if borderSize > 0 then
						self.frame[indicator.."BG"]:SetBackdropBorderColor(color.r, color.g, color.b, color.a or 1)
					end
				else
					self.frame[indicator.."BG"]:SetBackdropBorderColor(0, 0, 0, 0)
				end
				self.frame[indicator]:SetAlpha(color.a or 1)
			else
				self.frame[indicator.."BG"]:SetBackdropBorderColor(0, 0, 0, 0)
				self.frame[indicator]:SetAlpha(1)
			end

			if enabledCD and type(duration) == "number" and duration > 0 and type(start) == "number" and start > 0 then
				self.frame[indicator.."CD"]:SetCooldown(start, duration)
				self.frame[indicator.."CD"]:Show()
				self.frame[indicator.."StackText"]:SetParent(self.frame[indicator.."CD"])
				self.frame[indicator.."StackText"]:SetPoint("BOTTOMRIGHT", self.frame[indicator.."BG"], XYaxis, -XYaxis)
			else
				self.frame[indicator.."CD"]:Hide()
			end

			if enabledStackTxt and tonumber(stack) and tonumber(stack) > 1 then
				self.frame[indicator.."StackText"]:SetText(stack)
			else
				self.frame[indicator.."StackText"]:SetText("")
			end

			self.frame[indicator.."BG"]:Show()
			self.frame[indicator]:Show()
		else
			self.frame[indicator.."BG"]:Hide()
		end
	end
end

function GridIndicatorSideIconsFrameClass.prototype:ClearIndicator(indicator)
	GridIndicatorSideIconsFrameClass.super.prototype.ClearIndicator(self, indicator)
	if indicator == "icontop"
	or indicator == "iconbottom"
	or indicator == "iconleft"
	or indicator == "iconright"
	then
		if self.frame[indicator] then
			self.frame[indicator]:SetTexture(1, 1, 1, 0)
			self.frame[indicator.."BG"]:Hide()
			self.frame[indicator.."StackText"]:SetText("")
			self.frame[indicator.."CD"]:Hide()
		end
	end
end

function GridIndicatorSideIconsFrameClass.prototype:SetIconSize(size, borderSize)
	GridIndicatorSideIconsFrameClass.super.prototype.SetIconSize(self, GridFrame.db.profile.iconSize, GridFrame.db.profile.iconBorderSize)
	local f = self.frame
	local xoffsetTB = GridIndicatorSideIcons.db.profile.xoffsetTB
	local yoffsetTB = GridIndicatorSideIcons.db.profile.yoffsetTB
	local xoffsetLR = GridIndicatorSideIcons.db.profile.xoffsetLR
	local yoffsetLR = GridIndicatorSideIcons.db.profile.yoffsetLR
	local borderSize = GridIndicatorSideIcons.db.profile.iconBorderSize
	local iconStackTextSize = GridIndicatorSideIcons.db.profile.IconStackTextSize
	local iconStackTextXYaxis = GridIndicatorSideIcons.db.profile.IconStackTextXYaxis
	local font = media and media:Fetch("font", GridFrame.db.profile.font) or STANDARD_TEXT_FONT
	if GridIndicatorSideIcons.db.profile.OriginalSize then
		borderSize = GridFrame.db.profile.iconBorderSize
		iconStackTextSize = GridFrame.db.profile.fontSize
		iconStackTextXYaxis = 2
	end

	if f.icontop then
		local size = GridIndicatorSideIcons.db.profile.iconSizeTop
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			size = GridFrame.db.profile.iconSize
		end

		local backdrop = f.icontopBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.icontopBG:GetBackdropBorderColor()

		f.icontopBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.icontopBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.icontopBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.icontopBG:SetPoint("TOP", f, "TOP", xoffsetTB, yoffsetTB)
		f.icontopBG:SetWidth(size + (2*borderSize))
		f.icontopBG:SetHeight(size + (2*borderSize))

		f.icontop:SetWidth(size)
		f.icontop:SetHeight(size)

		f.icontopStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.icontopStackText:SetPoint("BOTTOMRIGHT", f.icontopBG, iconStackTextXYaxis, -iconStackTextXYaxis)
	end
	if f.iconbottom then
		local size = GridIndicatorSideIcons.db.profile.iconSizeBottom
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			size = GridFrame.db.profile.iconSize
		end

		local backdrop = f.iconbottomBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.iconbottomBG:GetBackdropBorderColor()

		f.iconbottomBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.iconbottomBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.iconbottomBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.iconbottomBG:SetPoint("BOTTOM", f, "BOTTOM", xoffsetTB, (yoffsetTB*-1))
		f.iconbottomBG:SetWidth(size + (2*borderSize))
		f.iconbottomBG:SetHeight(size + (2*borderSize))

		f.iconbottom:SetWidth(size)
		f.iconbottom:SetHeight(size)

		f.iconbottomStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.iconbottomStackText:SetPoint("BOTTOMRIGHT", f.iconbottomBG, iconStackTextXYaxis, -iconStackTextXYaxis)
	end
	if f.iconleft then
		local size = GridIndicatorSideIcons.db.profile.iconSizeLeft
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			size = GridFrame.db.profile.iconSize
		end

		local backdrop = f.iconleftBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.iconleftBG:GetBackdropBorderColor()

		f.iconleftBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.iconleftBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.iconleftBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.iconleftBG:SetPoint("LEFT", f, "LEFT", (xoffsetLR*-1), yoffsetLR)
		f.iconleftBG:SetWidth(size + (2*borderSize))
		f.iconleftBG:SetHeight(size + (2*borderSize))

		f.iconleft:SetWidth(size)
		f.iconleft:SetHeight(size)

		f.iconleftStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.iconleftStackText:SetPoint("BOTTOMRIGHT", f.iconleftBG, iconStackTextXYaxis, -iconStackTextXYaxis)
	end
	if f.iconright then
		local size = GridIndicatorSideIcons.db.profile.iconSizeRight
		if GridIndicatorSideIcons.db.profile.OriginalSize then
			size = GridFrame.db.profile.iconSize
		end

		local backdrop = f.iconrightBG:GetBackdrop()

		backdrop.edgeSize = borderSize
		backdrop.insets.left = borderSize
		backdrop.insets.right = borderSize
		backdrop.insets.top = borderSize
		backdrop.insets.bottom = borderSize

		local r, g, b, a = f.iconrightBG:GetBackdropBorderColor()

		f.iconrightBG:SetBackdrop(backdrop)
		if borderSize == 0 then
			f.iconrightBG:SetBackdropBorderColor(0, 0, 0, 0)
		else
			f.iconrightBG:SetBackdropBorderColor(r, g, b, a)
		end

		f.iconrightBG:SetPoint("RIGHT", f, "RIGHT", xoffsetLR, yoffsetLR)
		f.iconrightBG:SetWidth(size + (2*borderSize))
		f.iconrightBG:SetHeight(size + (2*borderSize))

		f.iconright:SetWidth(size)
		f.iconright:SetHeight(size)

		f.iconrightStackText:SetFont(font, iconStackTextSize, "OUTLINE")
		f.iconrightStackText:SetPoint("BOTTOMRIGHT", f.iconrightBG, iconStackTextXYaxis, -iconStackTextXYaxis)
	end
end