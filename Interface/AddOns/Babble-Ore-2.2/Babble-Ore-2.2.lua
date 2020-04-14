﻿--[[
Name: Babble-Ore-2.2
Revision: $Rev: 1317 $
Authors(s): kagaro (sal.scotto@gmail.com)
Website: www.wowace.com
Documentation: http://www.wowace.com/wiki/Babble-Ore-2.2
SVN: http://svn.wowace.com/root/branch/Babble-2.2/Babble-Ore-2.2
Dependencies: AceLibrary, AceLocale-2.2
License: MIT
]]

local MAJOR_VERSION = "Babble-Ore-2.2"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 1317 $"):match("(%d+)"))

if not AceLibrary then error(MAJOR_VERSION .. " requires AceLibrary") end
if not AceLibrary:HasInstance("AceLocale-2.2") then error(MAJOR_VERSION .. " requires AceLocale-2.2") end

local _, x = AceLibrary("AceLocale-2.2"):GetLibraryVersion()
MINOR_VERSION = MINOR_VERSION * 100000 + x

if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end

local BabbleOre = AceLibrary("AceLocale-2.2"):new(MAJOR_VERSION)

BabbleOre:RegisterTranslations("enUS", function() return {
-- Ore
	["Copper Ore"] = true,
	["Tin Ore"] = true,
	["Silver Ore"] = true,
	["Iron Ore"] = true,
	["Gold Ore"] = true,
	["Mithril Ore"] = true,
	["Dark Iron Ore"] = true,
	["Truesilver Ore"] = true,
	["Thorium Ore"] = true,
	["Elementium Ore"] = true,
	["Fel Iron Ore"] = true,
	["Adamantite Ore"] = true,
	["Eternium Ore"] = true,
	["Khorium Ore"] = true,
-- Types
	["Copper"] = true,
	["Tin"] = true,
	["Silver"] = true,
	["Iron"] = true,
	["Gold"] = true,
	["Mithril"] = true,
	["Dark Iron"] = true,
	["Truesilver"] = true,
	["Thorium"] = true,
	["Elementium"] = true,
	["Fel Iron"] = true,
	["Adamantite"] = true,
	["Eternium"] = true,
	["Khorium"] = true,
	["Incendicite"] = true,
	["Lesser Bloodstone"] = true,
	["Indurium"] = true,
	["Large Obsidian Shard"] = true,
	["Small Obsidian Shard"] = true,
	["Rich Thorium"] = true,
	["Rich Adamantite"] = true,
-- Quest Ore
	["Underlight Ore"] = true, -- copper and tin
	["Lead Ore"] = true,
	["Rethban Ore"] = true, --quest
	["Incendicite Ore"] = true,
	["Umbral Ore"] = true,
	["Elunite Ore"] = true,
	["Lesser Bloodstone Ore"] = true, --quest
	["Indurium Ore"] = true,
	["Nethercite Ore"] = true,
-- Nodes
	["Copper Vein"] = true,
	["Tin Vein"] = true,
	["Iron Deposit"] = true,
	["Silver Vein"] = true,
	["Gold Vein"] = true,
	["Mithril Deposit"] = true,
	["Ooze Covered Mithril Deposit"] = true,
	["Truesilver Deposit"] = true,
	["Ooze Covered Silver Vein"] = true,
	["Ooze Covered Gold Vein"] = true,
	["Ooze Covered Truesilver Deposit"] = true,
	["Ooze Covered Rich Thorium Vein"] = true,
	["Ooze Covered Thorium Vein"] = true,
	["Small Thorium Vein"] = true,
	["Rich Thorium Vein"] = true,
	["Hakkari Thorium Vein"] = true,
	["Dark Iron Deposit"] = true,
	["Lesser Bloodstone Deposit"] = true,
	["Incendicite Mineral Vein"] = true,
	["Indurium Mineral Vein"] = true,
	["Fel Iron Deposit"] = true,
	["Adamantite Deposit"] = true,
	["Rich Adamantite Deposit"] = true,
	["Khorium Vein"] = true,
	["Large Obsidian Chunk"] = true,
	["Small Obsidian Chunk"] = true,
	["Nethercite Deposit"] = true,
	
} end)

