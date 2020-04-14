-- $Id: TBagTest.lua 353 2009-12-21 03:47:02Z shefki $

-- Test harness don't bother to load if this isn't a dev version.
if (not string.match(TBag.VERSION,"-Alpha") and
    not string.match(TBag.VERSION,"-Beta")) then
  return
end

local TBag = TBag

-- Localization Support
local L = TBag.LOCALE;

-- Config table we'll use.
local cfg = { }

-- Table of tests to execute.
-- Key is an itemid and the value is the expected category.
-- Multiple possible category matches can be separated with a | (pipe) character.
-- This is needed for some items like items that can be opened, the tooltip
-- string for opening the item only shows if you actually have the item in your
-- inventory.
local tests = {
  [1357] = L["ACT_ON"],
  -- Note we can't test the Right click to open rule because it's
  -- added only for items actually in your inventory.
  [5759] = L["ACT_OPEN"],

  -- PVP Items
  [24579] = L["PVP"],
  [26045] = L["PVP"],
  [28558] = L["PVP"],
  [24581] = L["PVP"],

  -- Enchants
  [11643] = L["ENCHANTS"],
  [24276] = L["ENCHANTS"],
  [29193] = L["ENCHANTS"],
  [18170] = L["ENCHANTS"],
  [29486] = L["ENCHANTS"],
  [19789] = L["ENCHANTS"],
  [29533] = L["ENCHANTS"],
  [38896] = L["ENCHANTS"],

  -- Glyphs
  [43673] = L["GLYPHS"],
  [40912] = L["GLYPHS"],

  -- Hearthstones
  [6948] = L["HEARTH"],
  [19254] = L["MISC"], -- Has Hearthstone in the tooltip, but isn't one.

  -- Minipets
  [4401] = L["MINIPET"],
  [8492] = L["MINIPET"],
  [23083] = L["MINIPET"],
  [35223] = L["MINIPET"],
  [22200] = L["MINIPET"],
  [37431] = L["MINIPET"],
  [37460] = L["MINIPET"],
  [44820] = L["MINIPET"],
  [43626] = L["MINIPET"],
  [44721] = L["MINIPET"],
  [39898] = L["MINIPET"],
  [39899] = L["MINIPET"],
  [39896] = L["MINIPET"],
  [39286] = L["MINIPET"],
  [41133] = L["MINIPET"],
  [44738] = L["MINIPET"],
  [44723] = L["MINIPET"],
  [22235] = L["MINIPET"],

  -- Combat Pets
  [23767] = L["COMBATPETS"],
  [31666] = L["COMBATPETS"],
  [22728] = L["COMBATPETS"],
  [22729] = L["SCHEMATIC"], -- Patern for the Steam Tonk Controller
  [15778] = L["COMBATPETS"],
  [21277] = L["MINIPET"], -- Similar name but should be a MINIPET.
  [12928] = L["QUEST"], -- Similar name but should be a QUEST item.
  [3456] = L["COMBATPETS"],
  [23379] = L["COMBATPETS"],
  [13508] = L["COMBATPETS"],
  [21325] = L["COMBATPETS"],
  [15778] = L["COMBATPETS"],
  [1187] = L["COMBATPETS"],
  [4391] = L["COMBATPETS"],
  [4395] = L["COMBATPETS"],
  [10725] = L["COMBATPETS"],
  [17067] = L["13_OFFHAND"],
  [13353] = L["13_OFFHAND"],

  -- Costumes
  [35275] = L["COSTUMES"],
  [31337] = L["COSTUMES"],
  [17712] = L["COSTUMES"],
  [20410] = L["COSTUMES"],
  [20409] = L["COSTUMES"],
  [20399] = L["COSTUMES"],
  [20398] = L["COSTUMES"],
  [20397] = L["COSTUMES"],
  [20413] = L["COSTUMES"],
  [20411] = L["COSTUMES"],
  [20414] = L["COSTUMES"],
  [33079] = L["COSTUMES"],
  [34068] = L["COSTUMES"],
  [18258] = L["COSTUMES"],
  [37816] = L["COSTUMES"],
  [21213] = L["COSTUMES"],
  [43499] = L["COSTUMES"],
  [44719] = L["COSTUMES"],
  [44792] = L["COSTUMES"],
  [49704] = L["COSTUMES"],

  -- Fireworks
  [21570] = L["FIREWORKS"],
  [21569] = L["FIREWORKS"],
  [21571] = L["FIREWORKS"],
  [21574] = L["FIREWORKS"],
  [21716] = L["FIREWORKS"],
  [21718] = L["FIREWORKS"],
  [21744] = L["FIREWORKS"],
  [21576] = L["FIREWORKS"],
  [21562] = L["FIREWORKS"],
  [21561] = L["FIREWORKS"],
  [21557] = L["FIREWORKS"],
  [21559] = L["FIREWORKS"],
  [21558] = L["FIREWORKS"],
  [21558] = L["FIREWORKS"],
  [21589] = L["FIREWORKS"],
  [21590] = L["FIREWORKS"],
  [21592] = L["FIREWORKS"],
  [9312] = L["FIREWORKS"],
  [21713] = L["FIREWORKS"],
  [9313] = L["FIREWORKS"],
  [34258] = L["FIREWORKS"],
  [9318] = L["FIREWORKS"],
  [9314] = L["FIREWORKS"],
  [9317] = L["FIREWORKS"],
  [19026] = L["FIREWORKS"],
  [9315] = L["FIREWORKS"],
  [23714] = L["FIREWORKS"], -- it's actually the old trinket that converts to the new non-trinket
  [21747] = L["FIREWORKS"],
  [49703] = L["FIREWORKS"],

  -- Consumables
  [33927] = L["CONSUMABLE"],
  [33219] = L["CONSUMABLE"],

  -- Toys, various non-equipable items that have no real purpose
  [34686] = L["TOYS"],
  [37863] = L["TOYS"],
  [35227] = L["TOYS"],
  [32566] = L["TOYS"],
  [34480] = L["TOYS"],
  [19035] = L["MISC"].."|"..L["ACT_OPEN"], -- Similar name, ACT_OPEN or MISC
  [38301] = L["TOYS"],
  [32542] = L["TOYS"],
  [35557] = L["TOYS"],
  [17202] = L["TOYS"],
  [33081] = L["TOYS"],
  [18662] = L["TOYS"],
  [18640] = L["TOYS"],
  [38308] = L["TOYS"],
  [38308] = L["TOYS"],
  [34497] = L["TOYS"],
  [38266] = L["TOYS"],
  [34494] = L["TOYS"],
  [33223] = L["TOYS"],
  [34499] = L["TOYS"],
  [21540] = L["TOYS"],
  [21536] = L["TOYS"],
  [22218] = L["TOYS"],
  [34191] = L["TOYS"],
  [34684] = L["TOYS"],
  [44849] = L["TOYS"],
  [22206] = L["13_OFFHAND"], -- Similar effect but equipable.
  [38233] = L["TOYS"],
  [34498] = L["TOYS"],
  [44430] = L["TOYS"],
  [44606] = L["TOYS"],
  [45057] = L["TOYS"],
  [44482] = L["TOYS"],
  [44599] = L["TOYS"],
  [44601] = L["TOYS"],
  [44481] = L["TOYS"],
  [21328] = L["TOYS"],
  [36863] = L["TOYS"],
  [36862] = L["TOYS"],
  [21745] = L["TOYS"],
  [45063] = L["TOYS"],
  [45047] = L["TOYS"],
  [45984] = L["TOYS"],
  [46779] = L["TOYS"],
  [46780] = L["TOYS"],
  [49917] = L["TOYS"],
  [38578] = L["TOYS"],

  -- Mounts
  [33977] = L["MOUNT"],
  [32861] = L["MOUNT"],
  [33189] = L["MOUNT"],
  [49288] = L["MOUNT"],
  [49289] = L["MOUNT"],

  -- AQ
  [20864] = L["AHN_QIRAJ"],
  [21685] = L["TRINKET"], -- similar name shouldn't match the rule though
  [19431] = L["TRINKET"], -- similar name shouldn't match the rule though
  [20864] = L["AHN_QIRAJ"],
  [20873] = L["AHN_QIRAJ"],
  [29390] = L["RELIC"], -- Druid idols shouldn't match
  [20888] = L["AHN_QIRAJ"],
  [20884] = L["AHN_QIRAJ"],
  [20885] = L["AHN_QIRAJ"],
  [20889] = L["AHN_QIRAJ"],

  -- Argent Dawn
  [22526] = L["ARGENT_DAWN"],
  [22527] = L["ARGENT_DAWN"],
  [22525] = L["ARGENT_DAWN"],
  [22528] = L["ARGENT_DAWN"],
  [22529] = L["ARGENT_DAWN"],
  [22524] = L["ARGENT_DAWN"],
  [22523] = L["ARGENT_DAWN"],
  [12844] = L["ARGENT_DAWN"],
  -- [18171] = L["ARGENT_DAWN"], -- Not sure what to do on these two
  -- [18170] = L["ARGENT_DAWN"], -- they match enchants too
  [13370] = L["ARGENT_DAWN"],
  [13357] = L["ARGENT_DAWN"],
  [13356] = L["ARGENT_DAWN"],
  [13354] = L["ARGENT_DAWN"],
  [13320] = L["ARGENT_DAWN"],
  [13320] = L["ARGENT_DAWN"],
  [12843] = L["ARGENT_DAWN"],
  [12841] = L["ARGENT_DAWN"],
  [12840] = L["ARGENT_DAWN"],

  -- Cenarion Circle
  [20801] = L["CENARION_CIRCLE"],
  [20800] = L["CENARION_CIRCLE"],
  [20802] = L["CENARION_CIRCLE"],
  [20513] = L["CENARION_CIRCLE"],
  [20514] = L["CENARION_CIRCLE"],
  [20515] = L["CENARION_CIRCLE"],

  -- Darkmoon Faire
  [19182] = L["DARKMOON_FAIRE"],
  [4582] = L["DARKMOON_FAIRE"],
  [4582] = L["DARKMOON_FAIRE"],
  [5117] = L["DARKMOON_FAIRE"],
  [5134] = L["DARKMOON_FAIRE"],
  [11404] = L["DARKMOON_FAIRE"],
  [11407] = L["DARKMOON_FAIRE"],
  [19933] = L["DARKMOON_FAIRE"],
  [19933] = L["DARKMOON_FAIRE"],
  -- The decks actually end up in ACT_ON
  [19257] = L["ACT_ON"],
  [19258] = L["DARKMOON_FAIRE"],
  [19267] = L["ACT_ON"],
  [19268] = L["DARKMOON_FAIRE"],
  [19277] = L["ACT_ON"],
  [19276] = L["DARKMOON_FAIRE"],
  [19228] = L["ACT_ON"],
  [19227] = L["DARKMOON_FAIRE"],
  [31890] = L["ACT_ON"],
  [31882] = L["DARKMOON_FAIRE"],
  [31907] = L["ACT_ON"],
  [31901] = L["DARKMOON_FAIRE"],
  [31914] = L["ACT_ON"],
  [31910] = L["DARKMOON_FAIRE"],
  [31891] = L["ACT_ON"],
  [31892] = L["DARKMOON_FAIRE"],
  [44276] = L["ACT_ON"],
  [44284] = L["DARKMOON_FAIRE"],
  [44326] = L["ACT_ON"],
  [44274] = L["DARKMOON_FAIRE"],
  [44259] = L["ACT_ON"],
  [44266] = L["DARKMOON_FAIRE"],
  [44294] = L["ACT_ON"],
  [44292] = L["DARKMOON_FAIRE"],
  [21136] = L["QUEST"], -- Tooltip text has of Storms so it matched old Darkmoon Faire rules

  -- Thorium Brotherhood
  [18944] = L["THORIUM_BROTHER"],
  [18945] = L["THORIUM_BROTHER"],

  -- Timbermaw
  [21377] = L["TIMBERMAW"],
  [21383] = L["TIMBERMAW"],

  -- Zul'Grub
  [19858] = L["ZUL_GURUB"],
  [19699] = L["ZUL_GURUB"],
  [19708] = L["ZUL_GURUB"],
  [19724] = L["ZUL_GURUB"],
  [19717] = L["ZUL_GURUB"],
  [19716] = L["ZUL_GURUB"],
  [19719] = L["ZUL_GURUB"],
  [19723] = L["ZUL_GURUB"],
  [19720] = L["ZUL_GURUB"],
  [19721] = L["ZUL_GURUB"],
  [19718] = L["ZUL_GURUB"],
  [19722] = L["ZUL_GURUB"],
  [19722] = L["ZUL_GURUB"],
  [22637] = L["ZUL_GURUB"],

  -- Ogri'la
  [32572] = L["OGRI'LA"],
  [32684] = L["OGRI'LA"],
  [32683] = L["OGRI'LA"],
  [32682] = L["OGRI'LA"],
  [32681] = L["OGRI'LA"],
  [32643] = L["OGRI'LA"],
  [33784] = L["OGRI'LA"],
  [33784] = L["OGRI'LA"],
  [32602] = L["OGRI'LA"],

  -- Netherwing
  [32506] = L["NETHERWING"],
  [32464] = L["NETHERWING"],
  [32468] = L["NETHERWING"],
  [32468] = L["NETHERWING"],
  [32427] = L["NETHERWING"],
  [32723] = L["NETHERWING"],

  -- Cenarion Expedition
  [24401] = L["CENARION_EXPEDITION"],
  [24368] = L["CENARION_EXPEDITION"],

  -- Sporeggar
  [24290] = L["SPOREGGAR"],
  [24291] = L["SPOREGGAR"],
  [24291] = L["SPOREGGAR"],
  [24245] = L["SPOREGGAR"],
  [24449] = L["SPOREGGAR"],
  [24449] = L["SPOREGGAR"],
  [24246] = L["SPOREGGAR"],

  -- Consortium
  [25433] = L["CONSORTIUM"],
  [25416] = L["CONSORTIUM"],
  [25463] = L["CONSORTIUM"],
  [29209] = L["CONSORTIUM"],
  [31957] = L["CONSORTIUM"],
  [29460] = L["CONSORTIUM"],

  -- Halaa
  [26044] = L["HALAA"],
  [26042] = L["HALAA"],
  [26043] = L["HALAA"],

  -- Scryer
  [25744] = L["SCRYER"],
  [29426] = L["SCRYER"],
  [30810] = L["SCRYER"],
  [29739] = L["SCRYER"],
  [29736] = L["SCRYER"],

  -- Aldor
  [25802] = L["ALDOR"],
  [29425] = L["ALDOR"],
  [30809] = L["ALDOR"],
  [29740] = L["ALDOR"],
  [29735] = L["ALDOR"],
  [32897] = L["ALDOR"],

  -- Sha'tar
  [29434] = L["SHA'TAR"],

  -- Lower City
  [25719] = L["LOWER_CITY"],

  -- Trinket
  [28830] = L["TRINKET"],

  -- Quest
  [11018] = L["QUEST"],
  [7297] = L["QUEST"],
  [32649] = L["QUEST"],
  [32757] = L["02_NECK"],

  -- Gray items
  [3300] = L["GRAY_ITEMS"],

  -- Containers
  [21876] = L["BAG"],
  [29143] = L["BAG"],
  [34106] = L["BAG"],

  -- Projectiles
  [31737] = L["PROJECTILE"],
  [31735] = L["PROJECTILE"],

  -- Books
  [29549] = L["BOOK"],
  [21993] = L["BOOK"],
  [16072] = L["BOOK"],
  [22153] = L["BOOK"],
  [21953] = L["DESIGN"],
  [33151] = L["FORMULA"],
  [22919] = L["RECIPE"],
  [25731] = L["PATTERN"],
  [12827] = L["PLANS"],
  [23887] = L["SCHEMATIC"],

  -- Trade Tools
  [7005] = L["TRADE_TOOL"],
  [19901] = L["TRADE_TOOL"],
  [2901] = L["TRADE_TOOL"],
  [778] = L["TRADE_TOOL"],
  [5956] = L["TRADE_TOOL"],
  [22462] = L["TRADE_TOOL"],
  [9149] = L["TRADE_TOOL"],
  [15846] = L["TRADE_TOOL"],
  [6219] = L["TRADE_TOOL"],
  [10498] = L["TRADE_TOOL"],
  [12709] = L["TRADE_TOOL"],
  [19727] = L["TRADE_TOOL"],
  [7349] = L["TRADE_TOOL"],
  [39505] = L["TRADE_TOOL"],
  [40772] = L["TRADE_TOOL"],
  [3567] = L["WEAPON"], -- Avoid matching fishing pole
  [4598] = L["EXPLOSIVES"], -- ditto
  [19970] = L["FISHING"],

  -- Inscription
  [43125] = L["INSCRIPTION"],
  [43117] = L["INSCRIPTION"],
  [43121] = L["INSCRIPTION"],
  [43115] = L["INSCRIPTION"],
  [43123] = L["INSCRIPTION"],
  [43123] = L["INSCRIPTION"],
  [31519] = L["11_LEGS"], -- Has ink in the name but not inscription item
  [43119] = L["INSCRIPTION"],
  [43127] = L["INSCRIPTION"],
  [10647] = L["ENGINEERING"], -- Engineer's Ink
  [43124] = L["INSCRIPTION"],
  [43126] = L["INSCRIPTION"],
  [37101] = L["INSCRIPTION"],
  [43118] = L["INSCRIPTION"],
  [43116] = L["INSCRIPTION"],
  [39774] = L["INSCRIPTION"],
  [39469] = L["INSCRIPTION"],
  [43122] = L["INSCRIPTION"],
  [6929] = L["QUEST"], -- Bath'rah's Parchment
  [10648] = L["INSCRIPTION"],
  [11105] = L["QUEST"], -- Curled Map Parchment
  [3706] = L["ACT_ON"], -- Enscorcelled Parchment
  [9553] = L["QUEST"], -- Etched Parchment
  [9323] = L["QUEST"], -- Gadrin's Parchment
  [39501] = L["INSCRIPTION"],
  [39354] = L["INSCRIPTION"],
  [39502] = L["INSCRIPTION"],
  [12635] = L["QUEST"], -- Simple Parchment
  [5348] = L["QUEST"], -- Worn Parchment
  [3767] = L["GRAY_ITEMS"], -- Fine Parchment
  [40737] = L["08_WRIST"], -- Pigmented Clan Bindings
  [44061] = L["05_CHEST"], -- Pigmented Clan Bindings
  [43104] = L["INSCRIPTION"],
  [43108] = L["INSCRIPTION"],
  [43109] = L["INSCRIPTION"],
  [43105] = L["INSCRIPTION"],
  [43106] = L["INSCRIPTION"],
  [43106] = L["INSCRIPTION"],
  [43107] = L["INSCRIPTION"],
  [43103] = L["INSCRIPTION"],
  [39151] = L["INSCRIPTION"],
  [39343] = L["INSCRIPTION"],
  [39334] = L["INSCRIPTION"],
  [39339] = L["INSCRIPTION"],
  [39338] = L["INSCRIPTION"],
  [39342] = L["INSCRIPTION"],
  [39341] = L["INSCRIPTION"],
  [39340] = L["INSCRIPTION"],

  -- Various equipment items
  [33508] = L["RELIC"],
  [28757] = L["RING"],
  [33972] = L["01_HEAD"],
  [31749] = L["02_NECK"],
  [19689] = L["03_SHOULDER"],
  [29375] = L["04_BACK"],
  [4333] = L["06_SHIRT"],
  [6125] = L["06_SHIRT"],
  [31780] = L["07_TABARD"],
  [33580] = L["08_WRIST"],
  [34904] = L["09_HANDS"],
  [30042] = L["10_WAIST"],
  [28591] = L["11_LEGS"],
  [29265] = L["12_FEET"],
  [28728] = L["13_OFFHAND"],
  [18608] = L["WEAPON"],

  -- Restores
  [21991] = L["BANDAGE"],
  [5509] = L["HEALTHSTONE"],
  [32578] = L["HEALTHSTONE"],
  [27666] = L["FOOD_BUFF"],
  [13810] = L["FOOD_BUFF"],
  [43015] = L["FOOD_BUFF"],
  [43478] = L["FOOD_BUFF"],
  [34753] = L["FOOD_BUFF"],
  [43480] = L["FOOD_BUFF"],
  [21254] = L["FOOD_BUFF"],
  [20516] = L["FOOD_BUFF"],
  [22018] = L["DRINK"],
  [19301] = L["COMBO"],
  [34062] = L["COMBO"],
  [2682] = L["COMBO"],
  [13724] = L["COMBO"],
  [32722] = L["COMBO"],
  [20031] = L["COMBO"],
  [20031] = L["COMBO"],
  [21215] = L["COMBO"], -- fruitcake 2nd pattern is for this.
  [33053] = L["COMBO"],
  [34780] = L["COMBO"],
  [3448] = L["COMBO"],
  [28112] = L["COMBO"],
  [21153] = L["COMBO"],
  [20388] = L["COMBO"],
  [20389] = L["COMBO"],
  [20390] = L["COMBO"],
  [21537] = L["COMBO"],
  [13893] = L["FOOD"],
  [35285] = L["FOOD"],
  [28111] = L["FOOD"],
  [7676] = L["ENERGY_RESTORE"],
  [27553] = L["ENERGY_RESTORE"],
  [5631] = L["RAGE_RESTORE"],
  [22850] = L["COMBO_RESTORE"],
  [22836] = L["COMBO_RESTORE"],
  [34440] = L["COMBO_RESTORE"],
  [20002] = L["COMBO_RESTORE"],
  [12190] = L["COMBO_RESTORE"],
  [22832] = L["MANA_RESTORE"],
  [32902] = L["MANA_RESTORE"],
  [22829] = L["HEALTH_RESTORE"],
  [32905] = L["HEALTH_RESTORE"],
  [25883] = L["HEALTH_RESTORE"],

  -- Combat Buffs
  [6452] = L["CURE"],
  [12586] = L["CURE"],
  [31437] = L["CURE"],
  [5951] = L["CURE"],
  [9030] = L["CURE"],
  [9030] = L["CURE"],
  [25550] = L["CURE"],
  [17744] = L["TRINKET"], -- Might match deDE pattern for removing poisons
  [10455] = L["TRINKET"], -- ditto
  [4444] = L["ARMOR"], -- ditto
  [5613] = L["WEAPON"], -- ditto
  [4398] = L["EXPLOSIVES"],
  [4378] = L["EXPLOSIVES"],
  [24538] = L["EXPLOSIVES"],
  [27498] = L["BUFF"],
  [29529] = L["BUFF"],
  [22797] = L["BUFF"],
  [22795] = L["BUFF"],
  [22840] = L["BUFF"],
  [20007] = L["BUFF"],
  [20004] = L["BUFF"],
  [3826] = L["BUFF"],
  [3388] = L["BUFF"],
  [3382] = L["BUFF"],
  [20748] = L["BUFF"],
  [23529] = L["BUFF"],
  [28421] = L["BUFF"],
  [21519] = L["BUFF"],
  [21267] = L["BUFF"],
  [22788] = L["BUFF"],
  [24421] = L["BUFF"],
  [3823] = L["BUFF"],
  [9172] = L["BUFF"],
  [32079] = L["KEY_QUEST"],

  -- Reagents
  [17056] = L["CLASS_REAGENT"],
  [5565] = string.format(L["%s_REAGENT"],L["WARLOCK"]),
  [16583] = string.format(L["%s_REAGENT"],L["WARLOCK"]),
  [22147] = string.format(L["%s_REAGENT"],L["DRUID"]),
  [17037] = string.format(L["%s_REAGENT"],L["DRUID"]),
  [22148] = string.format(L["%s_REAGENT"],L["DRUID"]),
  [44614] = string.format(L["%s_REAGENT"],L["DRUID"]),
  [44605] = string.format(L["%s_REAGENT"],L["DRUID"]),
  [17020] = string.format(L["%s_REAGENT"],L["MAGE"]),
  [17031] = string.format(L["%s_REAGENT"],L["MAGE"]),
  [17032] = string.format(L["%s_REAGENT"],L["MAGE"]),
  [21177] = string.format(L["%s_REAGENT"],L["PALADIN"]),
  [17033] = string.format(L["%s_REAGENT"],L["PALADIN"]),
  [17029] = string.format(L["%s_REAGENT"],L["PRIEST"]),
  [44615] = string.format(L["%s_REAGENT"],L["PRIEST"]),
  [17030] = string.format(L["%s_REAGENT"],L["SHAMAN"]),
  [17058] = string.format(L["%s_REAGENT"],L["SHAMAN"]),
  [17057] = string.format(L["%s_REAGENT"],L["SHAMAN"]),
  [37201] = string.format(L["%s_REAGENT"],L["DEATHKNIGHT"]),
  [5060] = string.format(L["%s_TOOL"],L["ROGUE"]),
  [5178] = string.format(L["%s_TOOL"],L["SHAMAN"]),
  [5175] = string.format(L["%s_TOOL"],L["SHAMAN"]),
  [5176] = string.format(L["%s_TOOL"],L["SHAMAN"]),
  [5177] = string.format(L["%s_TOOL"],L["SHAMAN"]),
  [6265] = L["SOULSHARD"],
  [4392] = L["DUMMY"],

  [7068] = L["REAGENT"],
  [7082] = L["REAGENT"],
  [7079] = L["REAGENT"],
  [7081] = L["REAGENT"],
  [7077] = L["REAGENT"],
  [7075] = L["REAGENT"],
  [22572] = L["REAGENT"],
  [23572] = L["REAGENT"],
  [21886] = L["REAGENT"],
  [22450] = L["REAGENT"],
  [30183] = L["REAGENT"],
  [32428] = L["REAGENT"],
  [34664] = L["REAGENT"],
  [43102] = L["REAGENT"],
  [37700] = L["REAGENT"],
  [37701] = L["REAGENT"],
  [37702] = L["REAGENT"],
  [37703] = L["REAGENT"],
  [37704] = L["REAGENT"],
  [37705] = L["REAGENT"],
  [35622] = L["REAGENT"],
  [35623] = L["REAGENT"],
  [35624] = L["REAGENT"],
  [35625] = L["REAGENT"],
  [35627] = L["REAGENT"],
  [36860] = L["REAGENT"],
  [45087] = L["REAGENT"],
  [47556] = L["REAGENT"],
  [49908] = L["REAGENT"],

  -- Trades
  [8925] = L["ALCHEMY"],
  [4305] = L["CLOTH"],
  [21877] = L["CLOTH"],
  [3173] = L["COOKING"],
  [11083] = L["ENCHANTING"],
  [10998] = L["ENCHANTING"],
  [11082] = L["ENCHANTING"],
  [14343] = L["ENCHANTING"],
  [14343] = L["ENCHANTING"],
  [14344] = L["ENCHANTING"],
  [22445] = L["ENCHANTING"],
  [22449] = L["ENCHANTING"],
  [22202] = L["BLACKSMITHING"], -- Similar to enchanting but shouldn't match
  [22203] = L["BLACKSMITHING"], -- ditto
  [18986] = L["ENGINEERING"],
  [30544] = L["ENGINEERING"],
  [18984] = L["ENGINEERING"],
  [30542] = L["ENGINEERING"],
  [48933] = L["ENGINEERING"],
  [47828] = L["ENGINEERING"],

  -- Rogue Poisons
  [21835] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43237] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [3775] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [2892] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [2893] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [8984] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [8985] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43233] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [20844] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [22053] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [22054] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43232] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [6947] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [6949] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [6950] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [8926] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43231] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [8927] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [8928] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [21927] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43230] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [5237] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [10918] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [10920] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [10921] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [10922] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [22055] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43234] = string.format(L["%s_REAGENT"],L["ROGUE"]),
  [43235] = string.format(L["%s_REAGENT"],L["ROGUE"]),
}

