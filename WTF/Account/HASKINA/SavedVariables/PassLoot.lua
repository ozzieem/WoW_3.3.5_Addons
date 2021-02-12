
PassLootDB = {
	["global"] = {
		["Modules"] = {
			["Inventory"] = {
				["Version"] = 1,
			},
			["Zone Name"] = {
				["Version"] = 3,
			},
			["Player Name"] = {
				["Version"] = 1,
			},
			["Learned Item"] = {
				["Version"] = 2,
			},
			["Unique"] = {
				["Version"] = 3,
			},
			["Confirm DE"] = {
				["Version"] = 1,
			},
			["Quality"] = {
				["Version"] = 3,
			},
			["Equip Slot"] = {
				["Version"] = 3,
			},
			["Item Price"] = {
				["Version"] = 2,
			},
			["Binds On"] = {
				["Version"] = 3,
			},
			["Item Name"] = {
				["Version"] = 2,
			},
			["Confirm BoP"] = {
				["Version"] = 1,
			},
			["Zone Type"] = {
				["Version"] = 3,
			},
			["Item Level"] = {
				["Version"] = 2,
			},
			["Type / SubType"] = {
				["Version"] = 3,
			},
			["Group / Raid"] = {
				["Version"] = 3,
			},
			["Class Spec"] = {
				["Version"] = 1,
			},
			["Usable"] = {
				["Version"] = 1,
			},
			["Loot Won"] = {
				["Version"] = 3,
			},
			["Required Level"] = {
				["Version"] = 2,
			},
		},
	},
	["DBVersion"] = 12,
	["profileKeys"] = {
		["Resto - Frozen Nexus"] = "Default",
		["Suffer - Frozen Nexus"] = "Default",
		["Ashur - Frostmourne"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["Modules"] = {
				["Inventory"] = {
					["Status"] = true,
				},
				["Zone Name"] = {
					["Status"] = true,
				},
				["Player Name"] = {
					["Status"] = true,
				},
				["Learned Item"] = {
					["Status"] = true,
				},
				["Unique"] = {
					["Status"] = true,
				},
				["Item Name"] = {
					["Status"] = true,
				},
				["Quality"] = {
					["Status"] = true,
				},
				["Item Level"] = {
					["Status"] = true,
				},
				["Item Price"] = {
					["Status"] = true,
				},
				["Confirm BoP"] = {
					["Status"] = true,
				},
				["Confirm DE"] = {
					["Status"] = true,
				},
				["Binds On"] = {
					["Status"] = true,
				},
				["Zone Type"] = {
					["Status"] = true,
				},
				["Equip Slot"] = {
					["Status"] = true,
				},
				["Type / SubType"] = {
					["Status"] = true,
				},
				["Group / Raid"] = {
					["Status"] = true,
				},
				["Class Spec"] = {
					["Status"] = true,
				},
				["Usable"] = {
					["Status"] = true,
				},
				["Loot Won"] = {
					["Status"] = true,
				},
				["Required Level"] = {
					["Status"] = true,
				},
			},
			["Rules"] = {
				{
					["Inventory"] = {
					},
					["Zone"] = {
					},
					["ItemPrice"] = {
					},
					["EquipSlot"] = {
					},
					["Unique"] = {
					},
					["Loot"] = {
						"need", -- [1]
						"greed", -- [2]
					},
					["LootWonComparison"] = {
					},
					["Quality"] = {
					},
					["ZoneType"] = {
					},
					["ItemLevel"] = {
					},
					["PlayerName"] = {
					},
					["Desc"] = "Things",
					["Items"] = {
						{
							"Commendation of Service", -- [1]
							"Exact", -- [2]
							false, -- [3]
						}, -- [1]
						{
							"Frozen Orb", -- [1]
							"Exact", -- [2]
							false, -- [3]
						}, -- [2]
						{
							"Shadowburn Rune", -- [1]
							"Exact", -- [2]
							false, -- [3]
						}, -- [3]
					},
					["TypeSubType"] = {
					},
					["Bind"] = {
					},
					["GroupRaid"] = {
					},
					["RequiredLevel"] = {
					},
					["Usable"] = {
					},
					["ClassSpec"] = {
					},
					["LearnedItem"] = {
					},
				}, -- [1]
				{
					["Inventory"] = {
					},
					["Zone"] = {
					},
					["ItemPrice"] = {
					},
					["EquipSlot"] = {
					},
					["Unique"] = {
					},
					["Loot"] = {
						"pass", -- [1]
					},
					["LootWonComparison"] = {
					},
					["Quality"] = {
						{
							2, -- [1]
							false, -- [2]
						}, -- [1]
					},
					["ZoneType"] = {
					},
					["ItemLevel"] = {
					},
					["PlayerName"] = {
					},
					["Desc"] = "Pass green",
					["Items"] = {
					},
					["TypeSubType"] = {
					},
					["Bind"] = {
					},
					["ClassSpec"] = {
					},
					["RequiredLevel"] = {
					},
					["Usable"] = {
					},
					["GroupRaid"] = {
					},
					["LearnedItem"] = {
					},
				}, -- [2]
			},
			["SinkOptions"] = {
				["sink20OutputSink"] = "ChatFrame",
			},
		},
		["Frozen Nexus"] = {
			["Modules"] = {
				["Inventory"] = {
					["Status"] = true,
				},
				["Zone Name"] = {
					["Status"] = true,
				},
				["Player Name"] = {
					["Status"] = true,
				},
				["Learned Item"] = {
					["Status"] = true,
				},
				["Unique"] = {
					["Status"] = true,
				},
				["Confirm DE"] = {
					["Status"] = true,
				},
				["Quality"] = {
					["Status"] = true,
				},
				["Equip Slot"] = {
					["Status"] = true,
				},
				["Item Price"] = {
					["Status"] = true,
				},
				["Binds On"] = {
					["Status"] = true,
				},
				["Required Level"] = {
					["Status"] = true,
				},
				["Confirm BoP"] = {
					["Status"] = true,
				},
				["Zone Type"] = {
					["Status"] = true,
				},
				["Item Level"] = {
					["Status"] = true,
				},
				["Class Spec"] = {
					["Status"] = true,
				},
				["Group / Raid"] = {
					["Status"] = true,
				},
				["Type / SubType"] = {
					["Status"] = true,
				},
				["Usable"] = {
					["Status"] = true,
				},
				["Loot Won"] = {
					["Status"] = true,
				},
				["Item Name"] = {
					["Status"] = true,
				},
			},
		},
	},
}