BabbleOre:RegisterTranslations("koKR", function() return {
-- Ore
	["Copper Ore"] = "구리 광석",
	["Tin Ore"] = "주석 광석",
	["Silver Ore"] = "은 광석",
	["Iron Ore"] = "철 광석",
	["Gold Ore"] = "금 광석",
	["Mithril Ore"] = "미스릴 광석",
	["Dark Iron Ore"] = "검은무쇠 광석",
	["Truesilver Ore"] = "진은 광석",
	["Thorium Ore"] = "토륨 광석",
	["Elementium Ore"] = "엘레멘티움 광석",
	["Fel Iron Ore"] = "지옥무쇠 광석",
	["Adamantite Ore"] = "아다만티움 광석",
	["Eternium Ore"] = "이터늄 광석",
	["Khorium Ore"] = "코륨 광석",
-- Types
	["Copper"] = "구리",
	["Tin"] = "주석",
	["Silver"] = "은",
	["Iron"] = "철",
	["Gold"] = "금",
	["Mithril"] = "미스릴",
	["Dark Iron"] = "검은무쇠",
	["Truesilver"] = "진은",
	["Thorium"] = "토륨",
	["Elementium"] = "엘레멘티움",
	["Fel Iron"] = "지옥무쇠",
	["Adamantite"] = "아다만타이트",
	["Eternium"] = "이터늄",
	["Khorium"] = "코륨",
	["Incendicite"] = "발연",
	["Lesser Bloodstone"] = "저급 혈석",
	["Indurium"] = "인듀리움", -- 확인요망
	["Large Obsidian Shard"] = "큰 흑요석 파편",
	["Small Obsidian Shard"] = "작은 흑요석 파편",
	["Rich Thorium"] = "풍부한 토륨",
	["Rich Adamantite"] = "풍부한 아다만타이트",
	
-- Quest Ore
	["Underlight Ore"] = "미명 광석", -- copper and tin
	["Lead Ore"] = "가연 광석",
	["Rethban Ore"] = "레스밴 광석", --quest
	["Incendicite Ore"] = "발연 광석",
	["Umbral Ore"] = "움브랄 광석",
	["Elunite Ore"] = "엘루니트 광석",
	["Lesser Bloodstone Ore"] = "저급 혈석 광물", --quest
	["Indurium Ore"] = "인듀리움 광석",
	["Nethercite Ore"] = "황천연 광석", --check
-- Nodes
	["Copper Vein"] = "구리 광맥",
	["Tin Vein"] = "주석 광맥",
	["Iron Deposit"] = "철 광맥",
	["Silver Vein"] = "은 광맥",
	["Gold Vein"] = "금 광맥",
	["Mithril Deposit"] = "미스릴 광맥",
	["Ooze Covered Mithril Deposit"] = "진흙으로 덮인 미스릴 광맥",
	["Truesilver Deposit"] = "진은 광맥",
	["Ooze Covered Silver Vein"] = "진흙으로 덮인 은 광맥",
	["Ooze Covered Gold Vein"] = "진흙으로 덮인 금 광맥",
	["Ooze Covered Truesilver Deposit"] = "진흙으로 덮인 진은 광맥",
	["Ooze Covered Rich Thorium Vein"] = "진흙으로 덮인 풍부한 토륨 광맥",
	["Ooze Covered Thorium Vein"] = "진흙으로 덮인 토륨 광맥",
	["Small Thorium Vein"] = "작은 토륨 광맥",
	["Rich Thorium Vein"] = "풍부한 토륨 광맥",
	["Hakkari Thorium Vein"] = "학카리 토륨 광맥",
	["Dark Iron Deposit"] = "검은무쇠 광맥",
	["Lesser Bloodstone Deposit"] = "저급 혈석 광맥", -- 확인요망
	["Incendicite Mineral Vein"] = "발연 광석 광맥", -- 확인요망
	["Indurium Mineral Vein"] = "인듀리움 광맥",
	["Fel Iron Deposit"] = "지옥무쇠 광맥",
	["Adamantite Deposit"] = "아다만타이트 광맥",
	["Rich Adamantite Deposit"] = "풍부한 아다만타이트 광맥",
	["Khorium Vein"] = "코륨 광맥",
	["Large Obsidian Chunk"] = "큰 흑요석 덩어리",
	["Small Obsidian Chunk"] = "작은 흑요석 덩어리",
	["Nethercite Deposit"] = "황천연 광맥", --check
	
} end)

