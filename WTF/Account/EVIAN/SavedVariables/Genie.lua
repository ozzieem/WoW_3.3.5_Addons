
GenieDB = {
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
					["name"] = "ret",
					["invert"] = true,
					["criteria"] = "ret",
				}, -- [22]
				{
					["enabled"] = false,
					["type"] = "family",
					["name"] = "holy",
					["invert"] = true,
					["criteria"] = "holy",
				}, -- [23]
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
				["ret"] = {
					[50208] = "Pauldrons of the Souleater:3",
					[50272] = "Frost Wyrm Ribcage:5",
					[47734] = "Mark of Supremacy:14",
					[37784] = "Keystone Great-Ring:11",
					[47674] = "Helm of Thunderous Rampage:1",
					[44205] = "Legplates of Bloody Reprisal:7",
					[49818] = "Painfully Sharp Choker:2",
					[37171] = "Flame-Bathed Steel Girdle:6",
					[45667] = "Stormwind Doublet:4",
					[50194] = "Weeping Gauntlets:10",
					["set"] = "ret",
					[50230] = "Malykriss Vambraces:9",
					[43348] = "Tabard of the Explorer:19",
					[50355] = "Herkuml War Token:13",
					[47511] = "Plated Greaves of Providence:8",
					[44188] = "Cloak of Peaceful Resolutions:15",
					[47661] = "Libram of Valiance:18",
					[37653] = "Sword of Justice:16",
					[37624] = "Stained-Glass Shard Ring:12",
				},
				["holy"] = {
					[48724] = "Talisman of Resurgence:14",
					[47733] = "Heartmender Circle:11",
					[50214] = "Helm of the Spirit Shock:1",
					[50215] = "Recovered Reliquary Boots:8",
					[50309] = "Shriveled Heart:17",
					[50313] = "Oath of Empress Zoe:12",
					[50284] = "Rusty Frozen Fingerguards:10",
					[47662] = "Libram of Veracity:18",
					[45667] = "Stormwind Doublet:4",
					[50318] = "Ghostly Wristwraps:9",
					["set"] = "holy",
					[50196] = "Love's Prisoner:2",
					[37169] = "War Mace of Unrequited Love:16",
					[43348] = "Tabard of the Explorer:19",
					[50468] = "Drape of the Violet Tower:15",
					[50294] = "Chestpiece of High Treason:5",
					[50450] = "Leggings of Dubious Charms:7",
					[50451] = "Belt of the Lonely Noble:6",
					[37835] = "Je'Tze's Bell:13",
					[47702] = "Pauldrons of the Cavalier:3",
				},
			},
		},
	},
	["profileKeys"] = {
		["Maldir - Icecrown"] = "Default",
		["Suprema - Icecrown"] = "Default",
		["Delras - Icecrown"] = "Default",
		["Themken - Lordaeron"] = "Default",
		["Lawron - Lordaeron"] = "Default",
		["Maulh - Icecrown"] = "Default",
		["Themken - Icecrown"] = "Default",
		["Dranah - Icecrown"] = "Default",
		["Lawras - Lordaeron"] = "Default",
		["Elendraa - Icecrown"] = "Default",
		["Warmat - Icecrown"] = "Default",
		["Wilinia - Icecrown"] = "Default",
		["Mandatum - Icecrown"] = "Default",
		["Modos - Icecrown"] = "Default",
		["Allisone - Icecrown"] = "Default",
		["Tabinia - Icecrown"] = "Default",
		["Lawras - Icecrown"] = "Default",
	},
	["factionrealm"] = {
		["Alliance - Icecrown"] = {
			["gb"] = {
				["Dragon Knights"] = {
					{
					}, -- [1]
					{
					}, -- [2]
					{
					}, -- [3]
					{
					}, -- [4]
					{
					}, -- [5]
					{
					}, -- [6]
				},
				["Monster Energy TM"] = {
					{
					}, -- [1]
					{
					}, -- [2]
					{
					}, -- [3]
					{
					}, -- [4]
					{
					}, -- [5]
					{
					}, -- [6]
				},
			},
		},
	},
}