-- Known items not working on any realm
-- Found from wowhead but apparently not seen on any of the realms
tests[38266] = nil

if not TBag.wrath_310 then
	tests[44820] = nil
	tests[44599] = nil
	tests[44601] = nil
	tests[45057] = nil
	tests[45047] = nil
	tests[45063] = nil
end

local function build_itm(id,itm)
  itm[TBag.I_ITEMLINK] = "item:"..id..":0:0:0:0:0:0:0";
  itm[TBag.I_BAG] = 1;
  itm[TBag.I_SLOT] = 1;
  itm[TBag.I_NAME], itm[TBag.I_TYPE], itm[TBag.I_SUBTYPE], itm[TBag.I_RARITY]
    = TBag:GetItemInfo(itm[TBag.I_ITEMLINK]);
end

-- Executes a single test
--   inputs: itemid and the expected category
--   output: result (boolean), itm (table produced)
local function test(id,cat)
  local itm = { };
  local result = false

  build_itm(id,itm);
  TBag:PickBar(cfg, "TBAGTEST|TBAGTEST", itm, "", "");
  for c in cat:gmatch("[^|]+") do
    if c == itm[TBag.I_CAT] then
      result = true
    end
  end
  return result, itm;
end

function TBag:GetCategory(id)
 self:InitDefVals(cfg, self.Inv_Bags, 0, 1)

 local _, itm = test(id,"TEST")
 local link = self:MakeHyperlink(itm[self.I_ITEMLINK],itm[self.I_NAME],
                                 itm[self.I_RARITY],80);
 link = tostring(link);
 TBag:Print(string.format("%s (%s) = %s",link,tostring(id),tostring(itm[self.I_CAT])))
end

function TBag:RunTests(verbose)
  local fail = false;
  -- Initialize the cfg with default values
  self:InitDefVals(cfg, self.Inv_Bags, 0, 1);

  self:Print(L["TEST RUN STARTING"]);

  for id,cat in pairs(tests) do
    local result, itm = test(id,cat)
    local link = self:MakeHyperlink(itm[self.I_ITEMLINK],itm[self.I_NAME],
                                    itm[self.I_RARITY],80);
    link = tostring(link);

    if (result == true) then
      if (verbose) then
        local output = string.format(L["SUCCESS: %s"], link);
        self:Print(output,0,1,0);
      end
    else
      fail = true;
      local output = string.format(L["FAIL: %s (%s) expected %q but got %q"], link,
                                   tostring(id),tostring(cat),tostring(itm[self.I_CAT]));
      self:Print(output,1,0,0);
    end
  end

  if (fail == false) then
    self:Print(L["ALL TESTS SUCCESSFUL"]);
  end
end