BabbleOre:RegisterTranslations("deDE", function() return {
-- Ore
	["Copper Ore"] = "Kupfererz",
	["Tin Ore"] = "Zinnerz",
	["Silver Ore"] = "Silbererz",
	["Iron Ore"] = "Eisenerz",
	["Gold Ore"] = "Golderz",
	["Mithril Ore"] = "Mithrilerz",
	["Dark Iron Ore"] = "Dunkeleisenerz",
	["Truesilver Ore"] = "Echtsilbererz",
	["Thorium Ore"] = "Thoriumerz",
	["Elementium Ore"] = "Elementiumerz",
	["Fel Iron Ore"] = "Teufelseisenerz",
	["Adamantite Ore"] = "Adamantiterz",
	["Eternium Ore"] = "Eterniumerz",
	["Khorium Ore"] = "Khoriumerz",
-- Types
	["Copper"] = "Kupfer",
	["Tin"] = "Zinn",
	["Silver"] = "Silber",
	["Iron"] = "Eisen",
	["Gold"] = "Gold",
	["Mithril"] = "Mithril",
	["Dark Iron"] = "Dunkeleisen",
	["Truesilver"] = "Echtsilber",
	["Thorium"] = "Thorium",
	["Elementium"] = "Elementium",
	["Fel Iron"] = "Teufelseisen",
	["Adamantite"] = "Adamantit",
	["Eternium"] = "Eternium",
	["Khorium"] = "Khorium",
	["Incendicite"] = "Pyrophor",
	["Lesser Bloodstone"] = "Geringer Blutstein",
	["Indurium"] = "Indurium",
	["Large Obsidian Shard"] = "Großer Obsidiansplitter",
	["Small Obsidian Shard"] = "Kleiner Obsidiansplitter",
	["Rich Thorium"] = "Reiches Thorium",
	["Rich Adamantite"] = "Reiches Adamantium",
-- Quest Ore
	["Underlight Ore"] = "Grubenlichterz",
	["Lead Ore"] = "Bleierz",
	["Rethban Ore"] = "Rethbanerz", --quest
	["Incendicite Ore"] = "Pyrophorerz",
	["Umbral Ore"] = "Umbralerz",
	["Elunite Ore"] = "Eluniterz",
	["Lesser Bloodstone Ore"] = "Geringes Blutsteinerz", --quest
	["Indurium Ore"] = "Induriumerz",
	["Nethercite Ore"] = "Netheriterz",
-- Nodes
	["Copper Vein"] = "Kupfervorkommen",
	["Tin Vein"] = "Zinnvorkommen",
	["Iron Deposit"] = "Eisenvorkommen",
	["Silver Vein"] = "Silbervorkommen",
	["Gold Vein"] = "Goldvorkommen",
	["Mithril Deposit"] = "Mithrilablagerung",
	["Ooze Covered Mithril Deposit"] = "Brühschlammbedeckte Mithrilablagerung",
	["Truesilver Deposit"] = "Echtsilberablagerung",
	["Ooze Covered Silver Vein"] = "Brühschlammbedecktes Silbervorkommen",
	["Ooze Covered Gold Vein"] = "Brühschlammbedecktes Goldvorkommen",
	["Ooze Covered Truesilver Deposit"] = "Brühschlammbedeckte Echtsilberablagerung",
	["Ooze Covered Rich Thorium Vein"] = "Brühschlammbedecktes reiches Thoriumvorkommen",
	["Ooze Covered Thorium Vein"] = "Brühschlammbedecktes Thoriumvorkommen",
	["Small Thorium Vein"] = "Kleines Thoriumvorkommen",
	["Rich Thorium Vein"] = "Reiches Thoriumvorkommen",
	["Hakkari Thorium Vein"] = "Hakkari Thoriumvorkommen",
	["Dark Iron Deposit"] = "Dunkeleisenablagerung",
	["Lesser Bloodstone Deposit"] = "Geringe Blutsteinablagerung",
	["Incendicite Mineral Vein"] = "Pyrophormineralvorkommen",
	["Indurium Mineral Vein"] = "Induriummineralvorkommen",
	["Fel Iron Deposit"] = "Teufelseisenvorkommen",
	["Adamantite Deposit"] = "Adamantitablagerung",
	["Rich Adamantite Deposit"] = "Reiche Adamantitablagerung",
	["Khorium Vein"] = "Khoriumvorkommen",
	["Large Obsidian Chunk"] = "Großer Obsidianbrocken",
	["Small Obsidian Chunk"] = "Kleiner Obsidianbrocken",
	["Nethercite Deposit"] = "Netheritablagerung",
	
} end)

