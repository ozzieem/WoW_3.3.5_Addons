
GenieDB = {
	["profileKeys"] = {
		["Maldir - Icecrown"] = "Default",
		["Suprema - Icecrown"] = "Default",
		["Delras - Icecrown"] = "Default",
		["Gnomdk - Icecrown"] = "Default",
		["Lawras - Icecrown"] = "Default",
		["Themken - Lordaeron"] = "Default",
		["Assabrook - WoW Circle 3.3.5a x100"] = "Default",
		["Sufjan - Icecrown"] = "Default",
		["Lawron - Lordaeron"] = "Default",
		["Salaction - Icecrown"] = "Default",
		["Dranah - Icecrown"] = "Default",
		["Teleprter - Icecrown"] = "Default",
		["Elendraa - Icecrown"] = "Default",
		["Wilinia - Icecrown"] = "Default",
		["Warmat - Icecrown"] = "Default",
		["Jianyang - Icecrown"] = "Default",
		["Tabinia - Icecrown"] = "Default",
		["Modos - Icecrown"] = "Default",
		["Allisone - Icecrown"] = "Default",
		["Themken - Icecrown"] = "Default",
		["Rivina - Icecrown"] = "Default",
	},
	["profiles"] = {
		["Default"] = {
			["classranking"] = {
				{
					["enabled"] = true,
					["type"] = "bool",
					["criteria"] = "QuestItem",
					["name"] = "Quest Item",
				}, -- [1]
				{
					["enabled"] = true,
					["type"] = "bool",
					["criteria"] = "Soulbound",
					["name"] = "Soulbound",
				}, -- [2]
				{
					["enabled"] = true,
					["type"] = "number",
					["criteria"] = "Rarity",
					["max"] = 9,
					["invert"] = true,
					["name"] = "Quality",
				}, -- [3]
				{
					["enabled"] = true,
					["type"] = "number",
					["criteria"] = "TStID",
					["max"] = 9999,
					["invert"] = false,
					["name"] = "Aic",
				}, -- [4]
				{
					["enabled"] = true,
					["type"] = "string",
					["criteria"] = "EquipLoc",
					["name"] = "Equip Location",
				}, -- [5]
				{
					["enabled"] = true,
					["type"] = "string",
					["criteria"] = "Name",
					["name"] = "Name",
				}, -- [6]
				{
					["enabled"] = true,
					["type"] = "number",
					["criteria"] = "Count",
					["max"] = 9999,
					["name"] = "Count",
				}, -- [7]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "Unique",
					["invert"] = true,
					["name"] = "Unique",
				}, -- [8]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "iLvl",
					["max"] = 99,
					["name"] = "ItemLevel",
				}, -- [9]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "MinLevel",
					["max"] = 99,
					["name"] = "Minimum level",
				}, -- [10]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "StackCount",
					["max"] = 9999,
					["name"] = "Stackcount",
				}, -- [11]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "Texture",
					["name"] = "Texture",
				}, -- [12]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "Type",
					["name"] = "Type",
				}, -- [13]
				{
					["enabled"] = false,
					["type"] = "string",
					["criteria"] = "SubType",
					["name"] = "Subtype",
				}, -- [14]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "boe",
					["name"] = "Binds when equipped",
				}, -- [15]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "bop",
					["name"] = "Binds when picked up",
				}, -- [16]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "bou",
					["name"] = "Binds when used",
				}, -- [17]
				{
					["enabled"] = false,
					["type"] = "bool",
					["criteria"] = "boa",
					["name"] = "Binds to account",
				}, -- [18]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "Id",
					["max"] = 999999,
					["invert"] = true,
					["name"] = "Itemid",
				}, -- [19]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "Price",
					["max"] = 9999999999,
					["invert"] = true,
					["name"] = "Sell price",
				}, -- [20]
				{
					["enabled"] = false,
					["type"] = "number",
					["criteria"] = "SkillLvl",
					["max"] = 999,
					["invert"] = true,
					["name"] = "Skill",
				}, -- [21]
				{
					["enabled"] = false,
					["type"] = "family",
					["name"] = "dmg",
					["invert"] = true,
					["criteria"] = "dmg",
				}, -- [22]
				[25] = {
					["enabled"] = false,
					["type"] = "family",
					["name"] = "gs",
					["invert"] = true,
					["criteria"] = "gs",
				},
			},
			["events"] = {
				["BANKFRAME_OPENED"] = "",
				["LOOT_CLOSED"] = "",
				["BANKFRAME_CLOSED"] = "",
				["MERCHANT_CLOSED"] = "",
			},
			["version"] = 3051,
			["bags"] = {
				["ignore"] = {
				},
			},
			["mode"] = {
				["automatic"] = true,
				["reverseslots"] = false,
				["reversebags"] = false,
			},
			["customFamilies"] = {
				["dmg"] = {
					[47231] = "Belt of Merciless Cruelty:6",
					[49682] = "Black Knight's Rondel:16",
					[47730] = "Dexterous Brightstone Ring:12",
					[44014] = "Fezzik's Pocketwatch:14",
					[44295] = "Polished Regimental Hauberk:5",
					[35585] = "Cannibal's Legguards:7",
					[44297] = "Boots of the Neverending Path:8",
					[36951] = "Sidestepping Handguards:10",
					[37170] = "Interwoven Scale Bracers:9",
					[43156] = "Tabard of the Wyrmrest Accord:19",
					[148] = "Rugged Trapper's Shirt:4",
					[43406] = "Cloak of the Gushing Wound:15",
					[50228] = "Barbed Ymirheim Choker:2",
					["set"] = "dmg",
					[50262] = "Felglacier Bolter:18",
					[44311] = "Avool's Sword of Jin:17",
					[50233] = "Spurned Val'kyr Shoulderguards:3",
					[50197] = "Eyes of Bewilderment:1",
					[41121] = "Gnomish Lightning Generator:13",
					[50271] = "Band of Stained Souls:11",
				},
				["gs"] = {
					[47231] = "Belt of Merciless Cruelty:6",
					[49682] = "Black Knight's Rondel:16",
					[47730] = "Dexterous Brightstone Ring:12",
					[45812] = "Emerald Choker:2",
					[44295] = "Polished Regimental Hauberk:5",
					[44297] = "Boots of the Neverending Path:8",
					[36951] = "Sidestepping Handguards:10",
					[37170] = "Interwoven Scale Bracers:9",
					["set"] = "gs",
					[148] = "Rugged Trapper's Shirt:4",
					[43406] = "Cloak of the Gushing Wound:15",
					[50444] = "Rowan's Rifle of Silver Bullets:18",
					[50197] = "Eyes of Bewilderment:1",
					[44308] = "Signet of Edward the Odd:11",
					[44311] = "Avool's Sword of Jin:17",
					[50233] = "Spurned Val'kyr Shoulderguards:3",
					[41121] = "Gnomish Lightning Generator:14",
					[50450] = "Leggings of Dubious Charms:7",
				},
			},
		},
	},
}
