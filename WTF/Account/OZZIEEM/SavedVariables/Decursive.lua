
DecursiveDB = {
	["profileKeys"] = {
		["Fatty - Frozen Nexus [Custom]"] = "Default",
		["Dranah - Icecrown"] = "Default",
		["Valakk - Frostmourne"] = "Default",
		["Pala - Frozen Nexus"] = "Default",
		["Dud - Frozen Nexus [Custom]"] = "Default",
		["Shamanta - Frozen Nexus [Custom]"] = "Default",
		["Dranah - Frozen Nexus"] = "Default",
		["Lawras - Icecrown"] = "Default",
		["Dud - Frozen Nexus"] = "Default",
		["Shamanta - Frozen Nexus"] = "Default",
		["Themken - Icecrown"] = "Default",
		["Pala - Frozen Nexus [Custom]"] = "Default",
		["Grona - Frozen Nexus [Custom]"] = "Default",
		["Maldir - Icecrown"] = "Default",
		["Modos - Icecrown"] = "Default",
		["Lock - Frozen Nexus"] = "Default",
		["Tabinia - Icecrown"] = "Default",
		["Liadra - Frostmourne"] = "Default",
	},
	["class"] = {
		["HUNTER"] = {
			["CureOrder"] = {
				-12, -- [1]
				nil, -- [2]
				nil, -- [3]
				-13, -- [4]
				[32] = -16,
				[16] = -15,
				[8] = -14,
			},
		},
		["WARLOCK"] = {
			["CureOrder"] = {
				-12, -- [1]
				-11, -- [2]
				nil, -- [3]
				-13, -- [4]
				[32] = -16,
				[16] = -15,
				[8] = -14,
			},
		},
		["PALADIN"] = {
			["CureOrder"] = {
				3, -- [1]
				-14, -- [2]
				nil, -- [3]
				-15, -- [4]
				[32] = -16,
				[16] = 2,
				[8] = 1,
			},
		},
		["MAGE"] = {
			["CureOrder"] = {
				-12, -- [1]
				-11, -- [2]
				nil, -- [3]
				-13, -- [4]
				[32] = -16,
				[16] = -15,
				[8] = -14,
			},
		},
		["DRUID"] = {
			["CureOrder"] = {
				-15, -- [1]
				-14, -- [2]
				nil, -- [3]
				1, -- [4]
				[32] = 3,
				[16] = -16,
				[8] = 2,
			},
		},
		["SHAMAN"] = {
			["CureOrder"] = {
				-16, -- [1]
				nil, -- [2]
				nil, -- [3]
				5, -- [4]
				[32] = 4,
				[16] = 3,
				[8] = 2,
			},
		},
		["PRIEST"] = {
			["CureOrder"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				-15, -- [4]
				[32] = -16,
				[16] = 3,
			},
		},
	},
	["global"] = {
		["LastExpirationAlert"] = 1598631745,
		["NoStartMessages"] = true,
	},
	["profiles"] = {
		["Default"] = {
			["DebuffsFrame_y"] = -153.5999637585932,
			["MainBarX"] = 194.1338515302404,
			["Hidden"] = true,
			["MainBarY"] = -388.2670111785812,
			["PriorityList"] = {
				"0x000000000000078A", -- [1]
				"0x000000000000079E", -- [2]
			},
			["DebuffsFrameTimeLeft"] = true,
			["PriorityListClass"] = {
				["0x000000000000078A"] = "PALADIN",
				["0x000000000000079E"] = "MAGE",
			},
			["DebuffsFrame_x"] = 1024.000006758483,
			["PrioGUIDtoNAME"] = {
				["0x000000000000078A"] = "Splosion",
				["0x000000000000079E"] = "Maeg",
			},
		},
	},
}