--校对 5m(冰焱妩媚)
BabbleOre:RegisterTranslations("zhCN", function() return {
-- Ore
	["Copper Ore"] = "铜矿石",
	["Tin Ore"] = "锡矿石",
	["Silver Ore"] = "银矿石",
	["Iron Ore"] = "铁矿石",
	["Gold Ore"] = "金矿石",
	["Mithril Ore"] = "秘银矿石",
	["Dark Iron Ore"] = "黑铁矿石",
	["Truesilver Ore"] = "真银矿石",
	["Thorium Ore"] = "瑟银矿石",
	["Elementium Ore"] = "源质矿石",
	["Fel Iron Ore"] = "魔铁矿石",
	["Adamantite Ore"] = "精金矿石",
	["Eternium Ore"] = "恒金矿石",
	["Khorium Ore"] = "氪金矿石",
-- Types
	["Copper"] = "铜",
	["Tin"] = "锡",
	["Silver"] = "银",
	["Iron"] = "铁",
	["Gold"] = "金",
	["Mithril"] = "秘银",
	["Dark Iron"] = "黑铁",
	["Truesilver"] = "真银",
	["Thorium"] = "瑟银",
	["Elementium"] = "源质",
	["Fel Iron"] = "魔铁",
	["Adamantite"] = "精金",
	["Eternium"] = "恒金",
	["Khorium"] = "氪金",
	["Incendicite"] = "火岩矿石",
	["Lesser Bloodstone"] = "次级血石矿",
	["Indurium"] = "精铁碎片",
	["Large Obsidian Shard"] = "大块黑曜石碎片",
	["Small Obsidian Shard"] = "小块黑曜石碎片",
	["Rich Thorium"] = "富瑟银矿",
	["Rich Adamantite"] = "富精金矿",
-- Quest Ore
	["Underlight Ore"] = "幽光矿石", -- copper and tin
	["Lead Ore"] = "石墨",
	["Rethban Ore"] = "瑞斯班矿石", --quest
	["Incendicite Ore"] = "火岩矿石",
	["Umbral Ore"] = "暗影矿石",
	["Elunite Ore"] = "月神矿石",
	["Lesser Bloodstone Ore"] = "次级血石矿", --quest
	["Indurium Ore"] = "精铁矿石",
	["Nethercite Ore"] = "虚空矿石",
-- Nodes
	["Copper Vein"] = "铜矿",
	["Tin Vein"] = "锡矿",
	["Iron Deposit"] = "铁矿石",
	["Silver Vein"] = "银矿",
	["Gold Vein"] = "金矿石",
	["Mithril Deposit"] = "秘银矿脉",
	["Ooze Covered Mithril Deposit"] = "软泥覆盖的秘银矿脉",
	["Truesilver Deposit"] = "真银矿石",
	["Ooze Covered Silver Vein"] = "软泥覆盖的银矿脉",
	["Ooze Covered Gold Vein"] = "软泥覆盖的金矿脉",
	["Ooze Covered Truesilver Deposit"] = "软泥覆盖的真银矿脉",
	["Ooze Covered Rich Thorium Vein"] = "软泥覆盖的富瑟银矿脉",
	["Ooze Covered Thorium Vein"] = "软泥覆盖的瑟银矿脉",
	["Small Thorium Vein"] = "瑟银矿脉",
	["Rich Thorium Vein"] = "富瑟银矿",
	["Hakkari Thorium Vein"] = "哈卡莱瑟银矿脉",
	["Dark Iron Deposit"] = "黑铁矿脉",
	["Lesser Bloodstone Deposit"] = "次级血石矿脉",
	["Incendicite Mineral Vein"] = "火岩矿脉",
	["Indurium Mineral Vein"] = "精铁矿脉",
	["Fel Iron Deposit"] = "魔铁矿脉",
	["Adamantite Deposit"] = "精金矿脉",
	["Rich Adamantite Deposit"] = "富精金矿脉",
	["Khorium Vein"] = "氪金矿脉",
	["Large Obsidian Chunk"] = "大型黑曜石碎块",
	["Small Obsidian Chunk"] = "小型黑曜石碎块",
	["Nethercite Deposit"] = "虚空矿脉",
	
} end)

