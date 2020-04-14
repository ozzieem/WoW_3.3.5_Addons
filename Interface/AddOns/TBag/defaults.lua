-- $Id: defaults.lua 374 2010-09-20 06:14:32Z shefki $

-- Localization Support
local L = TBag.LOCALE;

TBag.S_RARITY  = "R_";  -- Do not touch this  ;-)

TBag.DefaultItemOverrides = {
};

-- Category, Keywords, Tooltip Search, ItemType, ItemSubType
TBag.DefaultSearchList = {
-- Quest items and Collectibles
  { L["ACT_ON"], L[""], L["This Item Begins a Quest"], L[""], L[""] },
  { L["ACT_OPEN"], L[""], L["<Right Click to Open>"], L[""], L[""] },
  { L["ACT_OPEN"], L[""], L[" Lockbox"], L["Miscellaneous"], L[""] },
  { L["PVP"], L[""], L["Mark of Honor Hold"], L["Consumable"], L[""] },
  { L["PVP"], L[""], L["Mark of Thrallmar"], L["Consumable"], L[""] },
  { L["PVP"], L[""], L["Halaa Battle Token"], L["Miscellaneous"], L[""] },
  { L["PVP"], L[""], L["Spirit Shard"], L["Quest"], L[""] },
  { L["ZUL_GURUB"], L[""], L["Zandalar Honor Token"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Argent Dawn Valor Token"], L["Quest"], L[""] },
  { L["ENCHANTS"], L[""], L["Use: Permanently"], L["Consumable"], L[""] },
  { L["ENCHANTS"], L[""], L["Use: Permanently"], L["Quest"], L[""] },
  { L["ENCHANTS"], L[""], L["Use: Permanently"], L["Miscellaneous"], L[""] },
  { L["GLYPHS"], L[""], L[""], L["Glyph"], L[""] },
  { L["HEARTH"], L[""], L["Hearthstone%s"], L["Miscellaneous"], L[""] },
  { L["MINIPET"], L[""], L["Right Click to summon and dismiss"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Summons or dismisses a Spirit of"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Use: Teaches you how to summon a?n?d? ?d?i?s?m?i?s?s? ?this companion."], L[""], L[""] },
  { L["MINIPET"], L[""], L["Papa Hummel's Old%-Fashioned Pet Biscuit"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Silver Shafted Arrow"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Pet Leash"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Fetch Ball"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Happy Pet Snack"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Nurtured Penguin Egg"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Truesilver Shafted Arrow"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Kirin Tor Familiar"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Unhatched Mr. Chilly"], L[""], L[""] },
  { L["MINIPET"], L[""], L["Frosty's Collar"], L[""], L[""] },
  { L["COMBATPETS"], L[""], L["Summons a .* that will protect you for"], L["Consumable"], L[""] },
  { L["COMBATPETS"], L[""], L["Creates a .* that will fight for you"], L[""], L[""] },
  { L["COMBATPETS"], L[""], L["Crashin' Thrashin'"], L[""], L[""] },
  { L["COMBATPETS"], L[""], L["Tonk Controller"], L[""], L["Devices"] },
  { L["COMBATPETS"], L[""], L["Mechanical Yeti"], L["Consumable"], L[""] },
  { L["COMBATPETS"], L[""], L["Explosive Sheep"], L[""], L[""] },
  { L["COMBATPETS"], L[""], L["Goblin Land Mine"], L[""], L[""] },
  { L["COMBATPETS"], L[""], L["Eye of Arachnida"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Orb of the Sin'dorei"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Orb of the Blackwhelp"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Winter Veil Disguise Kit"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Hallowed Wand %- "], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Murloc Costume"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Weighted Jack%-o'%-Lantern"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Gordok Ogre Suit"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Transforms your mount into something more festive"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Your mount will be more festive"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Iron Boot Flask"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Frenzyheart Brew"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Blossoming Branch"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Carved Ogre Idol"], L[""], L[""] },
  { L["COSTUMES"], L[""], L["Gnomeregan Pride"], L[""], L[""] },
  { L["FIREWORKS"], L[""], L["Shoots a.*firework"], L["Consumable"], L[""] },
  { L["FIREWORKS"], L[""], L["Shoots a.*firework"], L["Weapon"], L[""] },
  { L["FIREWORKS"], L[""], L["Place on the ground to launch .* rockets"], L[""], L[""] },
  { L["FIREWORKS"], L[""], L["Throw into a .* launcher"], L["Miscellaneous"], L[""] },
  { L["FIREWORKS"], L[""], L["Throw into a .* launcher"], L["Consumable"], L[""] },
  { L["FIREWORKS"], L[""], L["Festival Firecracker"], L[""], L[""] },
  { L["FIREWORKS"], L[""], L["Perpetual Purple Firework"], L[""], L[""] },
  { L["MOUNT"], L[""], L["Requires Riding %("], L[""], L[""] },
  { L["MOUNT"], L[""], L["Summons and dismisses a rideable"], L[""], L[""] },
  { L["MOUNT"], L[""], L["Rickety Magic Broom"], L[""], L[""] },
  { L["TOYS"], L[""], L["Brazier of Dancing Flames"], L[""], L[""] },
  { L["TOYS"], L[""], L["Direbrew's Remote"], L[""], L[""] },
  { L["TOYS"], L[""], L["Goblin Weather Machine %- Prototype 01%-B"], L[""], L[""] },
  { L["TOYS"], L[""], L["Use: Right Click to set up a .* picnic."], L[""], L[""] },
  { L["TOYS"], L[""], L["D\.I\.S\.C\.O\."], L[""], L[""] },
  { L["TOYS"], L[""], L["Imp in a Ball"], L[""], L[""] },
  { L["TOYS"], L[""], L["Snowball"], L[""], L[""] },
  { L["TOYS"], L[""], L["Paper Flying Machine Kit"], L[""], L[""] },
  { L["TOYS"], L[""], L["Paper Zeppelin Kit"], L[""], L[""] },
  { L["TOYS"], L[""], L["If they have free room in their pack they will catch it"], L[""], L[""] },
  { L["TOYS"], L[""], L["Fishing Chair"], L[""], L[""] },
  { L["TOYS"], L[""], L["Wand of Holiday Cheer"], L[""], L[""] },

  { L["TOYS"], L[""], L["Elune Stone"], L[""], L[""] },
  { L["TOYS"], L[""], L["Elder's Moonstone"], L[""], L[""] },
  { L["TOYS"], L[""], L["Shower a nearby target with a cascade of"], L["Miscellaneous"], L[""] },
  { L["TOYS"], L[""], L["Path of Illidan"], L[""], L[""] },
  { L["TOYS"], L[""], L["Titanium Seal of Dalaran"], L[""], L[""] },
  { L["TOYS"], L[""], L["Grindgear Toy Gorilla"], L[""], L[""] },
  { L["TOYS"], L[""], L["Copper Racer"], L[""], L[""] },
  { L["TOYS"], L[""], L["Toy Train Set"], L[""], L[""] },
  { L["TOYS"], L[""], L["Wind%-Up Train Wrecker"], L[""], L[""] },
  { L["TOYS"], L[""], L["Rolls a pair of dice"], L[""], L[""] },
  { L["TOYS"], L[""], L["Tiny %a+ Ragdoll"], L[""], L[""] },
  { L["TOYS"], L[""], L["Sandbox Tiger"], L[""], L[""] },
  { L["TOYS"], L[""], L["Foam Sword Rack"], L[""], L[""] },
  { L["TOYS"], L[""], L["Unusual Compass"], L[""], L[""] },
  { L["TOYS"], L[""], L["Path of Cenarius"], L[""], L[""] },
  { L["TOYS"], L[""], L["Ogre Pinata"], L[""], L[""] },
  { L["TOYS"], L[""], L["Brazie's Gnomish Pleasure Device"], L[""], L[""] },
  { L["TOYS"], L[""], L["The Flag of Ownership"], L[""], L[""] },


  { L["AHN_QIRAJ"], L[""], L["%a+ Scarab"], L["Quest"], L[""] },
  { L["AHN_QIRAJ"], L[""], L["%a+ Idol"], L["Quest"], L[""] },
  { L["AHN_QIRAJ"], L[""], L["Qiraji %a+ %a+"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Bone Fragments"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Core of Elements"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Crypt Fiend Parts"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Dark Iron Scraps"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Savage Frond"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Insignia of the Crusade"], L["Miscellaneous"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Insignia of the Dawn"], L["Miscellaneous"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Mantle of the Dawn"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Vitreous Focuser"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Osseous Agitator"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Somatic Intensifier"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Ectoplasmic Resonator"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L["Arcane Quickener"], L["Quest"], L[""] },
  { L["ARGENT_DAWN"], L[""], L[" Scourgestone"], L["Quest"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Cenarion %a+ Badge"], L["Quest"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Twilight Text"], L["Quest"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Twilight Cultist"], L["Armor"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Twilight Cultist"], L["Miscellaneous"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Abyssal Crest"], L["Quest"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Abyssal Signet"], L["Quest"], L[""] },
  { L["CENARION_CIRCLE"], L[""], L["Abyssal Scepter"], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Darkmoon Faire Prize Ticket"], L[""], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Soft Bushy Tail"], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Vibrant Plume"], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Small Furry Paw"], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Evil Bat Eye"], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Torn Bear Pelt"], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Glowing Scorpid Blood"], L["Miscellaneous"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Property of the Darkmoon Faire."], L["Quest"], L[""] },
  { L["DARKMOON_FAIRE"], L[""],  L["Combine the %a+ through %a+ of %a+ to complete the set."], L["Quest"], L[""] },
  { L["THORIUM_BROTHER"], L[""], L["Incendosaur Scale"], L["Quest"], L[""] },
  { L["THORIUM_BROTHER"], L[""], L["Dark Iron Residue"], L["Quest"], L[""] },
  { L["TIMBERMAW"], L[""], L["Deadwood Headdress Feather"], L["Quest"], L[""] },
  { L["TIMBERMAW"], L[""], L["Winterfall Spirit Beads"], L["Quest"], L[""] },
  { L["ZUL_GURUB"], L[""], L["%a+ Coin"], L["Quest"], L[""] },
  { L["ZUL_GURUB"], L[""], L["%a+ Bijou"], L["Quest"], L[""] },
  { L["ZUL_GURUB"], L[""], L["Primal Hakkari"], L["Quest"], L[""] },
  { L["ZUL_GURUB"], L[""], L["Primal Hakkari"], L["Miscellaneous"], L["Junk"] },
  { L["OGRI'LA"], L[""], L["Apexis Crystal"], L["Miscellaneous"], L[""]},
  { L["OGRI'LA"], L[""], L["to create a dragonscale cloak"], L["Miscellaneous"], L[""]},
  { L["OGRI'LA"], L[""], L["Darkrune"], L["Miscellaneous"], L[""]},
  { L["OGRI'LA"], L[""], L["Darkrune"], L["Consumable"], L[""]},
  { L["NETHERWING"], L[""], L["Netherwing Egg"], L["Miscellaneous"], L[""]},
  { L["NETHERWING"], L[""], L["Nethercite Ore"], L["Quest"], L[""]},
  { L["NETHERWING"], L[""], L["Netherdust Pollen"], L["Quest"], L[""]},
  { L["NETHERWING"], L[""], L["Netherwing Crystal"], L["Miscellaneous"], L[""]},
  { L["NETHERWING"], L[""], L["Nethermine Cargo"], L["Quest"], L[""]},
  { L["CENARION_EXPEDITION"], L[""], L["Unidentified Plant Parts"], L["Quest"], L[""]},
  { L["CENARION_EXPEDITION"], L[""], L["Coilfang Armaments"], L["Quest"], L[""]},
  { L["SPOREGGAR"], L[""], L["Mature Spore Sac"], L["Quest"], L[""]},
  { L["SPOREGGAR"], L[""], L["Bog Lord Tendril"], L["Quest"], L[""]},
  { L["SPOREGGAR"], L[""], L["Glowcap"], L["Quest"], L[""]},
  { L["SPOREGGAR"], L[""], L["Fertile Spores"], L["Quest"], L[""]},
  { L["SPOREGGAR"], L[""], L["Sanguine Hibiscus"], L["Quest"], L[""]},
  { L["CONSORTIUM"], L[""], L["Obsidian Warbeads"], L["Quest"], L[""]},
  { L["CONSORTIUM"], L[""], L["Oshu'gun Crystal Fragment"], L["Quest"], L[""]},
  { L["CONSORTIUM"], L[""], L["Pair of Ivory Tusks"], L["Quest"], L[""]},
  { L["CONSORTIUM"], L[""], L["Zaxxis Insignia"], L["Quest"], L[""]},
  { L["CONSORTIUM"], L[""], L["Ethereum Prisoner I%.D%. Tag"], L["Miscellaneous"], L[""]},
  { L["CONSORTIUM"], L[""], L["Ethereum Prison Key"], L["Key"], L[""]},
  { L["HALAA"], L[""], L["Halaa Research Token"], L["Miscellaneous"], L[""]},
  { L["HALAA"], L[""], L["Oshu'gun Crystal Powder Sample"], L["Miscellaneous"], L[""]},
  { L["SCRYER"], L[""], L["Dampscale Basilisk Eye"], L["Quest"], L[""]},
  { L["SCRYER"], L[""], L["Firewing Signet"], L["Quest"], L[""]},
  { L["SCRYER"], L[""], L["Sunfury Signet"], L["Quest"], L[""]},
  { L["SCRYER"], L[""], L["Arcane Tome"], L["Quest"], L[""]},
  { L["SCRYER"], L[""], L["Arcane Rune"], L["Consumable"], L[""]},
  { L["ALDOR"], L[""], L["Dreadfang Venom Sac"], L["Quest"], L[""]},
  { L["ALDOR"], L[""], L["Mark of Kil'jaeden"], L["Quest"], L[""]},
  { L["ALDOR"], L[""], L["Mark of Sargeras"], L["Quest"], L[""]},
  { L["ALDOR"], L[""], L["Fel Armament"], L["Quest"], L[""]},
  { L["ALDOR"], L[""], L["Holy Dust"], L["Consumable"], L[""]},
  { L["ALDOR"], L[""], L["Mark of the Illidari"], L["Miscellaneous"], L[""]},
  { L["SHA'TAR"], L[""], L["Badge of Justice"], L[""], L[""]},
  { L["LOWER_CITY"], L[""], L["Arakkoa Feather"], L["Quest"], L[""]},

  { string.format(L["EQUIPPED_%s"],L["TRINKET"]), L["EQUIPPED"],
    L["Trinket"], L["Quest"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["TRINKET"]), L["SOULBOUND"],
    L["Trinket"], L["Quest"], L[""] },
  { L["TRINKET"], L[""], L["Trinket"], L["Quest"], L[""] },

  { string.format(L["EQUIPPED_%s"],L["02_NECK"]), L["EQUIPPED"], L["Blessed Medallion of Karabor"], L["Quest"], L[""]},
  { string.format(L["SOULBOUND_%s"],L["02_NECK"]), L["SOULBOUND"], L["Blessed Medallion of Karabor"], L["Quest"], L[""]},
  { L["02_NECK"], L[""], L["Blessed Medallion of Karabor"], L["Quest"], L[""]},
  { L["QUEST"], L[""], L[""], L["Quest"], L[""] },
  { L["QUEST"], L[""], L["Quest Item"], L[""], L[""] },
  { L["QUEST"], L[""], L["Morbent"], L["Armor"], L[""] },
  { L["CONSUMABLE"], L[""], L["Goblin Gumbo"], L["Consumable"], L[""] },
  { L["GRAY_ITEMS"], TBag.S_RARITY.."0",  L[""], L[""], L[""] },

