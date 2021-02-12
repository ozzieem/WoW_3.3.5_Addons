
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["ConfigVersion"] = "3.1.0",
	["global"] = {
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
		},
		["highlightSelection"] = 1,
		["optionsColour"] = {
			["r"] = 0.7,
			["g"] = 0.2,
			["b"] = 0.2,
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
			["Main"] = {
				["enabled"] = true,
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["FadeAmount"] = 0.5,
				["item"] = "Heavy Netherweave Bandage",
				["HealthLowPoint"] = 0.85,
			},
		},
		["showAFK"] = 1,
		["ShowTutorials"] = true,
		["buffHelper"] = {
			["enable"] = 1,
			["sort"] = "group",
			["visible"] = 1,
		},
		["focus"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["curable"] = 0,
				["big"] = 1,
			},
			["portrait"] = 1,
			["combo"] = {
				["enable"] = 1,
				["blizzard"] = 1,
				["pos"] = "top",
			},
			["enable"] = 1,
			["mana"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 0.8,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["target"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 29,
				["curable"] = 0,
				["big"] = 1,
			},
			["portrait"] = 1,
			["combo"] = {
				["enable"] = 1,
				["blizzard"] = 1,
				["pos"] = "top",
			},
			["enable"] = 1,
			["mana"] = 1,
			["castBar"] = {
				["enable"] = 1,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["sound"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["elite"] = 1,
			["scale"] = 0.8,
			["values"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 3,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["raid"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["enable"] = 1,
			["class"] = {
				{
					["enable"] = 1,
					["name"] = "WARRIOR",
				}, -- [1]
				{
					["enable"] = 1,
					["name"] = "ROGUE",
				}, -- [2]
				{
					["enable"] = 1,
					["name"] = "HUNTER",
				}, -- [3]
				{
					["enable"] = 1,
					["name"] = "MAGE",
				}, -- [4]
				{
					["enable"] = 1,
					["name"] = "WARLOCK",
				}, -- [5]
				{
					["enable"] = 1,
					["name"] = "PRIEST",
				}, -- [6]
				{
					["enable"] = 1,
					["name"] = "DRUID",
				}, -- [7]
				{
					["enable"] = 1,
					["name"] = "SHAMAN",
				}, -- [8]
				{
					["enable"] = 1,
					["name"] = "PALADIN",
				}, -- [9]
				{
					["enable"] = 1,
					["name"] = "DEATHKNIGHT",
				}, -- [10]
			},
			["group"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				1, -- [5]
				1, -- [6]
				1, -- [7]
				1, -- [8]
				1, -- [9]
			},
			["titles"] = 1,
			["scale"] = 0.8,
			["healerMode"] = {
				["type"] = 1,
			},
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["inside"] = 1,
				["right"] = 1,
				["size"] = 20,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["raidpet"] = {
			["enable"] = 1,
			["hunter"] = 1,
			["warlock"] = 1,
		},
		["colour"] = {
			["class"] = 1,
			["guildList"] = 1,
			["reaction"] = {
				["tapped"] = {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 0.5,
				},
				["enemy"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["neutral"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 0,
				},
				["unfriendly"] = {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0,
				},
				["friend"] = {
					["r"] = 0,
					["g"] = 1,
					["b"] = 0,
				},
				["none"] = {
					["r"] = 0.5,
					["g"] = 0.5,
					["b"] = 1,
				},
			},
			["frame"] = {
				["a"] = 1,
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["classic"] = 1,
			["gradient"] = {
				["enable"] = 1,
				["s"] = {
					["a"] = 1,
					["r"] = 0.25,
					["g"] = 0.25,
					["b"] = 0.25,
				},
				["e"] = {
					["a"] = 0,
					["r"] = 0.1,
					["g"] = 0.1,
					["b"] = 0.1,
				},
			},
			["border"] = {
				["a"] = 1,
				["r"] = 0.5,
				["g"] = 0.5,
				["b"] = 0.5,
			},
			["bar"] = {
				["rage"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["healthFull"] = {
					["r"] = 0,
					["g"] = 1,
					["b"] = 0,
				},
				["focus"] = {
					["r"] = 1,
					["g"] = 0.5,
					["b"] = 0.25,
				},
				["energy"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 0,
				},
				["mana"] = {
					["r"] = 0,
					["g"] = 0,
					["b"] = 1,
				},
				["healthEmpty"] = {
					["r"] = 1,
					["g"] = 0,
					["b"] = 0,
				},
				["runic_power"] = {
					["r"] = 0,
					["g"] = 0.82,
					["b"] = 1,
				},
			},
		},
		["minimap"] = {
			["enable"] = 1,
			["radius"] = 78,
			["pos"] = 186,
		},
		["combatFlash"] = 1,
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 32,
			},
			["portrait"] = 1,
			["scale"] = 0.8,
			["castBar"] = {
				["enable"] = 1,
				["castTime"] = 1,
			},
			["spacing"] = 23,
			["anchor"] = "TOP",
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["inRaid"] = 1,
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["target"] = {
				["enable"] = 1,
				["large"] = 1,
				["size"] = 120,
			},
			["hitIndicator"] = 1,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["wrap"] = 1,
				["rows"] = 2,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["pet"] = {
			["threat"] = 1,
			["portrait"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["scale"] = 0.7,
			["healerMode"] = {
				["type"] = 1,
			},
			["level"] = 1,
			["happiness"] = {
				["enabled"] = 1,
				["flashWhenSad"] = 1,
				["onlyWhenSad"] = 1,
			},
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["size"] = 18,
				["maxrows"] = 2,
			},
			["portrait3D"] = 1,
			["size"] = {
				["enable"] = 1,
				["width"] = 0,
				["size"] = 20,
			},
		},
		["transparency"] = {
			["frame"] = 1,
			["text"] = 1,
		},
		["focustarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["targettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["partypet"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 12,
			},
			["name"] = 1,
			["enable"] = 1,
			["scale"] = 0.7,
			["buffs"] = {
				["enable"] = 1,
				["castable"] = 0,
				["size"] = 12,
				["maxrows"] = 2,
			},
			["healerMode"] = {
				["type"] = 1,
			},
			["size"] = {
				["width"] = 0,
			},
		},
		["highlightDebuffs"] = {
			["enable"] = 1,
			["frame"] = 1,
			["border"] = 1,
			["class"] = 1,
		},
		["player"] = {
			["partyNumber"] = 1,
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 0.9,
			["castBar"] = {
				["enable"] = 1,
			},
			["fullScreen"] = {
				["enable"] = 1,
				["highHP"] = 40,
				["lowHP"] = 30,
			},
			["hitIndicator"] = 1,
			["dockRunes"] = 1,
			["level"] = 1,
			["size"] = {
				["width"] = 0,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["showRunes"] = 1,
			["threatMode"] = "portraitFrame",
			["classIcon"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["wrap"] = 1,
				["flash"] = 1,
				["count"] = 40,
				["size"] = 25,
				["rows"] = 2,
				["hideBlizzard"] = 1,
				["cooldown"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["energyTicker"] = 1,
		},
		["pettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["enable"] = 1,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["scale"] = 0.7,
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["targettargettarget"] = {
			["debuffs"] = {
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 29,
			},
			["values"] = 1,
			["pvpIcon"] = 1,
			["scale"] = 0.7,
			["mana"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["buffs"] = {
				["size"] = 22,
				["castable"] = 0,
				["enable"] = 1,
				["rows"] = 3,
				["wrap"] = 1,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["size"] = {
				["width"] = 0,
			},
		},
		["buffs"] = {
			["countdown"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["bar"] = {
			["texture"] = {
				"Perl v2", -- [1]
				"Interface\\Addons\\XPerl\\Images\\XPerl_StatusBar", -- [2]
			},
			["background"] = 1,
			["fadeTime"] = 0.5,
			["fat"] = 1,
		},
	},
	["savedPositions"] = {
		["New Funserver"] = {
			["Myron"] = {
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 638.5263378155229,
					["left"] = 425.6000135636268,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 850.5263254695475,
					["left"] = 414.6999959399009,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 638.5263378155229,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 638.5263378155229,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 999.7264172273382,
					["left"] = 20.70000012867092,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 638.5263378155229,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 638.5263378155229,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 948.2262677623847,
					["left"] = 72.09999700091484,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 638.5263378155229,
					["left"] = 304.0000296964575,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 775.2632019001258,
					["height"] = 540.0000686607884,
					["left"] = 548.2456133176216,
					["width"] = 700.0000358349134,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 638.5263378155229,
					["left"] = 60.79999893643807,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 890.5263712780329,
					["left"] = 0,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1340.608989882821,
					["left"] = 233.4999963722936,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 638.5263378155229,
					["left"] = 547.2000534536235,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 638.5263378155229,
					["left"] = 364.8000076243353,
				},
				["XPerl_Target"] = {
					["top"] = 1000.926355525407,
					["left"] = 216.7999946411344,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1002.126276466558,
					["left"] = 412.9999832966964,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 638.5263378155229,
					["left"] = 121.5999978728761,
				},
			},
		},
		["Funserver"] = {
			["Aenis"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 567.2631570380967,
					["height"] = 124.0000051974302,
					["left"] = 733.2457318327076,
					["width"] = 330.0000088903411,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 638.5263378155229,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 580.2631489000152,
					["height"] = 149.9999976748339,
					["left"] = 828.2455996401737,
					["width"] = 140.0000106684094,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 850.5263254695475,
					["left"] = 414.6999959399009,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 638.5263378155229,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 638.5263378155229,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 999.7263542016598,
					["left"] = 20.70000012867092,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 638.5263378155229,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 638.5263378155229,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 948.2262677623847,
					["left"] = 72.09999700091484,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1340.608989882821,
					["left"] = 233.4999963722936,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 638.5263378155229,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 1002.126276466558,
					["left"] = 412.9999832966964,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 890.5263712780329,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 638.5263378155229,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 638.5263378155229,
					["left"] = 547.2000534536235,
				},
				["XPerl_Target"] = {
					["top"] = 1000.926355525407,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 638.5263378155229,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 638.5263378155229,
					["left"] = 121.5999978728761,
				},
			},
			["Myron"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 567.2631570380967,
					["left"] = 733.2457318327076,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 80.00000109419584,
					["top"] = 424.0000093006645,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 638.5263378155229,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 580.2631489000152,
					["left"] = 828.2455996401737,
					["width"] = 140.0000106684094,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 850.5263254695475,
					["left"] = 414.6999959399009,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 638.5263378155229,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 638.5263378155229,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 228.4983358640468,
					["left"] = 560.3492041017338,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 638.5263378155229,
					["left"] = 486.3999914915046,
				},
				["XPerl_PetTarget"] = {
					["top"] = 1340.608989882821,
					["left"] = 233.4999963722936,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 948.2262677623847,
					["left"] = 72.09999700091484,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 638.5263378155229,
					["left"] = 243.1999957457523,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 638.5263378155229,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 638.5263378155229,
					["left"] = 60.79999893643807,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 890.5263712780329,
					["left"] = 0,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 638.5263378155229,
					["left"] = 547.2000534536235,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 638.5263378155229,
					["left"] = 364.8000076243353,
				},
				["XPerl_Target"] = {
					["top"] = 223.3827608950095,
					["left"] = 1070.133707172788,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 207.0384760452802,
					["left"] = 831.24608404079,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 638.5263378155229,
					["left"] = 121.5999978728761,
				},
			},
		},
	},
}
XPerlConfigSavePerCharacter = nil
