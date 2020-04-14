--[[
************************************************************************
Trainer.lua
Trainer data for all of Ackis Recipe List
************************************************************************
File date: 2010-04-21T19:07:45Z
File revision: @file-revision@
Project revision: @project-revision@
Project version: v2.01-14-gfc58e9f
************************************************************************
Format:
	self:addLookupList(DB, NPC ID, NPC Name, NPC Location, X Coord, Y Coord, Faction)
************************************************************************
Please see http://www.wowace.com/addons/arl/ for more information.
************************************************************************
This source code is released under All Rights Reserved.
************************************************************************
]]--

local MODNAME	= "Ackis Recipe List"
local addon		= LibStub("AceAddon-3.0"):GetAddon(MODNAME)
local L			= LibStub("AceLocale-3.0"):GetLocale(MODNAME)
local BZ		= LibStub("LibBabble-Zone-3.0"):GetLookupTable()

function addon:InitTrainer(DB)
	self:addLookupList(DB, 514, L["Smith Argus"], BZ["Elwynn Forest"], 41.7, 65.6, 1)
	self:addLookupList(DB, 1103, L["Eldrin"], BZ["Elwynn Forest"], 79.3, 69.0, 1)
	self:addLookupList(DB, 1215, L["Alchemist Mallory"], BZ["Elwynn Forest"], 39.8, 48.3, 1)
	self:addLookupList(DB, 1241, L["Tognus Flintfire"], BZ["Dun Morogh"], 45.3, 52.0, 1)
	self:addLookupList(DB, 1246, L["Vosur Brakthel"], BZ["Ironforge"], 66.5, 55.2, 1)
	self:addLookupList(DB, 1317, L["Lucan Cordell"], BZ["Stormwind City"], 53.0, 74.3, 1)
	self:addLookupList(DB, 1346, L["Georgio Bolero"], BZ["Stormwind City"], 53.2, 81.5, 1)
	self:addLookupList(DB, 1355, L["Cook Ghilm"], BZ["Dun Morogh"], 68.4, 54.5, 1)
	self:addLookupList(DB, 1382, L["Mudduk"], BZ["Stranglethorn Vale"], 31.4, 28.0, 2)
	self:addLookupList(DB, 1385, L["Brawn"], BZ["Stranglethorn Vale"], 31.7, 28.8, 2)
	self:addLookupList(DB, 1386, L["Rogvar"], BZ["Swamp of Sorrows"], 48.4, 55.7, 2)
	self:addLookupList(DB, 1430, L["Tomas"], BZ["Elwynn Forest"], 44.3, 66.0, 1)  ---confirm
	self:addLookupList(DB, 1470, L["Ghak Healtouch"], BZ["Loch Modan"], 37.0, 49.2, 1)
	self:addLookupList(DB, 1632, L["Adele Fielder"], BZ["Elwynn Forest"], 46.4, 62.1, 1)
	self:addLookupList(DB, 1676, L["Finbus Geargrind"], BZ["Duskwood"], 77.4, 48.6, 1)
	self:addLookupList(DB, 1681, L["Brock Stoneseeker"], BZ["Loch Modan"], 37.1, 47.8, 1)
	self:addLookupList(DB, 1699, L["Gremlock Pilsnor"], BZ["Dun Morogh"], 47.6, 52.3, 1)
	self:addLookupList(DB, 1701, L["Dank Drizzlecut"], BZ["Dun Morogh"], 69.3, 55.5, 1)
	self:addLookupList(DB, 1702, L["Bronk Guzzlegear"], BZ["Dun Morogh"], 50.2, 50.4, 1)
	self:addLookupList(DB, 2132, L["Carolai Anise"], BZ["Tirisfal Glades"], 59.5, 52.2, 2)
	self:addLookupList(DB, 2326, L["Thamner Pol"], BZ["Dun Morogh"], 47.2, 52.6, 1)
	self:addLookupList(DB, 2327, L["Shaina Fuller"], BZ["Stormwind City"], 52.9, 44.8, 1)
	self:addLookupList(DB, 2329, L["Michelle Belle"], BZ["Elwynn Forest"], 43.4, 65.6, 1)
	self:addLookupList(DB, 2391, L["Serge Hinott"], BZ["Hillsbrad Foothills"], 61.6, 19.2, 2)
	self:addLookupList(DB, 2399, L["Daryl Stack"], BZ["Hillsbrad Foothills"], 63.7, 20.8, 2)
	self:addLookupList(DB, 2627, L["Grarnik Goodstitch"], BZ["Stranglethorn Vale"], 28.7, 76.8, 0)
	self:addLookupList(DB, 2798, L["Pand Stonebinder"], BZ["Thunder Bluff"], 29.4, 21.5, 2)
	self:addLookupList(DB, 2818, L["Slagg"], BZ["Arathi Highlands"], 74.1, 33.8, 2)
	self:addLookupList(DB, 2836, L["Brikk Keencraft"], BZ["Stranglethorn Vale"], 29.0, 75.5, 0)
	self:addLookupList(DB, 2837, L["Jaxin Chong"], BZ["Stranglethorn Vale"], 28.1, 78.0, 0)
	self:addLookupList(DB, 2998, L["Karn Stonehoof"], BZ["Thunder Bluff"], 39.0, 56.5, 2)
	self:addLookupList(DB, 3001, L["Brek Stonehoof"], BZ["Thunder Bluff"], 34.5, 57.6, 2)
	self:addLookupList(DB, 3004, L["Tepa"], BZ["Thunder Bluff"], 44.3, 45.0, 2)
	self:addLookupList(DB, 3007, L["Una"], BZ["Thunder Bluff"], 41.8, 42.7, 2)
	self:addLookupList(DB, 3009, L["Bena Winterhoof"], BZ["Thunder Bluff"], 46.8, 33.5, 2)
	self:addLookupList(DB, 3011, L["Teg Dawnstrider"], BZ["Thunder Bluff"], 45.0, 38.0, 2)
	self:addLookupList(DB, 3026, L["Aska Mistrunner"], BZ["Thunder Bluff"], 51.1, 52.9, 2)
	self:addLookupList(DB, 3067, L["Pyall Silentstride"], BZ["Mulgore"], 45.5, 58.1, 2)
	self:addLookupList(DB, 3069, L["Chaw Stronghide"], BZ["Mulgore"], 45.5, 57.9, 2)
	self:addLookupList(DB, 3087, L["Crystal Boughman"], BZ["Redridge Mountains"], 22.8, 43.6, 1)
	self:addLookupList(DB, 3136, L["Clarise Gnarltree"], BZ["Duskwood"], 74.0, 48.5, 1)
	self:addLookupList(DB, 3137, L["Matt Johnson"], BZ["Duskwood"], 74.0, 49.7, 1)
	self:addLookupList(DB, 3174, L["Dwukk"], BZ["Durotar"], 52.0, 40.7, 2)
	self:addLookupList(DB, 3175, L["Krunn"], BZ["Durotar"], 51.9, 40.9, 2)
	self:addLookupList(DB, 3181, L["Fremal Doohickey"], BZ["Wetlands"], 10.8, 61.3, 1)
	self:addLookupList(DB, 3184, L["Miao'zan"], BZ["Durotar"], 55.5, 74.0, 2)
	self:addLookupList(DB, 3290, L["Deek Fizzlebizz"], BZ["Loch Modan"], 45.9, 13.6, 1)
	self:addLookupList(DB, 3345, L["Godan"], BZ["Orgrimmar"], 53.8, 38.5, 2)
	self:addLookupList(DB, 3347, L["Yelmak"], BZ["Orgrimmar"], 56.7, 33.2, 2)
	self:addLookupList(DB, 3355, L["Saru Steelfury"], BZ["Orgrimmar"], 82.1, 23.0, 2)
	self:addLookupList(DB, 3357, L["Makaru"], BZ["Orgrimmar"], 73.1, 26.5, 2)
	self:addLookupList(DB, 3363, L["Magar"], BZ["Orgrimmar"], 63.5, 50.0, 2)
	self:addLookupList(DB, 3365, L["Karolek"], BZ["Orgrimmar"], 62.8, 44.5, 2)
	self:addLookupList(DB, 3373, L["Arnok"], BZ["Orgrimmar"], 34.1, 84.4, 2)
	self:addLookupList(DB, 3399, L["Zamja"], BZ["Orgrimmar"], 57.5, 53.7, 2)
	self:addLookupList(DB, 3478, L["Traugh"], BZ["The Barrens"], 51.3, 28.9, 2)
	self:addLookupList(DB, 3484, L["Kil'hala"], BZ["The Barrens"], 52.2, 31.7, 2)
	self:addLookupList(DB, 3494, L["Tinkerwiz"], BZ["The Barrens"], 62.7, 36.3, 0)
	self:addLookupList(DB, 3523, L["Bowen Brisboise"], BZ["Tirisfal Glades"], 52.6, 55.6, 2)
	self:addLookupList(DB, 3549, L["Shelene Rhobart"], BZ["Tirisfal Glades"], 65.5, 61.0, 2)
	self:addLookupList(DB, 3555, L["Johan Focht"], BZ["Silverpine Forest"], 43.4, 40.5, 2)
	self:addLookupList(DB, 3557, L["Guillaume Sorouy"], BZ["Silverpine Forest"], 43.2, 41.0, 2)
	self:addLookupList(DB, 3603, L["Cyndra Kindwhisper"], BZ["Teldrassil"], 57.6, 60.7, 1)
	self:addLookupList(DB, 3605, L["Nadyia Maneweaver"], BZ["Teldrassil"], 41.8, 49.5, 1)
	self:addLookupList(DB, 3606, L["Alanna Raveneye"], BZ["Teldrassil"], 36.8, 34.2, 1)
	self:addLookupList(DB, 3703, L["Krulmoo Fullmoon"], BZ["The Barrens"], 44.8, 59.4, 2)
	self:addLookupList(DB, 3704, L["Mahani"], BZ["The Barrens"], 44.9, 59.4, 2)
	self:addLookupList(DB, 3964, L["Kylanna"], BZ["Ashenvale"], 50.8, 67.1, 1)
	self:addLookupList(DB, 3967, L["Aayndia Floralwind"], BZ["Ashenvale"], 35.9, 52.1, 1)
	self:addLookupList(DB, 4159, L["Me'lynn"], BZ["Darnassus"], 61.7, 23.0, 1)
	self:addLookupList(DB, 4160, L["Ainethil"], BZ["Darnassus"], 55.0, 23.8, 1)
	self:addLookupList(DB, 4193, L["Grondal Moonbreeze"], BZ["Darkshore"], 38.2, 40.5, 1)
	self:addLookupList(DB, 4210, L["Alegorn"], BZ["Darnassus"], 49.2, 21.2, 1)
	self:addLookupList(DB, 4211, L["Dannelor"], BZ["Darnassus"], 51.7, 12.6, 1)
	self:addLookupList(DB, 4212, L["Telonis"], BZ["Darnassus"], 64.5, 21.3, 1)
	self:addLookupList(DB, 4213, L["Taladan"], BZ["Darnassus"], 58.6, 13.2, 1)
	self:addLookupList(DB, 4254, L["Geofram Bouldertoe"], BZ["Ironforge"], 50.3, 26.0, 1)
	self:addLookupList(DB, 4258, L["Bengus Deepforge"], BZ["Ironforge"], 51.0, 43.0, 1)
	self:addLookupList(DB, 4552, L["Eunice Burch"], BZ["Undercity"], 62.3, 44.6, 2)
	self:addLookupList(DB, 4576, L["Josef Gregorian"], BZ["Undercity"], 70.7, 30.3, 2)
	self:addLookupList(DB, 4578, L["Josephine Lister"], BZ["Undercity"], 86.5, 22.3, 2)
	self:addLookupList(DB, 4588, L["Arthur Moore"], BZ["Undercity"], 70.3, 58.5, 2)
	self:addLookupList(DB, 4591, L["Mary Edras"], BZ["Undercity"], 73.5, 54.8, 2)
	self:addLookupList(DB, 4596, L["James Van Brunt"], BZ["Undercity"], 61.2, 29.9, 2)
	self:addLookupList(DB, 4598, L["Brom Killian"], BZ["Undercity"], 55.8, 37.0, 2)
	self:addLookupList(DB, 4611, L["Doctor Herbert Halsey"], BZ["Undercity"], 47.7, 73.0, 2)
	self:addLookupList(DB, 4616, L["Lavinia Crowe"], BZ["Undercity"], 62.1, 60.5, 2)
	self:addLookupList(DB, 4900, L["Alchemist Narett"], BZ["Dustwallow Marsh"], 64.0, 47.7, 1)
	self:addLookupList(DB, 5127, L["Fimble Finespindle"], BZ["Ironforge"], 39.8, 33.5, 1)
	self:addLookupList(DB, 5150, L["Nissa Firestone"], BZ["Ironforge"], 54.0, 57.8, 1)
	self:addLookupList(DB, 5153, L["Jormund Stonebrow"], BZ["Ironforge"], 43.2, 29.0, 1)
	self:addLookupList(DB, 5157, L["Gimble Thistlefuzz"], BZ["Ironforge"], 60.0, 45.4, 1)
	self:addLookupList(DB, 5159, L["Daryl Riknussun"], BZ["Ironforge"], 60.1, 36.8, 1)
	self:addLookupList(DB, 5164, L["Grumnus Steelshaper"], BZ["Ironforge"], 50.2, 42.8, 1)
	self:addLookupList(DB, 5174, L["Springspindle Fizzlegear"], BZ["Ironforge"], 68.4, 44.0, 1)
	self:addLookupList(DB, 5177, L["Tally Berryfizz"], BZ["Ironforge"], 66.6, 55.2, 1)
	self:addLookupList(DB, 5392, L["Yarr Hammerstone"], BZ["Dun Morogh"], 50.0, 50.3, 1)
	self:addLookupList(DB, 5482, L["Stephen Ryback"], BZ["Stormwind City"], 78.2, 53.2, 1)
	self:addLookupList(DB, 5499, L["Lilyssia Nightbreeze"], BZ["Stormwind City"], 55.6, 85.9, 1)
	self:addLookupList(DB, 5511, L["Therum Deepforge"], BZ["Stormwind City"], 63.9, 37.8, 1)
	self:addLookupList(DB, 5513, L["Gelman Stonehand"], BZ["Stormwind City"], 59.2, 37.7, 1)
	self:addLookupList(DB, 5518, L["Lilliam Sparkspindle"], BZ["Stormwind City"], 62.2, 30.5, 1)
	self:addLookupList(DB, 5564, L["Simon Tanner"], BZ["Stormwind City"], 71.8, 62.9, 1)
	self:addLookupList(DB, 5695, L["Vance Undergloom"], BZ["Tirisfal Glades"], 61.7, 51.6, 2)
	self:addLookupList(DB, 5759, L["Nurse Neela"], BZ["Tirisfal Glades"], 61.8, 52.8, 2)
	self:addLookupList(DB, 5784, L["Waldor"], BZ["Wailing Caverns"], 32.6, 28.5, 0)
	self:addLookupList(DB, 5939, L["Vira Younghoof"], BZ["Mulgore"], 46.8, 60.8, 2)
	self:addLookupList(DB, 5943, L["Rawrk"], BZ["Durotar"], 54.1, 42.0, 2)
	self:addLookupList(DB, 6094, L["Byancie"], BZ["Teldrassil"], 55.3, 56.8, 1)
	self:addLookupList(DB, 6286, L["Zarrin"], BZ["Teldrassil"], 57.1, 61.3, 1)
	self:addLookupList(DB, 6297, L["Kurdram Stonehammer"], BZ["Darkshore"], 38.2, 41.1, 1)
	self:addLookupList(DB, 6299, L["Delfrum Flintbeard"], BZ["Darkshore"], 38.2, 41.0, 1)
	self:addLookupList(DB, 7230, L["Shayis Steelfury"], BZ["Orgrimmar"], 80.3, 23.2, 2)
	self:addLookupList(DB, 7231, L["Kelgruk Bloodaxe"], BZ["Orgrimmar"], 81.9, 18.3, 2)
	self:addLookupList(DB, 7232, L["Borgus Steelhand"], BZ["Stormwind City"], 59.8, 34.8, 1)
	self:addLookupList(DB, 7406, L["Oglethorpe Obnoticus"], BZ["Stranglethorn Vale"], 28.3, 76.3, 0)
	self:addLookupList(DB, 7866, L["Peter Galen"], BZ["Azshara"], 37.5, 65.5, 1)
	self:addLookupList(DB, 7867, L["Thorkaf Dragoneye"], BZ["Badlands"], 62.6, 57.6, 2)
	self:addLookupList(DB, 7868, L["Sarah Tanner"], BZ["Searing Gorge"], 63.7, 75.7, 1)
	self:addLookupList(DB, 7869, L["Brumn Winterhoof"], BZ["Arathi Highlands"], 28.2, 45.0, 2)
	self:addLookupList(DB, 7870, L["Caryssia Moonhunter"], BZ["Feralas"], 89.4, 46.5, 1) ---confirm
	self:addLookupList(DB, 7871, L["Se'Jib"], BZ["Stranglethorn Vale"], 36.6, 34.2, 2)
	self:addLookupList(DB, 7944, L["Tinkmaster Overspark"], BZ["Ironforge"], 69.8, 50.0, 1)
	self:addLookupList(DB, 7948, L["Kylanna Windwhisper"], BZ["Feralas"], 32.6, 43.8, 1)
	self:addLookupList(DB, 7949, L["Xylinnia Starshine"], BZ["Feralas"], 31.6, 44.3, 1)
	self:addLookupList(DB, 8126, L["Nixx Sprocketspring"], BZ["Tanaris"], 52.5, 27.3, 0)
	self:addLookupList(DB, 8128, L["Pikkle"], BZ["Tanaris"], 51.1, 28.1, 0)
	self:addLookupList(DB, 8153, L["Narv Hidecrafter"], BZ["Desolace"], 55.3, 56.3, 2)
	self:addLookupList(DB, 8306, L["Duhng"], BZ["The Barrens"], 55.3, 31.8, 2)
	self:addLookupList(DB, 8736, L["Buzzek Bracketswing"], BZ["Tanaris"], 52.3, 27.7, 0)
	self:addLookupList(DB, 8738, L["Vazario Linkgrease"], BZ["The Barrens"], 62.7, 36.3, 0)
	self:addLookupList(DB, 9584, L["Jalane Ayrole"], BZ["Stormwind City"], 40.6, 83.9, 1)
	self:addLookupList(DB, 11017, L["Roxxik"], BZ["Orgrimmar"], 76.0, 25.1, 2)
	self:addLookupList(DB, 11025, L["Mukdrak"], BZ["Durotar"], 52.2, 40.8, 2)
	self:addLookupList(DB, 11031, L["Franklin Lloyd"], BZ["Undercity"], 75.9, 73.7, 2)
	self:addLookupList(DB, 11037, L["Jenna Lemkenilli"], BZ["Darkshore"], 38.3, 41.1, 1)
	self:addLookupList(DB, 11052, L["Timothy Worthington"], BZ["Dustwallow Marsh"], 66.22, 51.7, 1)
	self:addLookupList(DB, 11072, L["Kitta Firewind"], BZ["Elwynn Forest"], 64.9, 70.6, 1)
	self:addLookupList(DB, 11073, L["Annora"], BZ["Uldaman"], 0, 0, 0)
	self:addLookupList(DB, 11074, L["Hgarth"], BZ["Stonetalon Mountains"], 49.2, 57.2, 2)
	self:addLookupList(DB, 11097, L["Drakk Stonehand"], BZ["The Hinterlands"], 13.4, 43.4, 1)
	self:addLookupList(DB, 11098, L["Hahrana Ironhide"], BZ["Feralas"], 74.4, 43.1, 2)
	self:addLookupList(DB, 11146, L["Ironus Coldsteel"], BZ["Ironforge"], 50.5, 43.3, 1)
	self:addLookupList(DB, 11177, L["Okothos Ironrager"], BZ["Orgrimmar"], 79.8, 23.8, 2)
	self:addLookupList(DB, 11178, L["Borgosh Corebender"], BZ["Orgrimmar"], 79.7, 23.7, 2)
	self:addLookupList(DB, 11557, L["Meilosh"], BZ["Felwood"], 65.7, 2.9, 2)
	self:addLookupList(DB, 12920, L["Doctor Gregory Victor"], BZ["Arathi Highlands"], 73.4, 36.8, 2)
	self:addLookupList(DB, 12939, L["Doctor Gustaf VanHowzen"], BZ["Dustwallow Marsh"], 68.18, 47.94, 1)
	self:addLookupList(DB, 14742, L["Zap Farflinger"], BZ["Winterspring"], 61.2, 37.6, 0)
	self:addLookupList(DB, 14743, L["Jhordy Lapforge"], BZ["Tanaris"], 52.3, 26.9, 0)
	self:addLookupList(DB, 15400, L["Arathel Sunforge"], BZ["Eversong Woods"], 59.6, 62.6, 2)
	self:addLookupList(DB, 15501, L["Aleinia"], BZ["Eversong Woods"], 48.5, 47.5, 2)
	self:addLookupList(DB, 16160, L["Magistrix Eredania"], BZ["Eversong Woods"], 38.2, 72.6, 2)
	self:addLookupList(DB, 16161, L["Arcanist Sheynathren"], BZ["Eversong Woods"], 38.2, 72.5, 2)
	self:addLookupList(DB, 16253, L["Master Chef Mouldier"], BZ["Ghostlands"], 48.3, 30.9, 2)
	self:addLookupList(DB, 16272, L["Kanaria"], BZ["Eversong Woods"], 48.5, 47.6, 2)
	self:addLookupList(DB, 16277, L["Quarelestra"], BZ["Eversong Woods"], 48.6, 47.1, 2)
	self:addLookupList(DB, 16278, L["Sathein"], BZ["Eversong Woods"], 53.5, 51.0, 2)
	self:addLookupList(DB, 16366, L["Sempstress Ambershine"], BZ["Eversong Woods"], 37.4, 71.9, 2)
	self:addLookupList(DB, 16583, L["Rohok"], BZ["Hellfire Peninsula"], 53.2, 38.2, 2)
	self:addLookupList(DB, 16588, L["Apothecary Antonivich"], BZ["Hellfire Peninsula"], 52.4, 36.5, 2)
	self:addLookupList(DB, 16633, L["Sedana"], BZ["Silvermoon City"], 70.0, 24.0, 2)
	self:addLookupList(DB, 16640, L["Keelen Sheets"], BZ["Silvermoon City"], 57.0, 50.1, 2)
	self:addLookupList(DB, 16642, L["Camberon"], BZ["Silvermoon City"], 66.1, 17.4, 2)
	self:addLookupList(DB, 16662, L["Alestus"], BZ["Silvermoon City"], 77.6, 71.3, 2)
	self:addLookupList(DB, 16663, L["Belil"], BZ["Silvermoon City"], 79.1, 42.9, 2)
	self:addLookupList(DB, 16667, L["Danwe"], BZ["Silvermoon City"], 76.5, 40.9, 2)
	self:addLookupList(DB, 16669, L["Bemarrin"], BZ["Silvermoon City"], 79.5, 39.0, 2)
	self:addLookupList(DB, 16676, L["Sylann"], BZ["Silvermoon City"], 69.5, 71.5, 2)
	self:addLookupList(DB, 16688, L["Lynalis"], BZ["Silvermoon City"], 84.0, 80.2, 2)
	self:addLookupList(DB, 16719, L["Mumman"], BZ["The Exodar"], 55.6, 27.1, 1)
	self:addLookupList(DB, 16723, L["Lucc"], BZ["The Exodar"], 27.5, 60.9, 1)
	self:addLookupList(DB, 16724, L["Miall"], BZ["The Exodar"], 60.0, 89.6, 1)
	self:addLookupList(DB, 16725, L["Nahogg"], BZ["The Exodar"], 40.5, 39.2, 1)
	self:addLookupList(DB, 16726, L["Ockil"], BZ["The Exodar"], 54.0, 92.1, 1)
	self:addLookupList(DB, 16728, L["Akham"], BZ["The Exodar"], 66.0, 74.6, 1)
	self:addLookupList(DB, 16729, L["Refik"], BZ["The Exodar"], 63.0, 67.9, 1)
	self:addLookupList(DB, 16731, L["Nus"], BZ["The Exodar"], 39.0, 22.5, 1)
	self:addLookupList(DB, 16752, L["Muaat"], BZ["The Exodar"], 60.0, 87.9, 1)
	self:addLookupList(DB, 16823, L["Humphry"], BZ["Hellfire Peninsula"], 56.8, 63.8, 1)
	self:addLookupList(DB, 17214, L["Anchorite Fateema"], BZ["Azuremyst Isle"], 48.5, 51.8, 1) --- confirm
	self:addLookupList(DB, 17215, L["Daedal"], BZ["Azuremyst Isle"], 48.5, 51.5, 1) --- confirm
	self:addLookupList(DB, 17222, L["Artificer Daelo"], BZ["Azuremyst Isle"], 48.0, 51.0, 1)
	self:addLookupList(DB, 17245, L["Blacksmith Calypso"], BZ["Azuremyst Isle"], 46.4, 71.1, 1)
	self:addLookupList(DB, 17246, L["\"Cookie\" McWeaksauce"], BZ["Azuremyst Isle"], 46.7, 70.5, 1) -- confirm
	self:addLookupList(DB, 17424, L["Anchorite Paetheus"], BZ["Bloodmyst Isle"], 54.7, 54.0, 1)
	self:addLookupList(DB, 17442, L["Moordo"], BZ["Azuremyst Isle"], 44.8, 23.8, 1)
	self:addLookupList(DB, 17487, L["Erin Kelly"], BZ["Azuremyst Isle"], 46.2, 70.5, 1)
	self:addLookupList(DB, 17488, L["Dulvi"], BZ["Azuremyst Isle"], 48.9, 51.1, 1)
	self:addLookupList(DB, 17634, L["K. Lee Smallfry"], BZ["Zangarmarsh"], 68.6, 50.2, 1)
	self:addLookupList(DB, 17637, L["Mack Diver"], BZ["Zangarmarsh"], 33.9, 51.0, 2)
	self:addLookupList(DB, 18747, L["Krugosh"], BZ["Hellfire Peninsula"], 55.5, 37.6, 2)
	self:addLookupList(DB, 18749, L["Dalinna"], BZ["Hellfire Peninsula"], 56.6, 37.1, 2) --- confirm
	self:addLookupList(DB, 18751, L["Kalaen"], BZ["Hellfire Peninsula"], 56.8, 37.7, 2)
	self:addLookupList(DB, 18752, L["Zebig"], BZ["Hellfire Peninsula"], 54.8, 38.5, 2)
	self:addLookupList(DB, 18753, L["Felannia"], BZ["Hellfire Peninsula"], 52.3, 36.1, 2)
	self:addLookupList(DB, 18754, L["Barim Spilthoof"], BZ["Hellfire Peninsula"], 56.2, 38.6, 2)
	self:addLookupList(DB, 18771, L["Brumman"], BZ["Hellfire Peninsula"], 54.1, 64.0, 1)
	self:addLookupList(DB, 18772, L["Hama"], BZ["Hellfire Peninsula"], 54.1, 63.6, 1)
	self:addLookupList(DB, 18773, L["Johan Barnes"], BZ["Hellfire Peninsula"], 53.7, 66.1, 1)
	self:addLookupList(DB, 18774, L["Tatiana"], BZ["Hellfire Peninsula"], 54.6, 63.6, 1)
	self:addLookupList(DB, 18775, L["Lebowski"], BZ["Hellfire Peninsula"], 55.7, 65.5, 1)
	self:addLookupList(DB, 18779, L["Hurnak Grimmord"], BZ["Hellfire Peninsula"], 56.7, 63.8, 1)
	self:addLookupList(DB, 18802, L["Alchemist Gribble"], BZ["Hellfire Peninsula"], 53.8, 65.8, 1)
	self:addLookupList(DB, 18804, L["Prospector Nachlan"], BZ["Bloodmyst Isle"], 56.3, 54.3, 1)
	self:addLookupList(DB, 18987, L["Gaston"], BZ["Hellfire Peninsula"], 54.1, 63.5, 1)
	self:addLookupList(DB, 18988, L["Baxter"], BZ["Hellfire Peninsula"], 56.8, 37.5, 2)
	self:addLookupList(DB, 18990, L["Burko"], BZ["Hellfire Peninsula"], 22.4, 39.3, 1)
	self:addLookupList(DB, 18991, L["Aresella"], BZ["Hellfire Peninsula"], 26.3, 62.0, 2)
	self:addLookupList(DB, 18993, L["Naka"], BZ["Zangarmarsh"], 78.5, 63.0, 0)
	self:addLookupList(DB, 19052, L["Lorokeem"], BZ["Shattrath City"], 45.4, 19.5, 0)
	self:addLookupList(DB, 19063, L["Hamanar"], BZ["Shattrath City"], 35.7, 20.5, 0)
	self:addLookupList(DB, 19184, L["Mildred Fletcher"], BZ["Shattrath City"], 66.5, 13.5, 0)
	self:addLookupList(DB, 19185, L["Jack Trapper"], BZ["Shattrath City"], 63.0, 68.5, 0)
	self:addLookupList(DB, 19186, L["Kylene"], BZ["Shattrath City"], 76.5, 33.0, 0)
	self:addLookupList(DB, 19187, L["Darmari"], BZ["Shattrath City"], 66.8, 67.1, 0)
	self:addLookupList(DB, 19251, L["Enchantress Volali"], BZ["Shattrath City"], 43.2, 92.3, 0)
	self:addLookupList(DB, 19252, L["High Enchanter Bardolan"], BZ["Shattrath City"], 43.2, 92.2, 0)
	self:addLookupList(DB, 19341, L["Grutah"], BZ["Shadowmoon Valley"], 29.7, 31.5, 2)
	self:addLookupList(DB, 19369, L["Celie Steelwing"], BZ["Shadowmoon Valley"], 37.2, 58.5, 1)
	self:addLookupList(DB, 19478, L["Fera Palerunner"], BZ["Blade's Edge Mountains"], 53.7, 55.0, 2)
	self:addLookupList(DB, 19539, L["Jazdalaad"], BZ["Netherstorm"], 44.5, 34.0, 0)
	self:addLookupList(DB, 19540, L["Asarnan"], BZ["Netherstorm"], 44.2, 33.7, 0)
	self:addLookupList(DB, 19576, L["Xyrol"], BZ["Netherstorm"], 32.5, 66.7, 0)
	self:addLookupList(DB, 19775, L["Kalinda"], BZ["Silvermoon City"], 90.5, 74.1, 2)
	self:addLookupList(DB, 19778, L["Farii"], BZ["The Exodar"], 45.0, 24.0, 1)
	self:addLookupList(DB, 20124, L["Kradu Grimblade"], BZ["Shattrath City"], 69.2, 44.8, 0)
	self:addLookupList(DB, 20125, L["Zula Slagfury"], BZ["Shattrath City"], 70.1, 42.0, 0)
	self:addLookupList(DB, 21087, L["Grikka"], BZ["Blade's Edge Mountains"], 76.8, 65.5, 2)
	self:addLookupList(DB, 21493, L["Kablamm Farflinger"], BZ["Netherstorm"], 32.9, 63.7, 0)
	self:addLookupList(DB, 21494, L["Smiles O'Byron"], BZ["Blade's Edge Mountains"], 60.3,65.2, 0)
	self:addLookupList(DB, 22477, L["Anchorite Ensham"], BZ["Terokkar Forest"], 30.8, 75.9, 0)
	self:addLookupList(DB, 23734, L["Anchorite Yazmina"], BZ["Howling Fjord"], 59.5, 62.3, 1)
	self:addLookupList(DB, 24868, L["Niobe Whizzlespark"], BZ["Shadowmoon Valley"], 36.7, 54.8, 1)
	self:addLookupList(DB, 25099, L["Jonathan Garrett"], BZ["Shadowmoon Valley"], 29.2, 28.5, 2)
	self:addLookupList(DB, 25277, L["Chief Engineer Leveny"], BZ["Borean Tundra"], 42.6, 53.7, 2)
	self:addLookupList(DB, 26564, L["Borus Ironbender"], BZ["Dragonblight"], 36.6, 47.1, 2)
	self:addLookupList(DB, 26903, L["Lanolis Dewdrop"], BZ["Howling Fjord"], 58.4, 62.3, 1)
	self:addLookupList(DB, 26904, L["Rosina Rivet"], BZ["Howling Fjord"], 59.6, 63.7, 1)
	self:addLookupList(DB, 26905, L["Brom Brewbaster"], BZ["Howling Fjord"], 58.2, 62.1, 1)
	self:addLookupList(DB, 26906, L["Elizabeth Jackson"], BZ["Howling Fjord"], 58.6, 62.8, 1)
	self:addLookupList(DB, 26907, L["Tisha Longbridge"], BZ["Howling Fjord"], 59.7, 64.0, 1)
	self:addLookupList(DB, 26911, L["Bernadette Dexter"], BZ["Howling Fjord"], 59.9, 63.6, 1)
	self:addLookupList(DB, 26912, L["Grumbol Stoutpick"], BZ["Howling Fjord"], 59.9, 63.9, 1)
	self:addLookupList(DB, 26914, L["Benjamin Clegg"], BZ["Howling Fjord"], 58.6, 62.8, 1)
	self:addLookupList(DB, 26915, L["Ounhulo"], BZ["Howling Fjord"], 59.9, 63.8, 1)
	self:addLookupList(DB, 26916, L["Mindri Dinkles"], BZ["Howling Fjord"], 58.6, 62.8, 1)
	self:addLookupList(DB, 26951, L["Wilhelmina Renel"], BZ["Howling Fjord"], 78.7, 28.5, 2)
	self:addLookupList(DB, 26952, L["Kristen Smythe"], BZ["Howling Fjord"], 79.2, 29.0, 2)
	self:addLookupList(DB, 26953, L["Thomas Kolichio"], BZ["Howling Fjord"], 78.6, 29.4, 2)
	self:addLookupList(DB, 26954, L["Emil Autumn"], BZ["Howling Fjord"], 78.7, 28.3, 2)
	self:addLookupList(DB, 26955, L["Jamesina Watterly"], BZ["Howling Fjord"], 78.5, 30.0, 2)
	self:addLookupList(DB, 26956, L["Sally Tompkins"], BZ["Howling Fjord"], 79.4, 29.4, 2)
	self:addLookupList(DB, 26959, L["Booker Kells"], BZ["Howling Fjord"], 79.4, 29.3, 2)
	self:addLookupList(DB, 26960, L["Carter Tiffens"], BZ["Howling Fjord"], 79.3, 28.8, 2)
	self:addLookupList(DB, 26961, L["Gunter Hansen"], BZ["Howling Fjord"], 78.3, 28.2, 2)
	self:addLookupList(DB, 26962, L["Jonathan Lewis"], BZ["Howling Fjord"], 79.3, 29.0, 2)
	self:addLookupList(DB, 26964, L["Alexandra McQueen"], BZ["Howling Fjord"], 79.4, 30.7, 2)
	self:addLookupList(DB, 26969, L["Raenah"], BZ["Borean Tundra"], 41.6, 53.5, 2)
	self:addLookupList(DB, 26972, L["Orn Tenderhoof"], BZ["Borean Tundra"], 42.0, 54.2, 2) -- confirm
	self:addLookupList(DB, 26975, L["Arthur Henslowe"], BZ["Borean Tundra"], 41.8, 54.3, 2)
	self:addLookupList(DB, 26976, L["Brunna Ironaxe"], BZ["Borean Tundra"], 42.6, 53.2, 2)
	self:addLookupList(DB, 26977, L["Adelene Sunlance"], BZ["Borean Tundra"], 41.2, 53.9, 2)
	self:addLookupList(DB, 26980, L["Eorain Dawnstrike"], BZ["Borean Tundra"], 41.2, 53.9, 2)
	self:addLookupList(DB, 26981, L["Crog Steelspine"], BZ["Borean Tundra"], 40.8, 55.3, 2)
	self:addLookupList(DB, 26982, L["Geba'li"], BZ["Borean Tundra"], 41.6, 53.4, 2)
	self:addLookupList(DB, 26987, L["Falorn Nightwhisper"], BZ["Borean Tundra"], 57.8, 71.9, 1)
	self:addLookupList(DB, 26988, L["Argo Strongstout"], BZ["Borean Tundra"], 57.2, 66.6, 1)
	self:addLookupList(DB, 26989, L["Rollick MacKreel"], BZ["Borean Tundra"], 57.9, 71.5, 1)
	self:addLookupList(DB, 26990, L["Alexis Marlowe"], BZ["Borean Tundra"], 57.6, 71.6, 1)
	self:addLookupList(DB, 26991, L["Sock Brightbolt"], BZ["Borean Tundra"], 57.7, 72.2, 1)
	self:addLookupList(DB, 26992, L["Brynna Wilson"], BZ["Borean Tundra"], 57.8, 66.5, 1)
	self:addLookupList(DB, 26995, L["Tink Brightbolt"], BZ["Borean Tundra"], 57.6, 71.7, 1)
	self:addLookupList(DB, 26996, L["Awan Iceborn"], BZ["Borean Tundra"], 76.3, 37.0, 2) --- confirm
	self:addLookupList(DB, 26997, L["Alestos"], BZ["Borean Tundra"], 57.5, 72.3, 1)
	self:addLookupList(DB, 26998, L["Rosemary Bovard"], BZ["Borean Tundra"], 57.6, 71.9, 1)
	self:addLookupList(DB, 26999, L["Fendrig Redbeard"], BZ["Borean Tundra"], 57.5, 66.2, 1)
	self:addLookupList(DB, 27001, L["Darin Goodstitch"], BZ["Borean Tundra"], 57.5, 72.3, 1)
	self:addLookupList(DB, 27023, L["Apothecary Bressa"], BZ["Dragonblight"], 36.2, 48.7, 2)
	self:addLookupList(DB, 27029, L["Apothecary Wormwick"], BZ["Dragonblight"], 76.9, 62.2, 2)
	self:addLookupList(DB, 27034, L["Josric Fame"], BZ["Dragonblight"], 75.9, 63.2, 2) -- confirm
	self:addLookupList(DB, 28693, L["Enchanter Nalthanis"], BZ["Dalaran"], 39.1, 40.5, 0)
	self:addLookupList(DB, 28694, L["Alard Schmied"], BZ["Dalaran"], 45.5, 28.5, 0)
	self:addLookupList(DB, 28697, L["Timofey Oshenko"], BZ["Dalaran"], 39.0, 27.5, 0)
	self:addLookupList(DB, 28698, L["Jedidiah Handers"], BZ["Dalaran"], 41.5, 26.0, 0)
	self:addLookupList(DB, 28699, L["Charles Worth"], BZ["Dalaran"], 36.5, 33.5, 0)
	self:addLookupList(DB, 28700, L["Diane Cannings"], BZ["Dalaran"], 35.7, 28.8, 0)
	self:addLookupList(DB, 28701, L["Timothy Jones"], BZ["Dalaran"], 40.5, 35.2, 0)
	self:addLookupList(DB, 28702, L["Professor Pallin"], BZ["Dalaran"], 41.8, 36.9, 0)
	self:addLookupList(DB, 28703, L["Linzy Blackbolt"], BZ["Dalaran"], 42.5, 32.1, 0)
	self:addLookupList(DB, 28705, L["Katherine Lee"], BZ["Dalaran"], 40.8, 65.2, 1)
	self:addLookupList(DB, 28706, L["Olisarra the Kind"], BZ["Dalaran"], 37.5, 36.7, 0)
	self:addLookupList(DB, 29194, L["Amal'thazad"], BZ["Eastern Plaguelands"], 80.5, 48.1, 0)
	self:addLookupList(DB, 29195, L["Lady Alistra"], BZ["Eastern Plaguelands"], 83.7, 44.6, 0)
	self:addLookupList(DB, 29196, L["Lord Thorval"], BZ["Eastern Plaguelands"], 80.9, 43.8, 0)
	self:addLookupList(DB, 29233, L["Nurse Applewood"], BZ["Borean Tundra"], 41.7, 54.5, 2)
	self:addLookupList(DB, 29505, L["Imindril Spearsong"], BZ["Dalaran"], 45.5, 28.6, 0)
	self:addLookupList(DB, 29506, L["Orland Schaeffer"], BZ["Dalaran"], 45.0, 28.4, 0)
	self:addLookupList(DB, 29507, L["Manfred Staller"], BZ["Dalaran"], 34.2, 29.5, 0)
	self:addLookupList(DB, 29508, L["Andellion"], BZ["Dalaran"], 34.5, 27.1, 0)
	self:addLookupList(DB, 29509, L["Namha Moonwater"], BZ["Dalaran"], 36.3, 29.4, 0)
	self:addLookupList(DB, 29513, L["Didi the Wrench"], BZ["Dalaran"], 39.5, 25.5, 0)
	self:addLookupList(DB, 29514, L["Findle Whistlesteam"], BZ["Dalaran"], 39.5, 25.2, 0)
	self:addLookupList(DB, 29631, L["Awilo Lon'gomba"], BZ["Dalaran"], 70.0, 38.6, 2)
	self:addLookupList(DB, 29924, L["Brandig"], BZ["The Storm Peaks"], 28.9, 74.9, 1)
	self:addLookupList(DB, 30706, L["Jo'mah"], BZ["Orgrimmar"], 56.2, 46.5, 2)
	self:addLookupList(DB, 30709, L["Poshken Hardbinder"], BZ["Thunder Bluff"], 29.2, 22.0, 2)
	self:addLookupList(DB, 30710, L["Zantasia"], BZ["Silvermoon City"], 69.5, 24.0, 2)
	self:addLookupList(DB, 30711, L["Margaux Parchley"], BZ["Undercity"], 61.0, 58.5, 2)
	self:addLookupList(DB, 30713, L["Catarina Stanford"], BZ["Stormwind City"], 49.8, 74.7, 1)
	self:addLookupList(DB, 30715, L["Feyden Darkin"], BZ["Darnassus"], 58.9, 14.1, 1)
	self:addLookupList(DB, 30716, L["Thoth"], BZ["The Exodar"], 40.5, 39.1, 1)
	self:addLookupList(DB, 30717, L["Elise Brightletter"], BZ["Ironforge"], 60.7, 44.9, 1)
	self:addLookupList(DB, 30721, L["Michael Schwan"], BZ["Hellfire Peninsula"], 53.9, 65.5, 1)
	self:addLookupList(DB, 30722, L["Neferatti"], BZ["Hellfire Peninsula"], 52.3, 36.1, 2)
	self:addLookupList(DB, 31084, L["Highlord Darion Mograine"], BZ["Eastern Plaguelands"], 83.5, 49.5, 0)
	self:addLookupList(DB, 33580, L["Dustin Vail"], BZ["Icecrown"], 73.0, 20.8, 0)
	self:addLookupList(DB, 33581, L["Kul'de"], BZ["Icecrown"], 71.8, 20.8, 0)
	self:addLookupList(DB, 33583, L["Fael Morningsong"], BZ["Icecrown"], 73.0, 20.6, 0)
	self:addLookupList(DB, 33586, L["Binkie Brightgear"], BZ["Icecrown"], 72.1, 20.9, 0)
	self:addLookupList(DB, 33587, L["Bethany Cromwell"], BZ["Icecrown"], 72.4, 20.8, 0)
	self:addLookupList(DB, 33588, L["Crystal Brightspark"], BZ["Icecrown"], 71.6, 21.0, 0)
	self:addLookupList(DB, 33589, L["Joseph Wilson"], BZ["Icecrown"], 71.5, 22.5, 0)
	self:addLookupList(DB, 33590, L["Oluros"], BZ["Icecrown"], 71.5, 20.8, 0)
	self:addLookupList(DB, 33591, L["Rekka the Hammer"], BZ["Icecrown"], 71.9, 20.9, 0)
	self:addLookupList(DB, 33603, L["Arthur Denny"], BZ["Icecrown"], 71.7, 20.9, 0)
	self:addLookupList(DB, 33608, GetSpellInfo(51304), BZ["Shattrath City"], 44.3, 90.4, 0) -- Alchemy
	self:addLookupList(DB, 33609, GetSpellInfo(51300), BZ["Shattrath City"], 43.9, 90.5, 0) -- BS
	self:addLookupList(DB, 33610, GetSpellInfo(51313), BZ["Shattrath City"], 43.6, 90.4, 0) -- Enchanting
	self:addLookupList(DB, 33611, GetSpellInfo(51306), BZ["Shattrath City"], 43.7, 90.1, 0) -- Engineering
	self:addLookupList(DB, 33612, GetSpellInfo(51302), BZ["Shattrath City"], 43.8, 90.9, 0) -- LW
	self:addLookupList(DB, 33613, GetSpellInfo(51309), BZ["Shattrath City"], 44.0, 91.1, 0) -- Tailor
	self:addLookupList(DB, 33614, GetSpellInfo(51311), BZ["Shattrath City"], 43.6, 90.8, 0) -- JC
	self:addLookupList(DB, 33615, GetSpellInfo(45363), BZ["Shattrath City"], 43.5, 90.7, 0) -- Insc
	self:addLookupList(DB, 33617, GetSpellInfo(32606), BZ["Shattrath City"], 43.6, 90.9, 0) -- Mine
	self:addLookupList(DB, 33619, GetSpellInfo(51296), BZ["Shattrath City"], 43.6, 91.1, 0) -- Cooking
	self:addLookupList(DB, 33621, GetSpellInfo(45542), BZ["Shattrath City"], 43.6, 90.4, 0) -- First Aid
	self:addLookupList(DB, 33631, L["Barien"], BZ["Shattrath City"], 43.5, 65.1, 0)
	self:addLookupList(DB, 33634, L["Engineer Sinbei"], BZ["Shattrath City"], 43.1, 64.9, 0)
	self:addLookupList(DB, 33635, L["Daenril"], BZ["Shattrath City"], 41.9, 63.4, 0)
	self:addLookupList(DB, 33636, L["Miralisse"], BZ["Shattrath City"], 41.6, 63.5, 0)
	self:addLookupList(DB, 33674, L["Alchemist Kanhu"], BZ["Shattrath City"], 38.6, 30.0, 0)
	self:addLookupList(DB, 33675, L["Onodo"], BZ["Shattrath City"], 37.7, 30.3, 0)
	self:addLookupList(DB, 33676, L["Zurii"], BZ["Shattrath City"], 36.4, 44.6, 0)
	self:addLookupList(DB, 33679, L["Recorder Lidio"], BZ["Shattrath City"], 36.2, 44.0, 0)
	self:addLookupList(DB, 33680, L["Nemiha"], BZ["Shattrath City"], 36.1, 47.7, 0)
	self:addLookupList(DB, 33681, L["Korim"], BZ["Shattrath City"], 37.6, 28.0, 0)
	self:addLookupList(DB, 33682, L["Fono"], BZ["Shattrath City"], 36.0, 48.5, 0)
	self:addLookupList(DB, 33684, L["Weaver Aoa"], BZ["Shattrath City"], 37.6, 27.2, 0)

end
