
DecursiveDB = {
	["profileKeys"] = {
		["Fatty - Frozen Nexus [Custom]"] = "Default",
		["Shamanta - Frozen Nexus [Custom]"] = "Default",
		["Themken - Icecrown"] = "Default",
		["Lanas - Frozen Nexus [Custom]"] = "Default",
		["Grona - Frozen Nexus [Custom]"] = "Default",
		["Pala - Frozen Nexus [Custom]"] = "Default",
		["Dud - Frozen Nexus [Custom]"] = "Default",
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
				1, -- [1]
				-14, -- [2]
				nil, -- [3]
				-15, -- [4]
				[32] = -16,
				[16] = 3,
				[8] = 2,
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
				-15, -- [1]
				nil, -- [2]
				nil, -- [3]
				-16, -- [4]
				[32] = 4,
				[16] = 3,
				[8] = 2,
			},
		},
	},
	["global"] = {
		["LastExpirationAlert"] = 1588362077,
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