BabbleOre:RegisterTranslations("zhTW", function () return {
-- Ore
	["Copper Ore"] = "銅礦石",
	["Tin Ore"] = "錫礦石",
	["Silver Ore"] = "銀礦石",
	["Iron Ore"] = "鐵礦石",
	["Gold Ore"] = "金礦石",
	["Mithril Ore"] = "秘銀礦石",
	["Dark Iron Ore"] = "黑鐵礦石",
	["Truesilver Ore"] = "真銀礦石",
	["Thorium Ore"] = "瑟銀礦石",
	["Elementium Ore"] = "源質礦石",
	["Fel Iron Ore"] = "魔鐵礦石",
	["Adamantite Ore"] = "堅鋼礦石",
	["Eternium Ore"] = "恆金礦石",
	["Khorium Ore"] = "克銀礦石",
-- Types
	["Copper"] = "銅",
	["Tin"] = "錫",
	["Silver"] = "銀",
	["Iron"] = "鐵",
	["Gold"] = "金",
	["Mithril"] = "秘銀",
	["Dark Iron"] = "黑鐵",
	["Truesilver"] = "真銀",
	["Thorium"] = "瑟銀",
	["Elementium"] = "源質",
	["Fel Iron"] = "魔鐵",
	["Adamantite"] = "堅鋼",
	["Eternium"] = "恆金",
	["Khorium"] = "克銀",
	["Incendicite"] = "火岩",
	["Lesser Bloodstone"] = "次級血石",
	["Indurium"] = "精鐵碎片",
	["Large Obsidian Shard"] = "大塊黑曜石碎片",
	["Small Obsidian Shard"] = "小塊黑曜石碎片",
	["Rich Thorium"] = "富瑟銀",
	["Rich Adamantite"] = "富堅鋼",
-- Quest Ore
	["Underlight Ore"] = "光底礦物", -- copper and tin
	["Lead Ore"] = "石墨",
	["Rethban Ore"] = "瑞斯班礦石", --quest
	["Incendicite Ore"] = "火岩礦石",
	["Umbral Ore"] = "暗影礦石",
	["Elunite Ore"] = "月神礦石",
	["Lesser Bloodstone Ore"] = "次級血石礦", --quest
	["Indurium Ore"] = "精鐵礦石",
	["Nethercite Ore"] = "虛空傳喚礦石",
-- Nodes
	["Copper Vein"] = "銅礦",
	["Tin Vein"] = "錫礦",
	["Iron Deposit"] = "鐵礦石",
	["Silver Vein"] = "銀礦",
	["Gold Vein"] = "金礦石",
	["Mithril Deposit"] = "秘銀礦脈",
	["Ooze Covered Mithril Deposit"] = "軟泥覆蓋的秘銀礦脈",
	["Truesilver Deposit"] = "真銀礦石",
	["Ooze Covered Silver Vein"] = "軟泥覆蓋的銀礦脈",
	["Ooze Covered Gold Vein"] = "軟泥覆蓋的金礦脈",
	["Ooze Covered Truesilver Deposit"] = "軟泥覆蓋的真銀礦脈",
	["Ooze Covered Rich Thorium Vein"] = "軟泥覆蓋的富瑟銀礦脈",
	["Ooze Covered Thorium Vein"] = "軟泥覆蓋的瑟銀礦脈",
	["Small Thorium Vein"] = "瑟銀礦脈",
	["Rich Thorium Vein"] = "富瑟銀礦",
	["Hakkari Thorium Vein"] = "哈卡萊瑟銀礦脈",
	["Dark Iron Deposit"] = "黑鐵礦脈",
	["Lesser Bloodstone Deposit"] = "次級血石礦脈",
	["Incendicite Mineral Vein"] = "火岩礦脈",
	["Indurium Mineral Vein"] = "精鐵礦脈",
	["Fel Iron Deposit"] = "魔鐵礦床",
	["Adamantite Deposit"] = "堅鋼礦床",
	["Rich Adamantite Deposit"] = "豐沃的堅鋼礦床",
	["Khorium Vein"] = "克銀礦脈",
	["Large Obsidian Chunk"] = "大型黑曜石礦",
	["Small Obsidian Chunk"] = "小型黑曜石礦",
	["Nethercite Deposit"] = "虛空傳喚礦床",

} end)