-- Containers
  { L["BAG"], L[""], L[""], L["Container"], L[""] },
  { L["BAG"], L[""], L[""], L["Quiver"], L[""] },
  { L["PROJECTILE"], L[""], L[""], L["Projectile"], L[""] },


  { L["BOOK"], L[""], L["Codex: "], L["Recipe"], L[""] },
  { L["BOOK"], L[""], L["Manual: "], L["Recipe"], L[""] },
  { L["BOOK"], L[""], L["Expert "], L["Recipe"], L[""] },
  { L["BOOK"], L[""], L["Tome of "], L["Recipe"], L[""] },
  { L["DESIGN"], L[""], L["Design: "], L["Recipe"], L[""] },
  { L["FORMULA"], L[""], L["Formula: "], L["Recipe"], L[""] },
  { L["RECIPE"], L[""], L["Recipe: "], L["Recipe"], L[""] },
  { L["PATTERN"], L[""], L["Pattern: "], L["Recipe"], L[""] },
  { L["PLANS"], L[""], L["Plans: "], L["Recipe"], L[""] },
  { L["SCHEMATIC"], L[""], L["Schematic: "], L["Recipe"], L[""] },
  { L["RECIPE_OTHER"], L[""], L[""], L["Recipe"], L[""] },

-- Equipment
  { L["TRADE_TOOL"], L[""], L["[Ss]kinning [Kk]nife"], L["Weapon"], L[""] },
  { L["TRADE_TOOL"], L[""], L["[Mm]ining [Pp]ick"], L["Weapon"], L[""] },
  { L["TRADE_TOOL"], L[""], L["[Bb]lacksmith [Hh]ammer"], L["Weapon"], L[""] },
  { L["TRADE_TOOL"], L[""], L["Runed %a+ Rod"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Philosopher's Stone"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Salt Shaker"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Arclight Spanner"], L["Weapon"], L[""] },
  { L["TRADE_TOOL"], L[""], L["Gyromatic Micro%-Adjust[oe]r"], L["Trade Goods"], L[""] },
  { L["TRADE_TOOL"], L[""], L["Zulian Slicer"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Finkle's Skinner"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Blood Scythe"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Herbalist's Gloves"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Virtuoso Inking Set"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Zapthrottle Mote Extractor"], L[""], L[""] },
  { L["TRADE_TOOL"], L[""], L["Gnomish Army Knife"], L[""], L[""] },
  { string.format(L["EQUIPPED_%s"],L["WEAPON"]), L["EQUIPPED"],
    L[""], L["Dwarven Fishing Pole"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["WEAPON"]), L["SOULBOUND"],
    L[""], L["Dwarven Fishing Pole"], L[""] },
  { L["WEAPON"], L[""], L["Dwarven Fishing Pole"], L[""], L[""] },
  { L["EXPLOSIVES"], L[""], L["Goblin Fishing Pole"], L[""], L[""] },
  { L["FISHING"], L[""], L["Fishing"], L[""], L[""] },
  { L["FOOD"], L[""], L["Everlasting Underspore Frond"], L["Armor"], L[""] },
  { L["ENGINEERING"], L[""], L["Ultrasafe Transporter:"], L["Armor"], L[""] },
  { L["ENGINEERING"], L[""], L["Dimensional Ripper - "], L["Armor"], L[""] },
  { L["ENGINEERING"], L[""], L["Wormhole Generator:"], L["Armor"], L[""] },
  { L["ENGINEERING"], L[""], L["Goblin Beam Welder"], L[""], L[""] },

  { string.format(L["EQUIPPED_%s"],L["TRINKET"]), L["EQUIPPED"],
    L["Trinket"], L["Trade Goods"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["TRINKET"]), L["EQUIPPED"],
    L["Trinket"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["RELIC"]), L["EQUIPPED"], L["Relic"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["RING"]), L["EQUIPPED"], L["Finger"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["01_HEAD"]), L["EQUIPPED"],
    L["\nHead"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["02_NECK"]), L["EQUIPPED"],
    L["\nNeck"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["03_SHOULDER"]), L["EQUIPPED"],
    L["\nShoulder"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["04_BACK"]), L["EQUIPPED"],
    L["\nBack"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["05_CHEST"]), L["EQUIPPED"],
    L["\nChest"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["06_SHIRT"]), L["EQUIPPED"],
    L["\nShirt"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["07_TABARD"]), L["EQUIPPED"],
    L["\nTabard"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["08_WRIST"]), L["EQUIPPED"],
    L["\nWrist"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["09_HANDS"]), L["EQUIPPED"],
    L["\nHands"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["10_WAIST"]), L["EQUIPPED"],
    L["\nWaist"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["11_LEGS"]), L["EQUIPPED"],
    L["\nLegs"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["12_FEET"]), L["EQUIPPED"],
    L["\nFeet"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["13_OFFHAND"]), L["EQUIPPED"],
    L["\nHeld In Off%-hand"], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["ARMOR"]), L["EQUIPPED"], L[""], L["Armor"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["WEAPON"]), L["EQUIPPED"], L[""], L["Weapon"], L[""] },
  { string.format(L["EQUIPPED_%s"],L["OTHER"]), L["EQUIPPED"], L[""], L[""], L[""] },

  { string.format(L["SOULBOUND_%s"],L["TRINKET"]), L["SOULBOUND"],
    L["Trinket"], L["Trade Goods"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["TRINKET"]), L["SOULBOUND"],
    L["Trinket"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["RELIC"]), L["SOULBOUND"], L["Relic"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["RING"]), L["SOULBOUND"], L["Finger"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["01_HEAD"]), L["SOULBOUND"],
    L["\nHead"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["02_NECK"]), L["SOULBOUND"],
    L["\nNeck"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["03_SHOULDER"]), L["SOULBOUND"],
    L["\nShoulder"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["04_BACK"]), L["SOULBOUND"],
    L["\nBack"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["05_CHEST"]), L["SOULBOUND"],
    L["\nChest"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["06_SHIRT"]), L["SOULBOUND"],
    L["\nShirt"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["07_TABARD"]), L["SOULBOUND"],
    L["\nTabard"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["08_WRIST"]), L["SOULBOUND"],
    L["\nWrist"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["09_HANDS"]), L["SOULBOUND"],
    L["\nHands"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["10_WAIST"]), L["SOULBOUND"],
    L["\nWaist"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["11_LEGS"]), L["SOULBOUND"],
    L["\nLegs"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["12_FEET"]), L["SOULBOUND"],
    L["\nFeet"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["13_OFFHAND"]), L["SOULBOUND"],
    L["\nHeld In Off%-hand"], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["ARMOR"]), L["SOULBOUND"], L[""], L["Armor"], L[""] },
  { string.format(L["SOULBOUND_%s"],L["WEAPON"]), L["SOULBOUND"], L[""], L["Weapon"], L[""] },

  { string.format(L["ACCOUNTBOUND_%s"],L["TRINKET"]), L["ACCOUNTBOUND"],
    L["Trinket"], L["Trade Goods"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["TRINKET"]), L["ACCOUNTBOUND"],
    L["Trinket"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["RELIC"]), L["ACCOUNTBOUND"], L["Relic"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["RING"]), L["ACCOUNTBOUND"], L["Finger"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["01_HEAD"]), L["ACCOUNTBOUND"],
    L["\nHead"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["02_NECK"]), L["ACCOUNTBOUND"],
    L["\nNeck"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["03_SHOULDER"]), L["ACCOUNTBOUND"],
    L["\nShoulder"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["04_BACK"]), L["ACCOUNTBOUND"],
    L["\nBack"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["05_CHEST"]), L["ACCOUNTBOUND"],
    L["\nChest"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["06_SHIRT"]), L["ACCOUNTBOUND"],
    L["\nShirt"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["07_TABARD"]), L["ACCOUNTBOUND"],
    L["\nTabard"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["08_WRIST"]), L["ACCOUNTBOUND"],
    L["\nWrist"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["09_HANDS"]), L["ACCOUNTBOUND"],
    L["\nHands"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["10_WAIST"]), L["ACCOUNTBOUND"],
    L["\nWaist"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["11_LEGS"]), L["ACCOUNTBOUND"],
    L["\nLegs"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["12_FEET"]), L["ACCOUNTBOUND"],
    L["\nFeet"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["13_OFFHAND"]), L["ACCOUNTBOUND"],
    L["\nHeld In Off%-hand"], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["ARMOR"]), L["ACCOUNTBOUND"], L[""], L["Armor"], L[""] },
  { string.format(L["ACCOUNTBOUND_%s"],L["WEAPON"]), L["ACCOUNTBOUND"], L[""], L["Weapon"], L[""] },

  { L["TRINKET"], L[""], L["Trinket"], L["Trade Goods"], L[""] },
  { L["TRINKET"], L[""], L["Trinket"], L["Armor"], L[""] },
  { L["RELIC"], L[""], L["Relic"], L["Armor"], L[""] },
  { L["RING"], L[""], L["Finger"], L["Armor"], L[""] },
  { L["01_HEAD"], L[""], L["\nHead"], L["Armor"], L[""] },
  { L["02_NECK"], L[""], L["\nNeck"], L["Armor"], L[""] },
  { L["03_SHOULDER"], L[""], L["\nShoulder"], L["Armor"], L[""] },
  { L["04_BACK"], L[""], L["\nBack"], L["Armor"], L[""] },
  { L["05_CHEST"], L[""], L["\nChest"], L["Armor"], L[""] },
  { L["06_SHIRT"], L[""], L["\nShirt"], L["Armor"], L[""] },
  { L["07_TABARD"], L[""], L["\nTabard"], L["Armor"], L[""] },
  { L["08_WRIST"], L[""], L["\nWrist"], L["Armor"], L[""] },
  { L["09_HANDS"], L[""], L["\nHands"], L["Armor"], L[""] },
  { L["10_WAIST"], L[""], L["\nWaist"], L["Armor"], L[""] },
  { L["11_LEGS"], L[""], L["\nLegs"], L["Armor"], L[""] },
  { L["12_FEET"], L[""], L["\nFeet"], L["Armor"], L[""] },
  { L["13_OFFHAND"], L[""], L["\nHeld In Off%-hand"], L["Armor"], L[""] },
  { L["ARMOR"], L[""], L[""], L["Armor"], L[""] },
  { L["WEAPON"], L[""], L[""], L["Weapon"], L[""] },

-- Restores
  { L["BANDAGE"], L[""], L[" Bandage"], L["Consumable"], L[""] },
  { L["HEALTHSTONE"], L[""], L["Instantly restores %d+ life"], L[""], L[""] },
  { L["FOOD_BUFF"], L[""], L[" well fed "], L["Consumable"], L[""] },
  { L["FOOD_BUFF"], L[""], L["Restores %d+ health.* increases your "], L["Consumable"], L[""] },
  { L["FOOD_BUFF"], L[""], L["If you spend at least %d+ seconds eating you will"], L["Consumable"], L[""] },
  { L["COMBO"], L[""], L["Restores %d+ health and %d+ mana over %d+ sec"], L["Consumable"], L[""] },
  { L["COMBO"], L[""], L["Restores %d+ health and %d+ mana over %d+ sec"], L["Trade Goods"], L[""] },
  { L["COMBO"], L[""], L["Restores .* health and .*mana .* %d+ sec"], L["Consumable"], L[""] },
  { L["DRINK"], L[""], L["Restores %d+ mana over %d+ sec"], L["Consumable"], L[""] },
  { L["DRINK"], L[""], L["Must remain seated while drinking%."], L["Consumable"], L[""] },
  { L["FOOD"], L[""], L["Must remain seated while eating%."], L["Consumable"], L[""] },
  { L["FOOD"], L[""], L["Restores %d+ health over %d+ sec"], L["Consumable"], L[""] },
  { L["FOOD"], L[""], L["Restores %d+ health over %d+ sec"], L["Trade Goods"], L[""] },
  { L["ENERGY_RESTORE"], L[""], L["Thistle Tea"], L["Consumable"], L[""] },
  { L["ENERGY_RESTORE"], L[""], L["[Rr]estores %d+ energy"], L[""], L[""] },
  { L["RAGE_RESTORE"], L[""], L["Rage Potion"], L["Consumable"], L[""] },
  { L["RAGE_RESTORE"], L[""], L["[Rr]estores %d+ rage"], L[""], L[""] },
  { L["COMBO_RESTORE"], L[""], L["Rejuvenation Potion"], L["Consumable"], L[""] },
  { L["COMBO_RESTORE"], L[""], L["Dreamless Sleep"], L["Consumable"], L[""] },
  { L["COMBO_RESTORE"], L[""], L["[Rr]estores %d+ to %d+ mana and health"], L[""], L[""] },
  { L["MANA_RESTORE"], L[""], L["Mana Potion"], L["Consumable"], L[""] },
  { L["MANA_RESTORE"], L[""], L["[Rr]estores %d+ to %d+ mana"], L[""], L[""] },
  { L["HEALTH_RESTORE"], L[""], L["Healing Potion"], L["Consumable"], L[""] },
  { L["HEALTH_RESTORE"], L[""], L["[Rr]estores %d+ to %d+ health"], L[""], L[""] },
  { L["HEALTH_RESTORE"], L[""], L["Place a %a+ stone statue"], L["Consumable"], L[""] },

-- Combat buffs
  { L["CURE"], L[""], L[" [Cc]ure.* poison"], L[""], L[""] },
  { L["CURE"], L[""], L[" [Cc]ure.* disease"], L[""], L[""] },
  { L["CURE"], L[""], L[" [Cc]ure.* curse"], L[""], L[""] },
  { L["CURE"], L[""], L[" [Cc]ure.* magic"], L[""], L[""] },
  { L["CURE"], L[""], L[" [Rr]emoves %d+ .*effect"], L[""], L[""] },
  { L["EXPLOSIVES"], L[""], L[""], L["Trade Goods"], L["Explosives"] },
  { L["EXPLOSIVES"], L[""], L[" Dynamite"], L[""], L[""] },
  { L["EXPLOSIVES"], L[""], L[" Bomb"], L[""], L[""] },
  { L["EXPLOSIVES"], L[""], L[" Mortar"], L[""], L[""] },
  { L["BUFF"], L[""], L["Scroll"], L["Consumable"], L[""] },
  { L["BUFF"], L[""], L["Use: Increases "], L["Consumable"], L[""] },
  { L["BUFF"], L[""], L["Use: Increases "], L["Trade Goods"], L[""] },
  { L["BUFF"], L[""], L["Use: Absorbs "], L["Consumable"], L[""] },
  { L["BUFF"], L[""], L["Use: Regenerate "], L["Consumable"], L[""] },
  { L["BUFF"], L[""], L["Use: While applied to target weapon"], L[""], L[""] },
  { L["BUFF"], L[""], L[" Sharpening Stone"], L[""], L[""] },
  { L["BUFF"], L[""], L[" Weightstone"], L[""], L[""] },
  { L["BUFF"], L[""], L["Mistletoe"], L["Miscellaneous"], L[""] },
  { L["BUFF"], L[""], L["Toasting Goblet"], L["Miscellaneous"], L[""] },
  { L["BUFF"], L[""], L["Flame Cap"], L["Trade Goods"], L[""]},
  { L["BUFF"], L[""], L["[AG][li][lv][oe]w?s the [Ii]mbiber "], L["Consumable"], L[""]},
  { L["KEY_OPEN"], L[""], L[" Key"], L["Trade Goods"], L[""] },
  { L["KEY_QUEST"], L[""], L[" Key"], L["Key"], L[""] },

-- Reagents
  { L["CLASS_REAGENT"], L[""], L["Light Feather"], L["Miscellaneous"], L["Reagent"] },

  { string.format(L["%s_REAGENT"],L["WARLOCK"]), L[""],
    L["Infernal Stone"], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["WARLOCK"]), L[""],
    L["Demonic Figurine"], L["Miscellaneous"], L["Reagent"] },

  { string.format(L["%s_REAGENT"],L["DRUID"]), L[""],
    L[" Seed"], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["DRUID"]), L[""],
    L["Wild "], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["MAGE"]), L[""],
    L["Arcane Powder"], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["MAGE"]), L[""],
    L["Rune of "], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["PALADIN"]), L[""],
    L["Symbol of"], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["PRIEST"]), L[""],
    L[" Candle"], L["Miscellaneous"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["SHAMAN"]), L[""], L["Ankh"], L["Reagent"], L["Reagent"] },
  { string.format(L["%s_REAGENT"],L["SHAMAN"]), L[""], L["Fish Oil"], L[""], L[""] },
  { string.format(L["%s_REAGENT"],L["SHAMAN"]), L[""], L["Shiny Fish Scales"], L[""], L[""] },
  { string.format(L["%s_REAGENT"],L["DEATHKNIGHT"]), L[""], L["Corpse Dust"], L[""], L[""] },
  { string.format(L["%s_REAGENT"],L["ROGUE"]), L[""], L["Coats a weapon with poison that lasts for"], L[""], L[""] },

  { string.format(L["%s_TOOL"],L["ROGUE"]), L[""], L["Thieves' Tools"], L[""], L[""] },
  { string.format(L["%s_TOOL"],L["SHAMAN"]), L[""],
    L[" Totem"], L["Miscellaneous"], L["Reagent"] },
  { L["SOULSHARD"], L[""], L["Soul Shard"], L["Miscellaneous"], L["Reagent"] },

  { L["DUMMY"], L[""], L["Target Dummy"], L["Trade Goods"], L[""] },

