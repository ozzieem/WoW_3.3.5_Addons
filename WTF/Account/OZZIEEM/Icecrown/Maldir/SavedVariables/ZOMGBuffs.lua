
ZOMGBuffsPerCharDB = {
	["namespaces"] = {
		["SelfBuffs"] = {
			["notlearnable"] = {
				["Seal of Corruption"] = true,
				["Seal of Righteousness"] = true,
				["Crusader Aura"] = true,
				["Divine Plea"] = true,
				["Seal of Justice"] = true,
				["Seal of Light"] = true,
				["Holy Shield"] = true,
				["Seal of Command"] = true,
				["Seal of Wisdom"] = true,
				["Seal of Vengeance"] = true,
			},
			["templates"] = {
				["current"] = {
					["modified"] = true,
					["Devotion Aura"] = true,
					["Righteous Fury"] = true,
				},
			},
		},
		["Log"] = {
		},
		["BuffTehRaid"] = {
			["templates"] = {
				["current"] = {
					["modified"] = true,
					["SACREDSHIELD"] = true,
					["limited"] = {
						["SACREDSHIELD"] = {
							["Maldir"] = true,
						},
					},
					["FREEDOM"] = true,
				},
			},
			["postracker"] = {
				["SACREDSHIELD"] = {
					["point"] = {
						"LEFT", -- [1]
						nil, -- [2]
						"LEFT", -- [3]
						364.4561480846342, -- [4]
						-13.33349399775457, -- [5]
					},
				},
				["FREEDOM"] = {
					["point"] = {
						"LEFT", -- [1]
						nil, -- [2]
						"LEFT", -- [3]
						389.7192915820574, -- [4]
						159.2981762285819, -- [5]
					},
				},
			},
			["selectedTemplate"] = "Default",
			["rebuff"] = {
				["SACRIFICE"] = 5,
				["FREEDOM"] = 5,
				["SACREDSHIELD"] = 5,
				["BEACON"] = 5,
			},
			["firstRun"] = true,
		},
		["BlessingsManager"] = {
		},
		["Portalz"] = {
		},
		["Blessings"] = {
			["selectedTemplate"] = "5-Man",
			["templates"] = {
				["current"] = {
					["HUNTER"] = "BOK",
					["WARRIOR"] = "SAN",
					["PALADIN"] = "SAN",
					["MAGE"] = "SAN",
					["Jopopo"] = "BOK",
					["PRIEST"] = "BOW",
					["WARLOCK"] = "BOK",
					["DEATHKNIGHT"] = "BOK",
					["SHAMAN"] = "BOK",
					["DRUID"] = "SAN",
					["ROGUE"] = "SAN",
					["modified"] = true,
				},
			},
			["reagents"] = {
				["Symbol of Divinity"] = 5,
				["Symbol of Kings"] = 100,
			},
		},
	},
	["global"] = {
		["firstStartup"] = false,
		["sort"] = "CLASS",
		["pos"] = {
			["point"] = {
				"BOTTOMRIGHT", -- [1]
				nil, -- [2]
				"BOTTOMRIGHT", -- [3]
				-360.1404296400964, -- [4]
				54.87740486292086, -- [5]
			},
		},
	},
}