BabbleOre:RegisterTranslations("esES", function() return {
-- Ore
	["Copper Ore"] = "Mena de cobre",
	["Tin Ore"] = "Mena de esta\195\177o",
	["Silver Ore"] = "Mena de plata",
	["Iron Ore"] = "Mena de hierro",
	["Gold Ore"] = "Mena de oro",
	["Mithril Ore"] = "Mena de mitril",
	["Dark Iron Ore"] = "Mena de hierro negro",
	["Truesilver Ore"] = "Mena de veraplata",
	["Thorium Ore"] = "Mena de torio",
	["Elementium Ore"] = "Mena de elementio",
	["Fel Iron Ore"] = "Mena de hierro vil",
	["Adamantite Ore"] = "Mena de adamantita",
	["Eternium Ore"] = "Mena de eternio",   
	["Khorium Ore"] = "Mena de korio",     
-- Types
	["Copper"] = "Cobre",
	["Tin"] = "Esta\195\177o",
	["Silver"] = "Plata",
	["Iron"] = "Hierro",
	["Gold"] = "Oro",
	["Mithril"] = "Mitril",
	["Dark Iron"] = "Hierro negro",
	["Truesilver"] = "Veraplata",
	["Thorium"] = "Torio",
	["Elementium"] = "Elementio",
	["Fel Iron"] = "Hierro vil",
	["Adamantite"] = "Adamantita",
	["Eternium"] = "Eternio",  
	["Khorium"] = "Khorio",    
	["Incendicite"] = "Incendicita",
	["Lesser Bloodstone"] = "Sangrita inferior",
	["Indurium"] = "Indurio",
	["Large Obsidian Shard"] = "Fragmento obsidiano grande",
	["Small Obsidian Shard"] = "Fragmento obsidiano peque\195\177o",
	["Rich Thorium"] = "Torio enriquecido",
	["Rich Adamantite"] = "Adamantita enriquecida",
	
-- Quest Ore
	["Underlight Ore"] = "Mena de subluz", -- copper and tin  
	["Lead Ore"] = "Mena de plomo",
	["Rethban Ore"] = "Mena de Rethban", --quest
	["Incendicite Ore"] = "Mena de incendicita",
	["Umbral Ore"] = "Mena umbr\195\173a",
	["Elunite Ore"] = "Mena de elunita",
	["Lesser Bloodstone Ore"] = "Mena de sangrita inferior", --quest
	["Indurium Ore"] = "Mena de indurio",
-- Nodes
	["Copper Vein"] = "Fil\195\179n de cobre",
	["Tin Vein"] = "Fil\195\179n de esta\195\177o",
	["Iron Deposit"] = "Dep\195\179sito de hierro",
	["Silver Vein"] = "Fil\195\179n de plata",
	["Gold Vein"] = "Fil\195\179n de oro",
	["Mithril Deposit"] = "Dep\195\179sito de mitril",
	["Ooze Covered Mithril Deposit"] = "Fil\195\179n de mitril cubierto de moco",  -- check
	["Truesilver Deposit"] = "Dep\195\179sito de veraplata",
	["Ooze Covered Silver Vein"] = "Fil\195\179n de plata cubierto de moco",  -- check
	["Ooze Covered Gold Vein"] = "Fil\195\179n de oro cubierto de moco",  -- check
	["Ooze Covered Truesilver Deposit"] = "Fil\195\179n de veraplata cubierta de moco",  -- check
	["Ooze Covered Rich Thorium Vein"] = "Fil\195\179n de torio enriquecido cubierto de moco",  -- check
	["Ooze Covered Thorium Vein"] = "Fil\195\179n de torio cubierto de moco",  -- check
	["Small Thorium Vein"] = "Fil\195\179n peque\195\177o de torio", -- check
	["Rich Thorium Vein"] = "Fil\195\179n de torio enriquecido",
	["Hakkari Thorium Vein"] = "Fil\195\179n de torio hakkari",  -- check
	["Dark Iron Deposit"] = "Dep\195\179sito de hierro negro",
	["Lesser Bloodstone Deposit"] = "Dep\195\179sito desangrita inferior",
	["Incendicite Mineral Vein"] = "Fil\195\179n de mineral de incendicita",   -- check
	["Indurium Mineral Vein"] = "Fil\195\179n de mineral de indurio",   -- check
	["Fel Iron Deposit"] = "Dep\195\179sito de hierro vil",
	["Adamantite Deposit"] = "Dep\195\179sito de adamantita",
	["Rich Adamantite Deposit"] = "Dep\195\179sito de adamantita enriquecida",
	["Khorium Vein"] = "Fil\195\179n de korio",  
	["Large Obsidian Chunk"] = "Pedazo obsidiano grande",  -- check
	["Small Obsidian Chunk"] = "Pedazo obsidiano peque\195\177o",  -- check
	["Nethercite Deposit"] = "Depósito de abisalita",
} end)
BabbleOre:RegisterTranslations("frFR", function() return {
-- Ore
	["Copper Ore"] = "Minerai de cuivre",
	["Tin Ore"] = "Minerai d'étain",
	["Silver Ore"] = "Minerai d'argent",
	["Iron Ore"] = "Minerai de fer",
	["Gold Ore"] = "Minerai d'or",
	["Mithril Ore"] = "Minerai de mithril",
	["Dark Iron Ore"] = "Minerai de sombrefer",
	["Truesilver Ore"] = "Minerai de vrai-argent",
	["Thorium Ore"] = "Minerai de thorium",
	["Elementium Ore"] = "Minerai d'élémentium",
	["Fel Iron Ore"] = "Minerai de gangrefer",
	["Adamantite Ore"] = "Minerai d'adamantite",
	["Eternium Ore"] = "Minerai d'éternium",
	["Khorium Ore"] = "Minerai de khorium",
-- Types
	["Copper"] = "Cuivre",
	["Tin"] = "Etain",
	["Silver"] = "Argent",
	["Iron"] = "Fer",
	["Gold"] = "Or",
	["Mithril"] = "Mithril",
	["Dark Iron"] = "Sombrefer",
	["Truesilver"] = "Vrai-argent",
	["Thorium"] = "Thorium",
	["Elementium"] = "Elémentium",
	["Fel Iron"] = "Gangrefer",
	["Adamantite"] = "Adamantite",
	["Eternium"] = "Eternium",
	["Khorium"] = "Khorium",
	["Incendicite"] = "Incendicite",
	["Lesser Bloodstone"] = "Pierre de sang inférieure",
	["Indurium"] = "Indurium",
	["Large Obsidian Shard"] = "Grand éclat d'obsidienne",
	["Small Obsidian Shard"] = "Petit éclat d'obsidienne",
	["Rich Thorium"] = "Thorium riche",
	["Rich Adamantite"] = "Adamantite riche",
-- Quest Ore
	["Underlight Ore"] = "Minerai de terradiance", -- copper and tin
	["Lead Ore"] = "Minerai de plomb",
	["Rethban Ore"] = "Minerai de rethban", --quest
	["Incendicite Ore"] = "Minerai d'incendicite",
	["Umbral Ore"] = "Minerai d'Umbral",
	["Elunite Ore"] = "Minerai d'Elunite",
	["Lesser Bloodstone Ore"] = "Minerai de pierre de sang inférieur", --quest
	["Indurium Ore"] = "Minerai d'Indurium",
	["Nethercite Ore"] = "Minerai de néanticite",
-- Nodes
	["Copper Vein"] = "Filon de cuivre",
	["Tin Vein"] = "Filon d'étain",
	["Iron Deposit"] = "Gisement de fer",
	["Silver Vein"] = "Filon d'argent",
	["Gold Vein"] = "Filon d'or",
	["Mithril Deposit"] = "Gisement de mithril",
	["Ooze Covered Mithril Deposit"] = "Gisement de mithril couvert de vase",
	["Truesilver Deposit"] = "Gisement de vrai-argent",
	["Ooze Covered Silver Vein"] = "Filon d'argent couvert de limon",
	["Ooze Covered Gold Vein"] = "Filon d'or couvert de limon",
	["Ooze Covered Truesilver Deposit"] = "Gisement de vrai-argent couvert de vase",
	["Ooze Covered Rich Thorium Vein"] = "Riche filon de thorium couvert de limon",
	["Ooze Covered Thorium Vein"] = "Filon de thorium couvert de limon",
	["Small Thorium Vein"] = "Petit filon de thorium",
	["Rich Thorium Vein"] = "Riche filon de thorium",
	["Hakkari Thorium Vein"] = "Filon de thorium Hakkari",
	["Dark Iron Deposit"] = "Gisement de sombrefer",
	["Lesser Bloodstone Deposit"] = "Gisement de pierre de sang inférieure",
	["Incendicite Mineral Vein"] = "Filon d'incendicite",
	["Indurium Mineral Vein"] = "Filon d'indurium",
	["Fel Iron Deposit"] = "Gisement de gangrefer",
	["Adamantite Deposit"] = "Gisement d'adamantite",
	["Rich Adamantite Deposit"] = "Riche gisement d'adamantite",
	["Khorium Vein"] = "Filon de khorium",
	["Large Obsidian Chunk"] = "Grand morceau d'obsidienne",
	["Small Obsidian Chunk"] = "Petit morceau d'obsidienne",
	["Nethercite Deposit"] = "Gisement de néanticite",
	
} end)
-- Translater: StingerSoft
BabbleOre:RegisterTranslations("ruRU", function() return {
-- Ore
	["Copper Ore"] = "Медная руда",
	["Tin Ore"] = "Оловянная руда",
	["Silver Ore"] = "Серебряная руда",
	["Iron Ore"] = "Железная руда",
	["Gold Ore"] = "Золотая руда",
	["Mithril Ore"] = "Мифриловая руда",
	["Dark Iron Ore"] = "Руда темного железа",
	["Truesilver Ore"] = "Руда истинного серебра",
	["Thorium Ore"] = "Ториевая руда",
	["Elementium Ore"] = "Элементиевая руда",
	["Fel Iron Ore"] = "Руда оскверненного железа",
	["Adamantite Ore"] = "Адамантитовая руда",
	["Eternium Ore"] = "Этерниевая руда",
	["Khorium Ore"] = "Кориевая руда",
-- Types
	["Copper"] = "Медь",
	["Tin"] = "Олово",
	["Silver"] = "Серебро",
	["Iron"] = "Железо",
	["Gold"] = "Золото",
	["Mithril"] = "Мифрил",
	["Dark Iron"] = "Темное железо",
	["Truesilver"] = "Истинное серебро",
	["Thorium"] = "Торий",
	["Elementium"] = "Элементий",
	["Fel Iron"] = "Оскверненное железо",
	["Adamantite"] = "Адамантит",
	["Eternium"] = "Этерний",
	["Khorium"] = "Кории",
	["Incendicite"] = "Огневитая",
	["Lesser Bloodstone"] = "Бедная кровавая",
	["Indurium"] = "Индарилий",
	["Large Obsidian Shard"] = "Большой обсидиановый осколок",
	["Small Obsidian Shard"] = "Маленький обсидиановый осколок",
	["Rich Thorium"] = "Богатый торий",
	["Rich Adamantite"] = "Богатый адамантит",
-- Quest Ore
	["Underlight Ore"] = "Руда из Беспросветных рудников", -- copper and tin
	["Lead Ore"] = "Свинцовая руда",
	["Rethban Ore"] = "Ретбанская руда", --quest
	["Incendicite Ore"] = "Огневитовая руда",
	["Umbral Ore"] = "Мрачная руда",
	["Elunite Ore"] = "Элунитовая руда",
	["Lesser Bloodstone Ore"] = "Бедная кровавая руда", --quest
	["Indurium Ore"] = "Индарилиевая руда",
	["Nethercite Ore"] = "Хаотитовая руда",
-- Nodes
	["Copper Vein"] = "Медная жила",
	["Tin Vein"] = "Оловянная жила",
	["Iron Deposit"] = "Залежи железа",
	["Silver Vein"] = "Серебрянная жила",
	["Gold Vein"] = "Золотая жила",
	["Mithril Deposit"] = "Мифриловые залежи",
	["Ooze Covered Mithril Deposit"] = "Покрытые слизью мифриловые залежи",
	["Truesilver Deposit"] = "Залежи истинного серебра",
	["Ooze Covered Silver Vein"] = "Покрытая слизью серебрянная жила",
	["Ooze Covered Gold Vein"] = "Покрытая слизью золотая жила",
	["Ooze Covered Truesilver Deposit"] = "Покрытые слизью залежи истинного серебра",
	["Ooze Covered Rich Thorium Vein"] = "Покрытая слизью богатая ториевая жила",
	["Ooze Covered Thorium Vein"] = "Покрытая слизью ториевая жила",
	["Small Thorium Vein"] = "Малая ториевая жила",
	["Rich Thorium Vein"] = "Богатая ториевая жила",
	["Hakkari Thorium Vein"] = "Ториевая жила Хаккари",
	["Dark Iron Deposit"] = "Залежи черного железа",
	["Lesser Bloodstone Deposit"] = "Малое месторождение кровавого камня",
	["Incendicite Mineral Vein"] = "Ароматитовая жила",
	["Indurium Mineral Vein"] = "Индарилиевые залежи",
	["Fel Iron Deposit"] = "Месторождение оскверненного железа",
	["Adamantite Deposit"] = "Залежи адамантита",
	["Rich Adamantite Deposit"] = "Богатые залежи адамантита",
	["Khorium Vein"] = "Кориевая жила",
	["Large Obsidian Chunk"] = "Большая обсидиановая глыба", -- AQ 20/40
	["Small Obsidian Chunk"] = "Маленький кусочек обсидиана", -- AQ 40
	["Nethercite Deposit"] = "Месторождение хаотита",
	
} end)


BabbleOre:Debug()
BabbleOre:SetStrictness(true)

AceLibrary:Register(BabbleOre, MAJOR_VERSION, MINOR_VERSION)
BabbleOre = nil
