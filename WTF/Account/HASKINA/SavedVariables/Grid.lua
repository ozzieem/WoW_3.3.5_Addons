
GridDB = {
	["profileKeys"] = {
		["Warmat - Icecrown"] = "Default",
		["Tabinia - Icecrown"] = "Default",
		["Lawras - Icecrown"] = "Default",
	},
	["namespaces"] = {
		["GridStatusStagger"] = {
		},
		["GridFrame"] = {
			["profiles"] = {
				["Default"] = {
					["textlength"] = 6,
					["texture"] = "Armory",
					["frameHeight"] = 38,
					["orientation"] = "HORIZONTAL",
					["statusmap"] = {
						["iconTLcornerright"] = {
						},
						["icontop"] = {
						},
						["iconleft"] = {
						},
						["iconBLcornerleft"] = {
						},
						["iconbottom"] = {
						},
						["iconBLcornerright"] = {
						},
						["iconTRcornerright"] = {
						},
						["iconTRcornerleft"] = {
						},
						["iconBRcornerright"] = {
						},
						["iconBRcornerleft"] = {
						},
						["iconright"] = {
						},
						["corner2"] = {
							["buff_BeaconofLight"] = true,
							["buff_Beacon"] = true,
						},
						["iconTLcornerleft"] = {
						},
					},
					["frameWidth"] = 73,
				},
			},
		},
		["GridStatusRole"] = {
		},
		["GridStatusAuras"] = {
			["profiles"] = {
				["Default"] = {
					["buff_BeaconofLight"] = {
						["enable"] = true,
						["text"] = "Beacon of Light",
						["range"] = false,
						["desc"] = "Buff: Beacon of Light",
						["duration"] = false,
						["priority"] = 90,
						["color"] = {
							["a"] = 1,
							["b"] = 0.5,
							["g"] = 0.5,
							["r"] = 0.5,
						},
						["missing"] = false,
					},
				},
			},
		},
		["GridStatusAbsorbs"] = {
		},
		["GridStatus"] = {
			["profiles"] = {
				["Default"] = {
					["colors"] = {
						["HUNTER"] = {
							["b"] = 0.45,
							["g"] = 0.83,
							["r"] = 0.67,
						},
						["ROGUE"] = {
							["b"] = 0.41,
							["g"] = 0.96,
							["r"] = 1,
						},
						["MAGE"] = {
							["b"] = 0.94,
							["g"] = 0.8,
							["r"] = 0.41,
						},
						["DRUID"] = {
							["b"] = 0.04,
							["g"] = 0.49,
							["r"] = 1,
						},
						["DEATHKNIGHT"] = {
							["b"] = 0.23,
							["g"] = 0.12,
							["r"] = 0.77,
						},
						["PRIEST"] = {
							["b"] = 1,
							["g"] = 1,
							["r"] = 1,
						},
						["WARLOCK"] = {
							["b"] = 0.79,
							["g"] = 0.51,
							["r"] = 0.58,
						},
						["WARRIOR"] = {
							["b"] = 0.43,
							["g"] = 0.61,
							["r"] = 0.78,
						},
						["PALADIN"] = {
							["b"] = 0.73,
							["g"] = 0.55,
							["r"] = 0.96,
						},
						["SHAMAN"] = {
							["b"] = 0.87,
							["g"] = 0.44,
							["r"] = 0,
						},
					},
				},
			},
		},
		["GridStatusRange"] = {
			["profiles"] = {
				["Default"] = {
					["alert_range_10"] = {
						["enable"] = false,
						["text"] = "10 yards",
						["color"] = {
							["a"] = 0.8181818181818181,
							["b"] = 0.3,
							["g"] = 0.2,
							["r"] = 0.1,
						},
						["priority"] = 81,
						["range"] = false,
						["desc"] = "More than 10 yards away",
					},
					["alert_range_38"] = {
						["enable"] = false,
						["text"] = "38 yards",
						["color"] = {
							["a"] = 0.3090909090909091,
							["b"] = 0.14,
							["g"] = 0.76,
							["r"] = 0.38,
						},
						["priority"] = 84,
						["range"] = false,
						["desc"] = "More than 38 yards away",
					},
					["alert_range_25"] = {
						["color"] = {
							["a"] = 0.5454545454545454,
							["b"] = 0.75,
							["g"] = 0.5,
							["r"] = 0.25,
						},
						["priority"] = 82,
						["enable"] = true,
						["text"] = "25 yards",
						["range"] = false,
						["desc"] = "More than 25 yards away",
					},
					["alert_range_40"] = {
						["enable"] = true,
						["text"] = "40 yards",
						["color"] = {
							["a"] = 0.2727272727272727,
							["b"] = 0.2,
							["g"] = 0.8,
							["r"] = 0.4,
						},
						["priority"] = 84,
						["range"] = false,
						["desc"] = "More than 40 yards away",
					},
					["alert_range_100"] = {
						["enable"] = false,
						["text"] = "100 yards",
						["color"] = {
							["a"] = 0.1090909090909091,
							["b"] = 0,
							["g"] = 0,
							["r"] = 0,
						},
						["priority"] = 90,
						["range"] = false,
						["desc"] = "More than 100 yards away",
					},
					["alert_range_28"] = {
						["enable"] = false,
						["text"] = "28 yards",
						["color"] = {
							["a"] = 0.490909090909091,
							["b"] = 0.84,
							["g"] = 0.5600000000000001,
							["r"] = 0.28,
						},
						["priority"] = 83,
						["range"] = false,
						["desc"] = "More than 28 yards away",
					},
					["alert_range_60"] = {
						["enable"] = true,
						["text"] = "60 yards",
						["color"] = {
							["a"] = 0.8363636363636364,
							["b"] = 0.8,
							["g"] = 0.2,
							["r"] = 0.6,
						},
						["priority"] = 86,
						["range"] = false,
						["desc"] = "More than 60 yards away",
					},
					["alert_range_30"] = {
						["enable"] = false,
						["text"] = "30 yards",
						["color"] = {
							["a"] = 0.4545454545454546,
							["b"] = 0.9,
							["g"] = 0.6,
							["r"] = 0.3,
						},
						["priority"] = 83,
						["range"] = false,
						["desc"] = "More than 30 yards away",
					},
					["alert_range_20"] = {
						["enable"] = false,
						["text"] = "20 yards",
						["color"] = {
							["a"] = 0.6363636363636364,
							["b"] = 0.6,
							["g"] = 0.4,
							["r"] = 0.2,
						},
						["priority"] = 82,
						["range"] = false,
						["desc"] = "More than 20 yards away",
					},
				},
			},
		},
		["GridStatusHealth"] = {
			["profiles"] = {
				["Default"] = {
					["unit_health"] = {
						["deadAsFullHealth"] = false,
					},
				},
			},
		},
		["GridLayoutManager"] = {
		},
		["GridStatusResurrect"] = {
		},
		["GridStatusGroup"] = {
		},
		["GridStatusRaidIcon"] = {
		},
		["GridStatusMouseover"] = {
		},
		["GridLayout"] = {
			["profiles"] = {
				["Default"] = {
					["anchorRel"] = "TOPLEFT",
					["BackgroundR"] = 0.1019607843137255,
					["borderTexture"] = "None",
					["BackgroundG"] = 0.1019607843137255,
					["PosY"] = -313.9422634052744,
					["layout"] = "By Group 5",
					["BackgroundA"] = 0,
					["BackgroundB"] = 0.1019607843137255,
					["Padding"] = 0,
					["PosX"] = 200.5119115982879,
					["Spacing"] = 5,
				},
			},
		},
	},
	["profiles"] = {
		["Default"] = {
			["minimap"] = {
				["minimapPos"] = 247.0657464953111,
			},
		},
	},
}