-- Reagents that aren't really specific to a trade
-- but are used by a variety so special case them.
  { L["REAGENT"], L[""], L["Elemental %a+"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Essence of %a+"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Globe of Water"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Breath of Wind"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Heart of Fire"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Core of Earth"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Mote of %a+"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Primal Nether"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Primal %a+"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Void Crystal"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Nether Vortex"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Heart of Darkness"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Sunmote"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Frozen Orb"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Runed Orb"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Crusader Orb"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Primordial Saronite"], L["Trade Goods"], L[""]},
  { L["REAGENT"], L[""], L["Crystallized %a+"], L["Trade Goods"], L["Elemental"]},
  { L["REAGENT"], L[""], L["Eternal %a+"], L["Trade Goods"], L["Elemental"]},


-- Trades (fishing done above before equipment)
  { L["ALCHEMY"], L[""], L[" Vial"], L["Trade Goods"], L[""] },
  { L["CLOTH"], L[""],   L["[cC]loth"], L["Trade Goods"], L[""] },
  { L["TRADE1"], L["TRADE1"], L[""], L[""], L[""] },
  { L["TRADE2"], L["TRADE2"], L[""], L[""], L[""] },
  { string.format(L["%s_CREATED"],L["TRADE1"]), string.format(L["%s_CREATED"],L["TRADE1"]),
    L[""], L[""], L[""] },
  { string.format(L["%s_CREATED"],L["TRADE2"]), string.format(L["%s_CREATED"],L["TRADE2"]),
    L[""], L[""], L[""] },
  { L["ALCHEMY"], L["ALCHEMY"], L[""], L[""], L[""] },
  { L["COOKING"], L["COOKING"], L[""], L[""], L[""] },
  { L["COOKING"], L[""], L["Raw "], L["Consumable"], L[""] },
  { L["COOKING"], L[""], L["[Ff]ish"], L["Consumable"], L[""] },
  { L["COOKING"], L[""], L[" Meat"], L["Trade Goods"], L[""] },
  { L["ENCHANTING"], L["ENCHANTING"], L[""], L[""], L[""] },
  { L["ENCHANTING"], L[""], L["%a+ Dust"], L[""], L[""] },
  { L["ENCHANTING"], L[""], L["Lesser %a+ Essence"], L[""], L[""] },
  { L["ENCHANTING"], L[""], L["Greater %a+ Essence"], L[""], L[""] },
  { L["ENCHANTING"], L[""], L["Small %a+ Shard"], L["Trade Goods"], L["Enchanting"] },
  { L["ENCHANTING"], L[""], L["Large %a+ Shard"], L["Trade Goods"], L["Enchanting"] },
  { L["BLACKSMITHING"], L["BLACKSMITHING"], L[""], L[""], L[""] },
  { L["ENGINEERING"], L[""], L["Engineer's Ink"], L[""], L[""]},
  { L["INSCRIPTION"], L[""], L["Ink"], L["Trade Goods"], L["Parts"]},
  { L["INSCRIPTION"], L[""], L[" Parchment"], L["Trade Goods"], L[""]},
  { L["INSCRIPTION"], L[""], L[" Pigment"], L["Trade Goods"], L[""]},
  { L["INSCRIPTION"], L["INSCRIPTION"], L[""], L[""], L[""]},
  { L["ENGINEERING"], L["ENGINEERING"], L[""], L[""], L[""]},
  { L["FIRST_AID"], L["FIRST_AID"], L[""], L[""], L[""] },
  { L["FISHING"], L["FISHING"], L[""], L[""], L[""] },
  { L["JEWELCRAFTING"], L["JEWELCRAFTING"], L[""], L[""], L[""] },
  { L["LEATHERWORKING"], L["LEATHERWORKING"], L[""], L[""], L[""]},
  { L["MINING"], L["MINING"], L[""], L[""], L[""] },
  { L["TAILORING"], L["TAILORING"], L[""], L[""], L[""]},

  { L["REAGENT"], L[""], L[""], L["Reagent"], L[""] },
  { L["TRADE_GOODS"], L[""], L[""], L["Trade Goods"], L[""] },

-- Random catchalls
  { L["CONSUMABLE"], L[""], L[""], L["Consumable"], L[""] },
  { L["MISC"], L[""], L[""], L["Miscellaneous"], L[""] },

-- Who knows?
  { string.format(L["SOULBOUND_%s"],L["OTHER"]), L["SOULBOUND"], L[""], L[""], L[""] },
  { L["UNKNOWN"], L[""], L[""], L[""], L[""] }
};
