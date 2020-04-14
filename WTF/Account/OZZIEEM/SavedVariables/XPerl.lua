
XPerlConfig = nil
XPerlConfig_Global = nil
XPerlConfigNew = {
	["ConfigVersion"] = "3.1.0",
	["global"] = {
		["showReadyCheck"] = 1,
		["highlight"] = {
			["enable"] = 1,
			["AGGRO"] = 1,
		},
		["showFD"] = 1,
		["highlightSelection"] = 1,
		["optionsColour"] = {
			["r"] = 0.7,
			["g"] = 0.2,
			["b"] = 0.2,
		},
		["rangeFinder"] = {
			["StatsFrame"] = {
				["spell"] = "Holy Light",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["item"] = "Heavy Netherweave Bandage",
			},
			["enabled"] = 1,
			["Main"] = {
				["enabled"] = true,
				["spell"] = "Holy Light",
				["item"] = "Heavy Netherweave Bandage",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
			},
			["NameFrame"] = {
				["spell"] = "Holy Light",
				["FadeAmount"] = 0.5,
				["HealthLowPoint"] = 0.85,
				["item"] = "Heavy Netherweave Bandage",
			},
		},
		["showAFK"] = 1,
		["combatFlash"] = 1,
		["buffHelper"] = {
			["enable"] = 1,
			["sort"] = "group",
			["visible"] = 1,
		},
		["raidpet"] = {
			["hunter"] = 1,
			["warlock"] = 1,
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
			["defer"] = 1,
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["mobType"] = 1,
			["range30yard"] = 1,
			["highlightDebuffs"] = {
				["who"] = 2,
			},
			["raidIconAlternate"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["threatMode"] = "portraitFrame",
			["values"] = 1,
			["scale"] = 0.77,
			["elite"] = 1,
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
				1, -- [10]
			},
			["healerMode"] = {
				["type"] = 1,
			},
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
				{
					["enable"] = 1,
					["name"] = "MONK",
				}, -- [11]
			},
			["percent"] = 1,
			["scale"] = 0.8,
			["titles"] = 1,
			["sortByRole"] = 0,
			["precisionPercent"] = 1,
			["spacing"] = 0,
			["anchor"] = "TOP",
			["buffs"] = {
				["castable"] = 0,
				["inside"] = 1,
				["right"] = 1,
				["size"] = 20,
				["maxrows"] = 2,
			},
			["precisionManaPercent"] = 1,
			["size"] = {
				["width"] = 0,
			},
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
		["colour"] = {
			["classic"] = 1,
			["class"] = 1,
			["border"] = {
				["a"] = 1,
				["r"] = 0.5,
				["g"] = 0.5,
				["b"] = 0.5,
			},
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
			["classbarBright"] = 1,
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
			["frame"] = {
				["a"] = 1,
				["r"] = 0,
				["g"] = 0,
				["b"] = 0,
			},
			["guildList"] = 1,
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
			["pos"] = 196.2792328178965,
		},
		["xperlOldroleicons"] = 1,
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
		["party"] = {
			["debuffs"] = {
				["halfSize"] = 1,
				["below"] = 1,
				["enable"] = 1,
				["curable"] = 0,
				["size"] = 7,
			},
			["portrait"] = 1,
			["scale"] = 0.73,
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
			["inRaid"] = 1,
			["pvpIcon"] = 1,
			["range30yard"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["threatMode"] = "portraitFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["target"] = {
				["enable"] = 1,
				["large"] = 1,
				["size"] = 120,
			},
			["buffs"] = {
				["castable"] = 0,
				["size"] = 22,
				["wrap"] = 1,
				["rows"] = 2,
				["maxrows"] = 2,
			},
			["percent"] = 1,
			["classIcon"] = 1,
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
		["transparency"] = {
			["frame"] = 1,
			["text"] = 1,
		},
		["player"] = {
			["totems"] = {
				["enable"] = true,
				["offsetY"] = 0,
				["offsetX"] = 0,
			},
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 25,
			},
			["portrait"] = 1,
			["scale"] = 1,
			["castBar"] = {
				["castTime"] = 1,
				["precast"] = 1,
				["inside"] = 1,
			},
			["fullScreen"] = {
				["enable"] = 1,
				["highHP"] = 40,
				["lowHP"] = 30,
			},
			["hitIndicator"] = 1,
			["level"] = 1,
			["size"] = {
				["width"] = 20,
			},
			["threat"] = 1,
			["portrait3D"] = 1,
			["pvpIcon"] = 1,
			["energyTicker"] = 1,
			["showRunes"] = 1,
			["partyNumber"] = 1,
			["threatMode"] = "portraitFrame",
			["withName"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["values"] = 1,
			["buffs"] = {
				["size"] = 25,
				["maxrows"] = 2,
				["count"] = 40,
				["wrap"] = 1,
				["hideBlizzard"] = 1,
				["rows"] = 2,
				["cooldown"] = 1,
				["flash"] = 1,
			},
			["percent"] = 1,
			["classIcon"] = 1,
		},
		["highlightDebuffs"] = {
			["enable"] = 1,
			["frame"] = 1,
			["border"] = 1,
		},
		["tooltip"] = {
			["enable"] = 1,
			["enableBuffs"] = 1,
			["modifier"] = "all",
		},
		["pet"] = {
			["debuffs"] = {
				["enable"] = 1,
				["size"] = 20,
			},
			["values"] = 1,
			["healerMode"] = {
				["type"] = 1,
			},
			["portrait3D"] = 1,
			["scale"] = 0.7,
			["castBar"] = {
				["enable"] = 1,
			},
			["threatMode"] = "nameFrame",
			["name"] = 1,
			["hitIndicator"] = 1,
			["portrait"] = 1,
			["buffs"] = {
				["enable"] = 1,
				["size"] = 18,
				["maxrows"] = 2,
			},
			["threat"] = 1,
			["size"] = {
				["enable"] = 1,
				["width"] = 0,
				["size"] = 20,
			},
		},
		["buffs"] = {
			["countdown"] = 1,
			["cooldownAny"] = 1,
			["cooldown"] = 1,
			["countdownStart"] = 20,
		},
		["maximumScale"] = 1.5,
		["bar"] = {
			["fading"] = 1,
			["texture"] = {
				"Striped", -- [1]
				"Interface\\Addons\\SharedMedia\\statusbar\\Striped", -- [2]
			},
			["fadeTime"] = 0.5,
			["background"] = 1,
			["fat"] = 1,
		},
	},
	["savedPositions"] = {
		["Frozen Nexus"] = {
			["Pala"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 903.684257209605,
					["height"] = 540.0000686607884,
					["left"] = 534.9737706897899,
					["width"] = 748.999910891427,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
			["Dranah"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 736.1729245207987,
					["left"] = 897.0783256150355,
					["width"] = 700.0000358349134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 613.5040527683916,
					["left"] = 3.650000544671607,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.748503964262,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
			["Dud"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 903.684257209605,
					["height"] = 540.0000686607884,
					["left"] = 534.9737356755234,
					["width"] = 748.9999809199602,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
			["Shamanta"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 903.684257209605,
					["height"] = 540.0000686607884,
					["left"] = 534.9737706897899,
					["width"] = 748.999910891427,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
			["Riv"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 903.684257209605,
					["height"] = 540.0000686607884,
					["left"] = 534.9737706897899,
					["width"] = 748.999910891427,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
		},
		["Lordaeron"] = {
			["Lawras"] = {
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
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 239.0000133355117,
					["left"] = 490.2455661304264,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 181.3000003113252,
					["left"] = 566.4456342949156,
				},
				["XPerl_PetTarget"] = {
					["top"] = 245.0000083698944,
					["left"] = 939.7080671565705,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.8000018314657,
					["left"] = 1306.491285164836,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
		},
		["saved"] = {
			["Default"] = {
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
					["height"] = 80.00000109419584,
					["top"] = 424.0000093006645,
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
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 903.684257209605,
					["left"] = 534.9737706897899,
					["width"] = 748.999910891427,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
		},
		["Frosthold"] = {
			["Maldira"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 903.684257209605,
					["height"] = 540.0000686607884,
					["left"] = 534.9737706897899,
					["width"] = 748.999910891427,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
		},
		["Icecrown"] = {
			["Warmat"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 736.1729245207987,
					["left"] = 897.0783256150355,
					["width"] = 700.0000358349134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 613.5040527683916,
					["left"] = 3.650000544671607,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.748503964262,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
			["Modos"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.0000088219539,
					["left"] = 546.2456334234699,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 181.3000003113252,
					["left"] = 566.4456342949156,
				},
				["XPerl_PetTarget"] = {
					["top"] = 245.0000083698944,
					["left"] = 939.7080671565705,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.8000018314657,
					["left"] = 1306.491285164836,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
			["Dranah"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 580.2631489000152,
					["height"] = 149.9999976748339,
					["left"] = 828.2455996401737,
					["width"] = 140.0000106684094,
				},
				["XPerl_TargetTargetTarget"] = {
					["top"] = 203.0000146381939,
					["left"] = 945.1456566162043,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 850.5263254695475,
					["left"] = 414.6999959399009,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 565.7455800689179,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 938.7080597193915,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_OptionsAnchor"] = {
					["top"] = 860.8773554873339,
					["height"] = 540.0000686607884,
					["left"] = 521.6405480526015,
					["width"] = 748.9998408628937,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 218.4000066208206,
					["left"] = 829.6455819415796,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
			["Maulh"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 736.1729245207987,
					["left"] = 897.0783256150355,
					["width"] = 700.0000358349134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 613.5040527683916,
					["left"] = 3.650000544671607,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.748503964262,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
			["Tabinia"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 736.1729245207987,
					["left"] = 897.0783256150355,
					["width"] = 700.0000358349134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 613.5040527683916,
					["left"] = 3.650000544671607,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.748503964262,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
			["Maldir"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 736.1729245207987,
					["left"] = 897.0783256150355,
					["width"] = 700.0000358349134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 613.5040527683916,
					["left"] = 3.650000544671607,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.748503964262,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
			["Mandatum"] = {
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
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 579.6666458541502,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 607.6632501545794,
					["left"] = 481.4456687731121,
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
					["top"] = 607.6632501545794,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 607.6632501545794,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 239.0000133355117,
					["left"] = 546.2456334234699,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 607.6632501545794,
					["left"] = 542.2456747124036,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 607.6632501545794,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 181.3000003113252,
					["left"] = 566.4456342949156,
				},
				["XPerl_PetTarget"] = {
					["top"] = 245.0000083698944,
					["left"] = 939.7080671565705,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 607.6632501545794,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 607.6632501545794,
					["left"] = 60.79999893643807,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 644.6931782286896,
					["left"] = 3.650000145290118,
				},
				["XPerl_Focus"] = {
					["top"] = 850.5264086505823,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 607.6632501545794,
					["left"] = 603.0456806516951,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 607.6632501545794,
					["left"] = 364.8000076243353,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 1046.855669648536,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.8000018314657,
					["left"] = 1306.491285164836,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 607.6632501545794,
					["left"] = 121.5999978728761,
				},
			},
			["Elendraa"] = {
				["XPerl_RosterTextAnchor"] = {
					["top"] = 498.0000006838724,
					["height"] = 250.0000077961453,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["top"] = 230.298180263429,
					["height"] = 89.45670673999329,
					["left"] = 740.7018798489545,
					["width"] = 238.07029702151,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["top"] = 449.6316079255613,
					["height"] = 152.1437811619279,
					["left"] = 421.2982384609698,
					["width"] = 205.9999949393443,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.4632412096453,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["top"] = 580.2631489000152,
					["height"] = 149.9999976748339,
					["left"] = 828.2455996401737,
					["width"] = 140.0000106684094,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 788.1263025693248,
					["left"] = 414.6999959399009,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.4632412096453,
					["left"] = 182.4000038121677,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.4632412096453,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 229.9999987690297,
					["left"] = 485.2455988879141,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.4632412096453,
					["left"] = 486.2456486020145,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.4632412096453,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.8000080058966,
					["left"] = 510.4456099726666,
				},
				["XPerl_PetTarget"] = {
					["top"] = 230.0000438721255,
					["left"] = 859.7080604219134,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.4632412096453,
					["left"] = 304.0000296964575,
				},
				["XPerl_CheckAnchor"] = {
					["top"] = 504.000045409127,
					["height"] = 240.0000032825875,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.8000018314657,
					["left"] = 1195.745657614329,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 613.3031479042222,
					["left"] = 3.650000145290118,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1263347378869,
					["left"] = 216.7999946411344,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.4632412096453,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.4632412096453,
					["left"] = 547.0456545413059,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4156891362378,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.4632412096453,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.4632412096453,
					["left"] = 121.5999978728761,
				},
			},
			["Themken"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 805.4386369164851,
					["left"] = 785.5001829700592,
					["width"] = 748.9998408628937,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 670.8467996354456,
					["left"] = 2.246488325395133,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.7485284742482,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
			["Lawras"] = {
				["XPerl_RosterTextAnchor"] = {
					["height"] = 250.0000077961453,
					["top"] = 498.0000006838724,
					["left"] = 507.6667394078937,
					["width"] = 350.0000179174567,
				},
				["XPerl_Assists_FrameAnchor"] = {
					["height"] = 124.0000051974302,
					["top"] = 536.0740940178193,
					["left"] = 677.7983297237408,
					["width"] = 330.0000088903411,
				},
				["XPerl_RaidMonitor_Anchor"] = {
					["top"] = 424.0000093006645,
					["height"] = 80.00000109419584,
					["left"] = 582.6666682167775,
					["width"] = 200.0000027354896,
				},
				["XPerl_MTList_Anchor"] = {
					["height"] = 29.62091845293566,
					["top"] = 422.0988396668694,
					["left"] = 221.6090573701236,
					["width"] = 205.999977432211,
				},
				["XPerl_Raid_Title8"] = {
					["top"] = 576.1481688283412,
					["left"] = 425.6000135636268,
				},
				["XPerl_AdminFrameAnchor"] = {
					["height"] = 149.9999976748339,
					["top"] = 549.0740858797379,
					["left"] = 772.7983375882734,
					["width"] = 140.0000106684094,
				},
				["XPerl_Raid_TitlePets"] = {
					["top"] = 446.9136461456677,
					["left"] = 193.8468820266127,
				},
				["XPerl_Raid_Title4"] = {
					["top"] = 576.1481688283412,
					["left"] = 182.4000038121677,
				},
				["XPerl_FocusTarget"] = {
					["top"] = 741.3992883880707,
					["left"] = 344.0457204753097,
				},
				["XPerl_Raid_Title7"] = {
					["top"] = 576.1481688283412,
					["left"] = 364.8000076243353,
				},
				["XPerl_Raid_Title1"] = {
					["top"] = 576.1481688283412,
					["left"] = 0,
				},
				["XPerl_Player"] = {
					["top"] = 232.360678130602,
					["left"] = 485.1171315437442,
				},
				["XPerl_Raid_Title2"] = {
					["top"] = 576.1481688283412,
					["left"] = 60.79999893643807,
				},
				["XPerl_Raid_Title9"] = {
					["top"] = 576.1481688283412,
					["left"] = 486.3999914915046,
				},
				["XPerl_Raid_Title5"] = {
					["top"] = 576.1481688283412,
					["left"] = 243.1999957457523,
				},
				["XPerl_Player_Pet"] = {
					["top"] = 170.7649954906022,
					["left"] = 510.3400209520939,
				},
				["XPerl_OptionsAnchor"] = {
					["height"] = 540.0000686607884,
					["top"] = 736.1729245207987,
					["left"] = 897.0783256150355,
					["width"] = 700.0001058634467,
				},
				["XPerl_Raid_Title6"] = {
					["top"] = 576.1481688283412,
					["left"] = 304.0000016850438,
				},
				["XPerl_CheckAnchor"] = {
					["height"] = 240.0000032825875,
					["top"] = 504.000045409127,
					["left"] = 432.6667405704768,
					["width"] = 500.0000155922906,
				},
				["XPerl_Focus"] = {
					["top"] = 788.1481836405733,
					["left"] = 216.8000086468412,
				},
				["XPerl_Party_Anchor"] = {
					["top"] = 680.482564990993,
					["left"] = 4.351759749516383,
				},
				["XPerl_AggroAnchor"] = {
					["top"] = 662.5844908272537,
					["left"] = 823.5066287409273,
				},
				["XPerl_Raid_Title10"] = {
					["top"] = 576.1481688283412,
					["left"] = 547.2000534536235,
				},
				["XPerl_PetTarget"] = {
					["top"] = 243.748503964262,
					["left"] = 854.9537113377406,
				},
				["XPerl_Target"] = {
					["top"] = 230.2300119375156,
					["left"] = 991.4084635923605,
				},
				["XPerl_TargetTarget"] = {
					["top"] = 184.5857600420445,
					["left"] = 1195.690559165339,
				},
				["XPerl_Raid_Title3"] = {
					["top"] = 576.1481688283412,
					["left"] = 121.5999978728761,
				},
			},
		},
	},
}
XPerlConfigSavePerCharacter = nil
