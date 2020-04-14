--[[
    Armory Addon for World of Warcraft(tm).
    Revision: 310 2010-08-20T17:28:21Z
    URL: http://www.wow-neighbours.com

    License:
        This program is free software; you can redistribute it and/or
        modify it under the terms of the GNU General Public License
        as published by the Free Software Foundation; either version 2
        of the License, or (at your option) any later version.

        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.

        You should have received a copy of the GNU General Public License
        along with this program(see GPL.txt); if not, write to the Free Software
        Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

    Note:
        This AddOn's source code is specifically designed to work with
        World of Warcraft's interpreted AddOn system.
        You have an implicit licence to use this AddOn with these facilities
        since that is it's designated purpose as per:
        http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
--]]

ARMORY_MESSAGE_SEPARATOR = "\v";
ARMORY_LOOKUP_SEPARATOR = "\n";
ARMORY_LOOKUP_FIELD_SEPARATOR = "\r";
ARMORY_LOOKUP_CONTENT_SEPARATOR = "\f";
ARMORY_TOOLTIP_COLUMN_SEPARATOR = "\029";
ARMORY_TOOLTIP_TEXTURE_SEPARATOR = "\030";
ARMORY_TOOLTIP_CONTENT_SEPARATOR = "\031";

StaticPopupDialogs["ARMORY_DB_INCOMPATIBLE"] = {
    text = ARMORY_DB_INCOMPATIBLE,
    button1 = OKAY,
    showAlert = 1,
    timeout = 0,
    whileDead = 1,
}

if ( not Armory ) then
    Armory = {
        debug = false,
        messaging = true,

        title = ARMORY_TITLE,
        version = GetAddOnMetadata("Armory", "Version"),
        dbVersion = 18,
        interface = _G.GetBuildInfo(),
    };
end

local Armory = Armory;
local QTip = LibStub("LibQTip-1.0");

local iconProvider, cellPrototype, baseCellPrototype = QTip:CreateCellProvider(QTip.LabelProvider)

function cellPrototype:InitializeCell()
    baseCellPrototype.InitializeCell(self);
end

function cellPrototype:SetupCell(tooltip, value, justification, font)
    local _, height = baseCellPrototype.SetupCell(self, tooltip, format("|T%s:0|t", value), "CENTER");
    return baseCellPrototype.SetupCell(self, tooltip, format("|T%s:%d|t", value, height + 6), "CENTER");
end


function Armory:Fullname()
    --return self.title..LIGHTYELLOW_FONT_COLOR_CODE.." (v"..self.version..")"..FONT_COLOR_CODE_CLOSE;
    return self.title;
end

function Armory:PrintTitle(...)
    self:Print("["..self:Fullname().."]", ...);
end

function Armory:PrintWarning(text)
    self:PrintTitle(RED_FONT_COLOR_CODE..ARMORY_WARNING..":"..FONT_COLOR_CODE_CLOSE, text);
end

function Armory:PrintError(text)
    self:PrintTitle(RED_FONT_COLOR_CODE..ARMORY_ERROR..":"..FONT_COLOR_CODE_CLOSE, text);
end

function Armory:PrintInfo(text)
    self:PrintTitle(RED_FONT_COLOR_CODE..ARMORY_INFO..":"..FONT_COLOR_CODE_CLOSE, text);
end

function Armory:PrintRed(text)
    self:PrintTitle(RED_FONT_COLOR_CODE..text..FONT_COLOR_CODE_CLOSE);
end

function Armory:PrintDebug(...)
    if ( self.debug ) then
        self:PrintMessage(self:ToString(1, self.interface..RED_FONT_COLOR_CODE, ...), true);
    end
end

function Armory:PrintCommunication(...)
    if ( self:GetConfigShowShareMessages() ) then
        self:PrintMessage(self:ToString(1, "["..self:Fullname().."]"..LIGHTYELLOW_FONT_COLOR_CODE, ...), true);
    end
end

function Armory:PrintSearchResult(who, line)
    local windowMode = ArmoryFindFrame:IsShown() or self:GetConfigSearchWindow();
    local what, count;
    if ( windowMode ) then
        what = line.name;
    else
        what = (line.link or line.name);
    end
    if ( line.link and what ~= line.link ) then
        local color = self:GetColorFromLink(line.link);
        if ( color ) then
            what = color..what..FONT_COLOR_CODE_CLOSE;
        end
    end

    if ( windowMode ) then
        count = line.count;
        if ( count and line.extra ) then
            if ( line.extra:sub(1, 1) == "(" ) then
                count = count..line.extra;
            else
                count = count.." ("..line.extra..")";
            end
        end
        ArmoryFindFrame_Add(who, line.label, what, line.link, count);
    else
        if ( line.extra ) then
            what = what.." ("..line.extra..")";
        end
        if ( line.count ) then
            what = what.."x"..line.count;
        end
        if ( line.label ~= "" ) then
            who = strtrim(who.." "..NORMAL_FONT_COLOR_CODE..line.label..":"..FONT_COLOR_CODE_CLOSE);
        end
        if ( who ~= "" ) then
            self:Print(who, what);
        else
            self:Print(what);
        end
    end
end

function Armory:Print(...)
    self:PrintMessage(self:ToString(1, ...));
end

function Armory:PrintMessage(msg, filter)
    if ( self:HasMessageFilter() and (filter or self:GetConfigFilterAllMessages()) ) then
        ArmoryChatAddMessage(msg);
    else
        DEFAULT_CHAT_FRAME:AddMessage(msg);
    end

    if ( Elephant and Elephant.InitCustomStructure and Elephant.CaptureNewMessage ) then
        local lcname, cname = strlower(ARMORY_TITLE), ARMORY_TITLE;
        Elephant:InitCustomStructure(lcname, cname);
        Elephant:CaptureNewMessage({['type'] = "SYSTEM", ['arg1'] = msg, ['time'] = time()}, lcname);
    end
end

function Armory:ChatCommand(msg)
    local args = self:String2Table(msg);
    local printUsage =
        function(cmd)
            self:PrintTitle(ARMORY_CMD_USAGE);
            for i = 1, table.getn(self.usage) do
                if ( not cmd or cmd == ARMORY_CMD_HELP or cmd == self.usage[i][3] ) then
                    self:Print(self:GetUsageLine(i));
                end
            end
        end;

    if ( args and args[1] ) then
        local command = strlower(args[1]);
        if ( command == "debug" ) then
            Armory.debug = not Armory.debug;
            if ( AGB and args[2] and strlower(args[2]) == "agb" ) then
               AGB.debug = Armory.debug;
            end
            if ( Armory.debug ) then
                self:Print("Debug is now on");
            else
                self:Print("Debug is now off");
            end
        else
            table.remove(args, 1);
            if ( self.commands[command] ) then
                if ( self.commands[command](unpack(args)) ) then
                    printUsage(command);
                end
            else
                printUsage();
            end
        end
    else
        self:Toggle();
    end
end

function Armory:SetCommand(label, func, afterLabel)
    local command = _G[label:gsub("^(ARMORY_CMD_%u-)_.*$", "%1")];
    local help = _G[label.."_TEXT"];
    local params, options, usage, disabled, index;

    if ( label == "ARMORY_CMD_SET_NOVALUE" ) then
        params = "xxx";
    elseif ( label == "ARMORY_CMD_FIND" ) then
        local cat = {ARMORY_CMD_FIND_ALL};
        if ( self:HasInventory() ) then
            table.insert(cat, ARMORY_CMD_FIND_ITEM);
            table.insert(cat, ARMORY_CMD_FIND_INVENTORY);
        end
        if ( self:HasQuestLog() ) then
            table.insert(cat, ARMORY_CMD_FIND_QUEST);
        end
        if ( self:HasSpellBook() ) then
            table.insert(cat, ARMORY_CMD_FIND_SPELL);
        end
        if ( self:HasTradeSkills() ) then
            table.insert(cat, ARMORY_CMD_FIND_SKILL);
        end
        if ( self:HasAchievements() ) then
            table.insert(cat, ARMORY_CMD_FIND_ACHIEVEMENT);
        end
        if ( #cat == 1 ) then
            return;
        end
        params = strjoin("|", unpack(cat));
    elseif ( label == "ARMORY_CMD_CHECK" and not self:HasInventory() ) then
        return;
    elseif ( _G[label] == command ) then
        params = "";
    else
        params = _G[label] or "";
    end

    if ( self.options[label] ) then
        if ( self.options[label].disabled and self.options[label].disabled() ) then
            return;
        elseif ( self.options[label].type == "toggle" ) then
            options = ARMORY_CMD_SET_ON.."|"..ARMORY_CMD_SET_OFF;
        end
    end
    if ( _G[label.."_PARAMS_TEXT"] ) then
        options = _G[label.."_PARAMS_TEXT"];
        help = format(help, options);
    end
    if ( options and options ~= params ) then
        params = params.." "..options;
    end

    usage = SLASH_ARMORY2.." "..command;
    if ( params ~= "" ) then
        usage = usage.." "..params;
    end
    if ( afterLabel ) then
        for i = 1, table.getn(self.usage) do
            if ( self.usage[i][4] == afterLabel ) then
                index = i + 1;
                break;
            end
        end
    end

    if ( index ) then
        table.insert(self.usage, index, {usage, help, command, label});
    else
        table.insert(self.usage, {usage, help, command, label});
    end

    self.commands[command] = func;
end

function Armory:GetUsageLine(index)
    local usage = self.usage[index];
    if ( usage ) then
        return "  "..usage[1]..GRAY_FONT_COLOR_CODE.." - "..usage[2]..FONT_COLOR_CODE_CLOSE;
    end
end

function Armory:PrepareMenu()
    if ( not self.menu ) then
        self.menu = CreateFrame("Frame", "ArmoryMenu", nil, "ArmoryDropDownMenuTemplate");
        ArmoryDropDownMenu_Initialize(self.menu, self.InitializeMenu, "MENU");
    end
end

function Armory:InitializeMenu()
    if ( ARMORY_DROPDOWNMENU_MENU_LEVEL == 2 ) then
        Armory:MenuAddButton("ARMORY_CMD_SET_SHARESKILLS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHAREQUESTS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHARECHARACTER");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHAREALT");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHAREININSTANCE");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHAREINCOMBAT");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWSHAREMSG");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHAREALL", true);
        Armory:MenuAddButton("ARMORY_CMD_SET_SHAREGUILD");
        Armory:MenuAddButton("ARMORY_CMD_LOOKUP", true);
    else
        local info = {};
        info.text = ARMORY_TITLE;
        info.notClickable = 1;
        info.isTitle = 1;
        ArmoryDropDownMenu_AddButton(info);

        Armory:MenuAddButton("ARMORY_CMD_SET_SEARCHALL");
        Armory:MenuAddButton("ARMORY_CMD_SET_LASTVIEWED");
        Armory:MenuAddButton("ARMORY_CMD_SET_PERCHARACTER");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWALTEQUIP", true);
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWUNEQUIP");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWEQCTOOLTIPS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWITEMCOUNT");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWRECIPEKNOWN");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWCRAFTERS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWQUESTALTS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWACHIEVEMENTS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWGEARSETS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWGEMS");
        Armory:MenuAddButton("ARMORY_CMD_SET_SHOWSUMMARY");
        Armory:MenuAddButton("ARMORY_CMD_SET_PAUSEINCOMBAT");
        Armory:MenuAddButton("ARMORY_CMD_CONFIG", true);
        Armory:MenuAddButton("ARMORY_CMD_CHECK");
        Armory:MenuAddButton("ARMORY_CMD_FIND", true);
        Armory:MenuAddButton("ARMORY_CMD_RESET_FRAME");

        ArmoryDropDownMenu_AddButton({text=ARMORY_SHARE_LABEL, hasArrow=1});
    end
end

function Armory:MenuAddButton(label, closeMenu)
    local entry = self.options[label];
    local info = {};

    info.text = _G[label.."_MENUTEXT"];
    info.tooltipTitle = info.text;
    info.tooltipText = _G[label.."_TOOLTIP"] or self:Proper(_G[label.."_TEXT"]);
    if ( entry.type == "toggle" ) then
        info.getFunc = entry.get;
        info.setFunc = entry.set;
        info.func = function() info.setFunc(not info.getFunc()) end;
        info.checked = entry.get();
        info.keepShownOnClick = not closeMenu;
    else
        info.runFunc = entry.run;
        info.func = function() info.runFunc() end;
    end
    if ( entry.disabled ) then
        info.disabled = entry.disabled();
    end

    ArmoryDropDownMenu_AddButton(info, ARMORY_DROPDOWNMENU_MENU_LEVEL);
end

function Armory:Init()
    self.dbLoaded = false;
    self.dbLocked = false;
    self.locked = {};
    self.modulesDbEntry = nil;
    self.settingsDbEntry = nil;
    self.settingsLocalDbEntry = nil;
    self.selectedDbBaseEntry = nil;
    self.playerRealm = _G.GetRealmName();
    self.player = _G.UnitName("player");
    self.playerDbBaseEntry = nil;
    self.characterRealm = _G.GetRealmName();
    self.character = nil;
    self.selectedPet = nil;
    self.profiles = {};
    self.hasEquipment = false;
    self.hasStats = false;
    self.collapsedHeaders = {};
    self.realms = {};
    self.characters = {};
    self.qtip = QTip;
    self.qtipIconProvider = iconProvider;

    if ( not self.commandHandler ) then
        self.commandHandler = ArmoryCommandHandler:new{};
    end

    SlashCmdList["ARMORY"] = function(...)
        return self:ChatCommand(...);
    end;

    self.commands = {};
    self.usage = {
        {SLASH_ARMORY2, ARMORY_CMD_TOGGLE}
    };

    self:SetCommand("ARMORY_CMD_HELP", function() return true end);
    self:SetCommand("ARMORY_CMD_CONFIG", function() Armory:OpenConfigPanel() end);
    self:SetCommand("ARMORY_CMD_DELETE_ALL", function(...) return Armory:ClearDb(...) end);
    self:SetCommand("ARMORY_CMD_DELETE_REALM", function(...) return Armory:ClearDb(...) end);
    self:SetCommand("ARMORY_CMD_DELETE_CHAR", function(...) return Armory:ClearDb(...) end);
    --self:SetCommand("ARMORY_CMD_SET_NOVALUE");
    --self:SetCommand("ARMORY_CMD_SET_EXPDAYS", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_SEARCHALL", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_LASTVIEWED", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_PERCHARACTER", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_SHOWALTEQUIP", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_SHOWUNEQUIP", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_SHOWEQCTOOLTIPS", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_SHOWITEMCOUNT", function(...) return Armory:SetConfig(...) end);
    --self:SetCommand("ARMORY_CMD_SET_SHOWQUESTALTS", function(...) return Armory:SetConfig(...) end);
    self:SetCommand("ARMORY_CMD_RESET_FRAME", function(...) return Armory:Reset(...) end);
    self:SetCommand("ARMORY_CMD_RESET_SETTINGS", function(...) return Armory:Reset(...) end);
    self:SetCommand("ARMORY_CMD_CHECK", function(...) Armory:CheckMailItems(nil, ...) end);
    self:SetCommand("ARMORY_CMD_FIND", function(...) return Armory:Find(...) end);
    self:SetCommand("ARMORY_CMD_LOOKUP", function(...) ArmoryLookupFrame_Toggle(...) end);

    for i = 1, GetNumAddOns() do
        if ( GetAddOnInfo(i) == ARMORY_SHARE_DOWNLOAD_ADDON ) then
            self:SetCommand("ARMORY_CMD_DOWNLOAD", function(...) ArmoryLookupFrame_StartDownload(...) end);
            break;
        end
    end
end

function Armory:InitDb()
    if ( not ArmoryModules ) then
        ArmoryModules = {};
    end
    self.modulesDbEntry = ArmoryDbEntry:new(ArmoryModules);

    if ( not ArmorySettings ) then
        ArmorySettings = {};
    end
    self.settingsDbEntry = ArmoryDbEntry:new(ArmorySettings);

    if ( not ArmoryLocalSettings ) then
        ArmoryLocalSettings = {};
    end
    self.settingsLocalDbEntry = ArmoryDbEntry:new(ArmoryLocalSettings);

    if ( not (ArmoryDB and self:IsDbCompatible()) ) then
        ArmoryDB = {};
    end
    if ( not ArmoryDB[self.playerRealm] ) then
        ArmoryDB[self.playerRealm] = {};
    end
    if ( not ArmoryDB[self.playerRealm][self.player] ) then
        ArmoryDB[self.playerRealm][self.player] = {};
    end

    self.playerDbBaseEntry = ArmoryDbEntry:new(ArmoryDB[self.playerRealm][self.player]);
    self:ResetProfile();

    self.dbLoaded = true;
end

function Armory:IsDbCompatible()
    local dbEntry = self.settingsDbEntry;
    local dbVersion = dbEntry:GetValue("DbVersion");
    local upgraded, entry;

    if ( not dbVersion ) then
        -- pre version 3
        dbEntry:SetValue("DbVersion", self.dbVersion);

    elseif ( dbVersion ~= self.dbVersion) then
        -- older Armory version
        if ( dbVersion > self.dbVersion ) then
            
        -- convert from 4 to 5
        elseif ( dbVersion == 4 ) then
            local settings = {"ShareSkills", "ShareQuests", "ShareCharacter", "ShareAsAlt"};
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    for _, setting in ipairs(settings) do
                        if ( not ArmorySettings["PerCharacter"] ) then
                            ArmorySettings["PerCharacter"] = {};
                        end
                        if ( not ArmorySettings["PerCharacter"][realm] ) then
                            ArmorySettings["PerCharacter"][realm] = {};
                        end
                        if ( not ArmorySettings["PerCharacter"][realm][character] ) then
                            ArmorySettings["PerCharacter"][realm][character] = {};
                        end
                        ArmorySettings["PerCharacter"][realm][character][setting] = ArmoryDB[realm][character][setting];
                        ArmoryDB[realm][character][setting] = nil;
                    end
                end
            end

            upgraded = true;

        -- convert from 8 to 9
        elseif ( dbVersion == 8 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    entry.ActiveTalentGroup = 1;
                    if ( entry.CharacterPoints ) then
                        entry.UnspentTalentPoints = entry.CharacterPoints["1"];
                    end

                    if ( entry.Talents ) then
                        local talents = {};
                        self:CopyTable(entry.Talents, talents);
                        entry.Talents = {{}};
                        self:CopyTable(talents, entry.Talents[1]);
                    end

                    if ( entry.Glyphs ) then
                        local glyphs = {};
                        self:CopyTable(entry.Glyphs, glyphs);
                        entry.Glyphs = {{}};
                        self:CopyTable(glyphs, entry.Glyphs[1]);
                    end

                    if ( entry.Pets ) then
                        for pet in pairs(entry.Pets) do
                            entry = ArmoryDB[realm][character].Pets[pet];
                            entry.ActiveTalentGroup = 1;
                            entry.UnspentTalentPoints = entry.TalentPoints;
                            entry.TalentPoints = nil;

                            if ( entry.Talents ) then
                                local talents = {};
                                self:CopyTable(entry.Talents, talents);
                                entry.Talents = {{}};
                                self:CopyTable(talents, entry.Talents[1]);
                            end
                        end
                    end
                end
            end

            upgraded = true;

        -- convert from 9 to 10
        elseif ( dbVersion == 9 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    entry.Professions = nil;
                end
            end

            upgraded = true;

        -- convert from 10 to 11
        elseif ( dbVersion == 10 ) then
            local createInfo = function(data)
                local count = data["count"];
                local key;
                if ( count ~= nil ) then
                    data["Info"] = {};
                    data["Info"]["count"] = count;
                    data["count"] = nil;
                    for i = 1, count do
                        key = tostring(i);
                        data["Info"][key] = data[key];
                        data[key] = nil;
                    end
                end
            end
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    if ( entry.Inventory ) then
                        for _, data in pairs(entry.Inventory) do
                            createInfo(data);
                        end
                    end
                    if ( entry.Quests ) then
                        for _, data in ipairs(entry.Quests) do
                            createInfo(data);
                        end
                    end
                    if ( entry.Professions ) then
                        for profession in pairs(entry.Professions) do
                            if ( entry.Professions[profession]["SkillLines"] ) then
                                for _, data in ipairs(entry.Professions[profession]["SkillLines"]) do
                                    createInfo(data);
                                    if ( data.InvSlot ) then
                                        data.InvSlot = ArmoryDbEntry.Save(unpack(data.InvSlot));
                                    end
                                end
                            end
                        end
                    end
                    for id = 1, MAX_ARENA_TEAMS do
                        data = entry["ArenaTeam"..id];
                        if ( data ) then
                            createInfo(data);
                        end
                    end
                    if ( entry.Buffs ) then
                        for _, kind in ipairs({"HELPFUL", "HARMFUL"}) do
                            if ( entry.Buffs[kind] ) then
                                for label in pairs(entry.Buffs[kind]) do
                                    if ( label:sub(1, 7) == "Tooltip" ) then
                                        entry.Buffs[kind][label] = ArmoryDbEntry.Save(unpack(entry.Buffs[kind][label]));
                                    end
                                end
                            end
                        end
                    end
                    if ( entry.Pets ) then
                        for pet, data in pairs(entry.Pets) do
                            if ( data.Buffs ) then
                                for _, kind in ipairs({"HELPFUL", "HARMFUL"}) do
                                    if ( data.Buffs[kind] ) then
                                        for label in pairs(data.Buffs[kind]) do
                                            if ( label:sub(1, 7) == "Tooltip" ) then
                                                data.Buffs[kind][label] = ArmoryDbEntry.Save(unpack(data.Buffs[kind][label]));
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if ( entry.PawnScales ) then
                        entry.PawnScales = ArmoryDbEntry.Save(unpack(entry.PawnScales));
                    end
               end
            end

            if ( ArmorySettings.PerCharacter ) then
                for realm in pairs(ArmorySettings.PerCharacter) do
                    if ( not ArmoryDB[realm] ) then
                        ArmorySettings.PerCharacter[realm] = nil;
                    else
                        for character in pairs(ArmorySettings.PerCharacter[realm]) do
                            if ( not ArmoryDB[realm][character] ) then
                                ArmorySettings.PerCharacter[realm][character] = nil;
                            end
                        end
                    end
                end
            end

            --Armory:ConvertDb();

            upgraded = true;

        -- convert from 11 to 12
        elseif ( dbVersion == 11 ) then
            if ( dbEntry:GetValue("General", "UseValueTables") == false ) then
                self:SetConfigUseEncoding(true);
            else
                Armory:ConvertDb();
            end
            dbEntry:SetValue(2, "General", "UseValueTables", nil);

            upgraded = true;

        -- convert from 12 to 13
        elseif ( dbVersion == 12 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    entry.Quests = nil;
                end
            end

            upgraded = true;

        -- convert from 13 to 14
        elseif ( dbVersion == 13 ) then
            if ( ArmoryModules.DisableFriends ) then
                ArmoryModules.DisableSocial = true;
            end
            ArmoryModules.DisableFriends = nil;

            upgraded = true;

        -- convert from 14 to 15
        elseif ( dbVersion == 14 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    for i = 1, 19 do
                        local link = ArmoryDbEntry.Load(entry["InventoryItemLink"..i]);
                        local gemString = self:GetItemGemString(link);
                        entry["InventoryItemGems"..i] = ArmoryDbEntry.Save(gemString);
                    end
                end
            end
            
            dbEntry:SetValue(2, "General", "GearSetsColor", nil);
 
            upgraded = true;

        -- convert from 15 to 16
        elseif ( dbVersion == 15 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    if ( entry.Professions ) then
                        for profession, container in pairs(entry.Professions) do
                            if ( container.SkillLines ) then
                                for index, data in ipairs(container.SkillLines) do
                                    local _, id = self:GetLinkId(data.RecipeLink);
                                    if ( id ) then
                                        container[id] = {};
                                        container[id].RecipeLink = data.RecipeLink;
                                        container[id].Description = data.Description;
                                        container[id].Icon = data.Icon;
                                        container[id].Tools = data.Tools;
                                        container[id].ItemLink = data.ItemLink;
                                        container[id].NumMade = data.NumMade;
                                        container[id].NumReagents = data.NumReagents;
                                        container[id].Reagents = data.Reagents;
                                        container[id].Cooldown = data.Cooldown;
                                        container[id].InvSlot = data.InvSlot;
                                        
                                        container.SkillLines[index] = { Info = data.Info, Data = id };
                                    end
                                end
                            end
                        end
                    end

                    if ( entry.Quests ) then
                        for index, data in ipairs(entry.Quests) do
                            local _, id = self:GetLinkId(data.Link);
                            if ( id ) then
                                entry.Quests[id] = {};
                                entry.Quests[id].Link = data.Link;
                                entry.Quests[id].Failed = data.Failed;
                                entry.Quests[id].Text = data.Text;
                                entry.Quests[id].TimeLeft = data.TimeLeft;
                                entry.Quests[id].RequiredMoney = data.RequiredMoney;
                                entry.Quests[id].RewardMoney = data.RewardMoney;
                                entry.Quests[id].RewardHonor = data.RewardHonor;
                                entry.Quests[id].RewardSpell = data.RewardSpell;
                                entry.Quests[id].RewardTalents = data.RewardTalents;
                                entry.Quests[id].RewardXP = data.RewardXP;
                                entry.Quests[id].RewardArenaPoints = data.RewardArenaPoints;
                                entry.Quests[id].SpellLink = data.SpellLink;
                                entry.Quests[id].RewardTitle = data.RewardTitle;
                                entry.Quests[id].GroupNum = data.GroupNum;
                                entry.Quests[id].NumLeaderBoards = data.NumLeaderBoards;
                                entry.Quests[id].LeaderBoards = data.LeaderBoards;
                                entry.Quests[id].NumRewards = data.NumRewards;
                                entry.Quests[id].Rewards = data.Rewards;
                                entry.Quests[id].NumChoices = data.NumChoices;
                                entry.Quests[id].Choices = data.Choices;
                                entry.Quests[id].NumFactions = data.NumFactions;
                                entry.Quests[id].Factions = data.Factions;

                                entry.Quests[index] = { Info = data.Info, Data = id };
                            end
                        end
                    end
                end
            end
 
            upgraded = true;
            
        -- convert from 16 to 17
        elseif ( dbVersion == 16 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    if ( entry.PawnScales ) then
                        entry.PawnScales = nil;
                    end
               end
            end

            if ( ArmorySettings.PerCharacter ) then
                for realm in pairs(ArmorySettings.PerCharacter) do
                    for character in pairs(ArmorySettings.PerCharacter[realm]) do
                        ArmorySettings.PerCharacter[realm][character].AltPawnScales = nil;
                    end
                end
            end
 
            upgraded = true;
            
        -- convert from 17 to 18
        elseif ( dbVersion == 17 ) then
            for realm in pairs(ArmoryDB) do
                for character in pairs(ArmoryDB[realm]) do
                    entry = ArmoryDB[realm][character];
                    if ( entry.Inventory and entry.Inventory["Container-3"] ) then
                        local data = entry.Inventory["Container-3"];
                        local name, numSlots = ArmoryDbEntry.Load(data.Info);
                        local timestamp;
                        if ( entry.Played ) then
                            _, timestamp = ArmoryDbEntry.Load(entry.Played);
                        end
                        data.Info = ArmoryDbEntry.Save(name, numSlots, timestamp or time());
                    end
                end
            end

            dbEntry:SetValue(2, "General", "MailIgnoreMarks", nil);

            upgraded = true;

        end

        if ( upgraded ) then
            dbEntry:SetValue("DbVersion", dbVersion + 1);
            return self:IsDbCompatible();
        end

        dbEntry:SetValue("DbVersion", self.dbVersion);
        StaticPopup_Show("ARMORY_DB_INCOMPATIBLE");
        return false;
    end

    return true;
end

local function Convert(data, label)
    if ( label == ARMORY_CACHE_CONTAINER and Armory:GetConfigUseEncoding() ) then
        data[label] = nil;
    elseif ( type(data[label]) == "table" and not ArmoryDbEntry.IsNativeTable(data[label]) ) then
        for key in pairs(data[label]) do
            Convert(data[label], key);
        end
    else
        data[label] = ArmoryDbEntry.Save(ArmoryDbEntry.Load(data[label]));
    end
end

function Armory:ConvertDb()
    for realm in pairs(ArmoryDB) do
        for character in pairs(ArmoryDB[realm]) do
            for label in pairs(ArmoryDB[realm][character]) do
                Convert(ArmoryDB[realm][character], label);
            end
        end
    end
    for label in pairs(ArmorySettings) do
        Convert(ArmorySettings, label);
    end
    for label in pairs(ArmoryModules) do
        Convert(ArmoryModules, label);
    end
    if ( Armory:GetConfigUseEncoding() ) then
        ArmoryCache = nil;
    end
end

function Armory:SetConfig(what, arg1, arg2)
    local invalidCommand = false;
    local entry;

    if ( what ) then
        what = strlower(what);

        if ( what == strlower(ARMORY_CMD_SET_EXPDAYS) ) then
            entry = self.options.ARMORY_CMD_SET_EXPDAYS;
            if ( tonumber(arg1) ) then
                arg1 = tonumber(arg1);
                if ( arg1 >= entry.minValue and arg1 <= entry.maxValue ) then
                    entry.set(tonumber(arg1));
                    if ( arg1 == 0 ) then
                        arg1 = arg1.." ("..OFF..")";
                    end
                    self:Print(format(ARMORY_CMD_SET_SUCCESS, ARMORY_CMD_SET_EXPDAYS, arg1));
                else
                    self:Print(format(ARMORY_CMD_SET_EXPDAYS_INVALID, ARMORY_CMD_SET_EXPDAYS_PARAMS_TEXT, entry.maxValue));
                end
            elseif ( entry.get() == 0 ) then
                self:Print(format(ARMORY_CMD_SET_NOVALUE, "0 ("..OFF..")"));
            else
                self:Print(format(ARMORY_CMD_SET_NOVALUE, entry.get()));
            end

        else
            if ( what == strlower(ARMORY_CMD_SET_SEARCHALL) ) then
                entry = self.options.ARMORY_CMD_SET_SEARCHALL;
            elseif ( what == strlower(ARMORY_CMD_SET_LASTVIEWED) ) then
                entry = self.options.ARMORY_CMD_SET_LASTVIEWED;
            elseif ( what == strlower(ARMORY_CMD_SET_SHOWALTEQUIP) ) then
                entry = self.options.ARMORY_CMD_SET_SHOWALTEQUIP;
            elseif ( what == strlower(ARMORY_CMD_SET_SHOWUNEQUIP) ) then
                entry = self.options.ARMORY_CMD_SET_SHOWUNEQUIP;
            elseif ( what == strlower(ARMORY_CMD_SET_SHOWEQCTOOLTIPS) ) then
                entry = self.options.ARMORY_CMD_SET_SHOWEQCTOOLTIPS;
            elseif ( what == strlower(ARMORY_CMD_SET_SHOWITEMCOUNT) ) then
                entry = self.options.ARMORY_CMD_SET_SHOWITEMCOUNT;
            elseif ( what == strlower(ARMORY_CMD_SET_SHOWQUESTALTS) ) then
                entry = self.options.ARMORY_CMD_SET_SHOWQUESTALTS;
            elseif ( what == strlower(ARMORY_CMD_SET_PERCHARACTER) ) then
                entry = self.options.ARMORY_CMD_SET_PERCHARACTER;
            end

            if ( entry ) then
                invalidCommand = self:SwitchSetting(what, arg1, entry.set, entry.get);
            else
                invalidCommand = true;
            end
        end
    else
        invalidCommand = true;
    end

    return invalidCommand;
end

function Armory:SwitchSetting(what, arg1, onoffSet, onoffGet)
    local on = strlower(ARMORY_CMD_SET_ON);
    local off = strlower(ARMORY_CMD_SET_OFF);

    if ( arg1 ) then
        arg1 = strlower(arg1);
        if ( arg1 == on ) then
            onoffSet(self, true);
            self:Print(format(ARMORY_CMD_SET_SUCCESS, strlower(what), on));
        elseif ( arg1 == off ) then
            onoffSet(self, false);
            self:Print(format(ARMORY_CMD_SET_SUCCESS, strlower(what), off));
        else
            return true;
        end
    elseif ( onoffGet(self) ) then
        self:Print(format(ARMORY_CMD_SET_NOVALUE, on));
    else
        self:Print(format(ARMORY_CMD_SET_NOVALUE, off));
    end
    return false;
end

function Armory:ClearDb(what, arg1, arg2)
    local invalidCommand = false;
    local playerDeleted;

    if ( what ) then
        what = strlower(what);

        if ( ArmoryFrame:IsVisible() ) then
            self:Toggle();
        end

        self.dbLocked = true;
        if ( what == strlower(ARMORY_CMD_DELETE_ALL) ) then
            ArmoryDB = {};
            playerDeleted = true;
            self:Print(ARMORY_CMD_DELETE_ALL_MSG);
        elseif ( what == strlower(ARMORY_CMD_DELETE_REALM)  ) then
            if ( not arg1 or arg1 == "" ) then
                arg1 = self.playerRealm;
            end
            self:RealmState(arg1, nil);
            if ( ArmoryDB[arg1] ) then
                ArmoryDB[arg1] = nil;
                playerDeleted = (arg1 == self.playerRealm);
                self:Print(format(ARMORY_CMD_DELETE_REALM_MSG, arg1));
            else
                self:Print(format(ARMORY_CMD_DELETE_REALM_NOT_FOUND, arg1));
            end
        elseif ( what == strlower(ARMORY_CMD_DELETE_CHAR) ) then
            if ( not arg1 or arg1 == "" ) then
                arg1 = self.player;
            end
            if ( not arg2 or arg2 == "" ) then
                arg2 = self.playerRealm;
            end
            if ( ArmoryDB[arg2] and ArmoryDB[arg2][arg1] ) then
                self:DeleteProfile(arg2, arg1, true);
                playerDeleted = (arg1 == self.player and arg2 == self.playerRealm);
                self:Print(format(ARMORY_CMD_DELETE_CHAR_MSG, arg1, arg2));
            else
                self:Print(format(ARMORY_CMD_DELETE_CHAR_NOT_FOUND, arg1, arg2));
            end
        else
            invalidCommand = true;
        end
    else
        invalidCommand = true;
    end

    self:Init();
    self:InitDb();

    -- make sure all required values are saved once again
    if ( playerDeleted ) then
        for _, frameName in ipairs(ARMORYFRAME_SUBFRAMES) do
            local frame = _G[frameName];
            local eventHandler = frame:GetScript("OnEvent");
            if ( eventHandler ) then
                eventHandler(frame, "PLAYER_ENTERING_WORLD");
            end
        end
        for _, frameName in ipairs(ARMORYFRAME_CHILDFRAMES) do
            local frame = _G[frameName];
            local eventHandler = frame:GetScript("OnEvent");
            if ( eventHandler ) then
                eventHandler(frame, "PLAYER_ENTERING_WORLD");
            end
            _G[frameName]:Hide();
        end
    end

    return invalidCommand;
end

function Armory:Reset(what, silent)
    local invalidCommand = false;

    if ( what ) then
        what = strlower(what);

        if ( what == strlower(ARMORY_CMD_RESET_FRAME) ) then
            for _, frameName in ipairs(ARMORYFRAME_MAINFRAMES) do
                _G[frameName]:ClearAllPoints();
                _G[frameName]:SetPoint("TOPLEFT", "UIParent", "TOPLEFT", 0, -104);
            end
            self:SetConfigFrameScale(1);
            ArmoryOptionsPanelScaleSlider:SetValue(1);
            if ( not silent ) then
                self:Print(ARMORY_CMD_RESET_FRAME_SUCCESS);
            end
        elseif ( what == strlower(ARMORY_CMD_RESET_SETTINGS) ) then
            self.settingsDbEntry:Clear();
            if ( not silent ) then
                self:Print(ARMORY_CMD_RESET_SETTINGS_SUCCESS);
            end
        else
            invalidCommand = true;
        end
    else
        invalidCommand = true;
    end

    return invalidCommand;
end

function Armory:OpenConfigPanel()
    InterfaceOptionsFrame_OpenToCategory(ARMORY_TITLE);
end

function Armory:Setting(key, subkey, ...)
    local set = select("#", ...) > 0;
    if ( self.settingsDbEntry ) then
        if ( set ) then
            self.settingsDbEntry:SetValue(2, key, subkey, ...);
            if ( key ~= "General" ) then
                self:LocalSetting(key, subkey, ...);
            end
        end
        if ( key ~= "General" and self:GetConfigPerCharacter() ) then
            return self:LocalSetting(key, subkey);
        else
            return self.settingsDbEntry:GetValue(key, subkey);
        end
    end
end

function Armory:LocalSetting(key, subkey, ...)
    local set = select("#", ...) > 0;
    if ( self.settingsLocalDbEntry ) then
        if ( set ) then
            self.settingsLocalDbEntry:SetValue(2, key, subkey, ...);
        end
        return self.settingsLocalDbEntry:GetValue(key, subkey);
    end
end

function Armory:CharacterSetting(key, unit, ...)
    local set = select("#", ...) > 0;
    if ( self.settingsDbEntry ) then
        local dbEntry = self.settingsDbEntry;
        local realm = self.playerRealm;
        local character = self.player;

        if ( set ) then
            dbEntry:SetValue(4, "PerCharacter", realm, character, key, ...);
        end

        if (unit ~= "player") then
            realm, character = self:GetPaperDollLastViewed();
        end
        return dbEntry:GetValue("PerCharacter", realm, character, key);
    end
end

function Armory:ItemFilterSetting(key)
    if ( not ArmorySettings ) then
        ArmorySettings = {};
    end
    if ( not ArmorySettings.Filters ) then
        ArmorySettings.Filters = {};
    end
    if ( not ArmorySettings.Filters[key] ) then
        ArmorySettings.Filters[key] = {};
    end

    return ArmorySettings.Filters[key];
end

function Armory:CanHandleEvents()
    return self.dbLoaded and not self.dbLocked;
end

function Armory:ExecuteConditional(func, ...)
    return self.commandHandler:AddConditionalCommand(func, ...);
end

function Armory:ExecuteDelayed(delay, func, ...)
    return self.commandHandler:AddDelayedCommand(delay, func, ...);
end

function Armory:Execute(func, ...)
    return self.commandHandler:AddCommand(func, ...);
end

function Armory:IsExecuted(command)
    return not self.commandHandler:IsQueued(command);
end

function Armory:Profiles(reload)
    if ( reload ) then
        table.wipe(self.profiles);
    end

    if ( ArmoryDB and table.getn(self.profiles) == 0 ) then
        for realm in pairs(ArmoryDB) do
            for character in pairs(ArmoryDB[realm]) do
                table.insert(self.profiles, {realm=realm, character=character});
            end
        end
        table.sort(self.profiles, function(a, b) return a.realm..a.character < b.realm..b.character end);
    end

    return self.profiles;
end

local currentProfile = {};
function Armory:CurrentProfile()
    local realm, character = self:GetPaperDollLastViewed();
    currentProfile.realm = realm;
    currentProfile.character = character;
    return currentProfile;
end

function Armory:SelectProfile(profile)
    self:LoadProfile(profile.realm, profile.character);
end

function Armory:SetProfile(profile)
    self:SelectProfile(profile);
    self.LDB.icon = Armory:GetPortraitTexture("player");
    if ( self:GetConfigLDBLabel() ) then
        self.LDB.text = profile.character;
    else
        self.LDB.text = "";
    end
end

function Armory:ResetProfile()
    self.selectedDbBaseEntry = self.playerDbBaseEntry;
    self.characterRealm = self.playerRealm;
    self.character = self.player;
end

function Armory:ProfileExists(profile)
    if ( not profile.realm or not profile.character ) then
        return false;
    elseif ( not ArmoryDB[profile.realm] ) then
        return false;
    elseif ( not ArmoryDB[profile.realm][profile.character] ) then
        return false;
    end
    return true;
end

function Armory:LoadProfile(realm, character)
    realm = realm or _G.GetRealmName();
    character = character or self.player;

    self:SetPaperDollLastViewed(realm, nil);
    self:ResetProfile();

    if ( not ArmoryDB ) then
        return;
    elseif ( not ArmoryDB[realm] ) then
        return;
    elseif ( not ArmoryDB[realm][character] ) then
        return;
    end

    self:SetPaperDollLastViewed(realm, character);
    self.selectedDbBaseEntry = ArmoryDbEntry:new(ArmoryDB[realm][character]);
end

function Armory:DeleteProfile(realm, character, force)
    if ( (not force) and realm == self.playerRealm and character == self.player ) then
        return;
    elseif ( not ArmoryDB ) then
        return;
    elseif ( not ArmoryDB[realm] ) then
        return;
    elseif ( not ArmoryDB[realm][character] ) then
        return;
    end
    ArmoryDB[realm][character] = nil;
    self:ResetProfile();

    if ( realm ~= self.playerRealm and table.getn(self:CharacterList(realm)) == 0 ) then
        ArmoryDB[realm] = nil;
        self:SetPaperDollLastViewed(self.playerRealm, nil);
    else
        self:SetPaperDollLastViewed(realm, nil);
    end

    table.wipe(self.profiles);
    table.wipe(self.realms);
    table.wipe(self.characters);

    if ( not ArmorySettings["PerCharacter"] ) then
        return;
    elseif ( not ArmorySettings["PerCharacter"][realm] ) then
        return;
    end
    ArmorySettings["PerCharacter"][realm][character] = nil;
end

function Armory:IsPlayerSelected(profile)
    local realm, character;
    if ( profile ) then
        realm = profile.realm;
        character = profile.character;
    else
        realm, character = self:GetPaperDollLastViewed();
    end
    return realm == self.playerRealm and character == self.player;
end

function Armory:SelectedCharacter()
    return self.characterRealm .. self.character;
end

function Armory:IsSelectedCharacter(value)
    return value == self.characterRealm .. self.character;
end

function Armory:Toggle()
    if ( ArmoryFrame:IsVisible() ) then
        HideUIPanel(ArmoryFrame);
    else
        ShowUIPanel(ArmoryFrame);
    end
end

function Armory:RealmState(realm, collapsed)
    if ( not ArmoryLocalSettings ) then
        ArmoryLocalSettings = {};
    end
    if ( not ArmoryLocalSettings.DropDown ) then
        ArmoryLocalSettings.DropDown = {};
    end
    if ( realm ) then
        ArmoryLocalSettings.DropDown[realm] = collapsed;
    end
    return ArmoryLocalSettings.DropDown;
end

function Armory:RealmList()
    if ( ArmoryDB and table.getn(self.realms) == 0 ) then
        for realm in pairs(ArmoryDB) do
            table.insert(self.realms, realm);
        end
        table.sort(self.realms);
    end
    return self.realms or {};
end

function Armory:CharacterList(realm)
    if ( realm and ArmoryDB and ArmoryDB[realm] ) then
        if ( not self.characters[realm] ) then
            self.characters[realm] = {};
        end
        if ( table.getn(self.characters[realm]) == 0 ) then
            for char in pairs(ArmoryDB[realm]) do
                table.insert(self.characters[realm], char);
            end
            table.sort(self.characters[realm]);
        end
        return self.characters[realm];
    end
    return {};
end

local mailProfiles = {};
function Armory:CheckMailItems(mode, days)
    local maxDays = self:GetConfigExpirationDays();
    local count = 0;
    local total = 0;
    local text;

    if ( days ) then
        days = tonumber(days);
        if ( days and days > 0 ) then
            maxDays = days;
        else
            self:Print(ARMORY_CMD_CHECK_INVALID);
            return;
        end
    end

    table.wipe(mailProfiles);
    if ( maxDays > 0 and self:HasInventory() ) then
        local currentProfile = self:CurrentProfile();
        for _, profile in ipairs(self:Profiles()) do
            self:SelectProfile(profile);
            local items = self:GetExpiredMailItems(maxDays);
            if ( #items > 0 ) then
                mailProfiles[profile] = items;
                for _, item in ipairs(items) do
                    if ( not mode ) then
                        text = format(ARMORY_CHECK_MAIL_MESSAGE, profile.character, profile.realm, item.name, item.left);
                        if ( item.ignored ) then
                            text = text..NORMAL_FONT_COLOR_CODE.." ("..IGNORED..")"..FONT_COLOR_CODE_CLOSE;
                        end
                        self:PrintWarning(text);
                    end
                    if ( not item.ignored ) then
                        count = count + 1;
                    end
                    total = total + 1;
                end
            end
 
            if ( mode ~= 2 ) then
                if ( self:GetConfigMailCheckVisit() and not (self:GetConfigMailExcludeVisit() or (mode == 1 and self:GetConfigMailHideLogonVisit())) ) then
                    local _, _, _, timestamp = self:GetInventoryContainerInfo(ARMORY_MAIL_CONTAINER);
                    days = floor(time() / (24 * 60 * 60)) - floor(timestamp / (24 * 60 * 60));
                    if ( days >= 30 - maxDays ) then
                        self:PrintWarning(format(ARMORY_MAIL_VISIT_WARNING, profile.character, profile.realm, format(DAYS_ABBR, floor(days))));
                    end
                end
                
                if ( self:GetConfigMailCheckCount() and not (mode == 1 and self:GetConfigMailHideLogonCount()) ) then
                    local remaining = self:GetNumRemainingMailItems();
                    if ( remaining > 0 ) then
                        self:PrintWarning(format(ARMORY_MAIL_COUNT_WARNING2, profile.character, profile.realm, remaining));
                    end
                end
             end
        end
        self:SelectProfile(currentProfile);
        if ( total == 0 and not mode ) then
            self:PrintRed(ARMORY_CHECK_MAIL_NONE);
        end
    elseif ( not mode ) then
        self:PrintRed(ARMORY_CHECK_MAIL_DISABLED);
    end

    return count, mailProfiles;
end

function Armory:GetExpiredMailItems(maxDays)
    local _, numSlots = self:GetInventoryContainerInfo(ARMORY_MAIL_CONTAINER);
    local daysLeft, ignorable, link, name, itemId, count, ignored;
    local mailItems = {};
    if ( numSlots ) then
        for i = 1, numSlots do
            daysLeft, ignorable = self:GetContainerInboxItemDaysLeft(ARMORY_MAIL_CONTAINER, i);
            if ( daysLeft and floor(daysLeft) <= maxDays ) then
                if ( daysLeft >= 1 ) then
                    daysLeft = format(DAYS_ABBR, floor(daysLeft));
                else
                    daysLeft = SecondsToTime(floor(daysLeft * 24 * 60 * 60));
                end
                if ( daysLeft ~= "" ) then
                    link = self:GetContainerItemLink(ARMORY_MAIL_CONTAINER, i);
                    _, count = self:GetContainerItemInfo(ARMORY_MAIL_CONTAINER, i);
                    name, itemId = self:GetItemLinkInfo(link);
                    if ( self:GetConfigMailIgnoreAlts() and ignorable ) then
                        ignored = true;
                    else
                        ignored = false;
                    end
                    table.insert(mailItems, {name=name, link=link, count=count, left=daysLeft, ignored=ignored});
                end
            end
        end
    end
    return mailItems;
end

local itemCounts = {};
function Armory:GetItemCount(link)
    local currentProfile = self:CurrentProfile();

    table.wipe(itemCounts);
    if ( self:GetConfigShowItemCount() ) then
        local _, itemId = self:GetItemLinkInfo(link);
        if ( itemId and itemId:match("%d+") == "6948" ) then
            -- Hearthstone
        else
            for _, profile in ipairs(self:Profiles()) do
                self:SelectProfile(profile);
                if ( (self:GetConfigGlobalItemCount() or profile.realm == self.playerRealm) and (self:GetConfigCrossFactionItemCount() or _G.UnitFactionGroup("player") == self:UnitFactionGroup("player")) ) then
                    local mine = self:IsPlayerSelected();
                    local suspended = mine and self.commandHandler:IsPaused();
                    local name = profile.character;

                    local count, bagCount, bankCount, mailCount, auctionCount = 0, 0, 0, 0, 0;
                    local equipCount = self:GetEquipCount(link);
                    if ( self:HasInventory() ) then
                        count, bagCount, bankCount, mailCount, auctionCount = self:ScanInventory(link);
                        if ( suspended and equipCount == 0 ) then
                            name = name..RED_FONT_COLOR_CODE.." ("..ARMORY_UPDATE_SUSPENDED..")"..FONT_COLOR_CODE_CLOSE;
                        end
                    end
                    count = count + equipCount;
                    if ( count == 0 ) then
                        count = self:CountCurrency(link);
                        if ( count > 0 ) then
                            table.insert(itemCounts, {name=name, count=count, currency=true, mine=mine});
                        elseif ( suspended ) then
                            table.insert(itemCounts, {name=name, count=0});
                        end
                    else
                        table.insert(itemCounts, {name=name, count=count, bags=bagCount, bank=bankCount, mail=mailCount, auction=auctionCount, equipped=equipCount, mine=mine});
                    end
                end
            end
            self:SelectProfile(currentProfile);
        end
    end

    return itemCounts;
end

local multipleItemCounts = {};
function Armory:GetMultipleItemCount(items)
    local currentProfile = self:CurrentProfile();

    table.wipe(multipleItemCounts);

    if ( self:HasInventory() and self:GetConfigShowItemCount() ) then
        for i = 1, #items do
            multipleItemCounts[i] = {};
        end

        for _, profile in ipairs(self:Profiles()) do
            self:SelectProfile(profile);
            if ( (self:GetConfigGlobalItemCount() or profile.realm == self.playerRealm) and (self:GetConfigCrossFactionItemCount() or _G.UnitFactionGroup("player") == self:UnitFactionGroup("player")) ) then
                local result = self:ScanInventoryItems(items);
                local mine = self:IsPlayerSelected();
                local suspended = mine and self.commandHandler:IsPaused();
                local name = profile.character;
                if ( suspended ) then
                    name = name..RED_FONT_COLOR_CODE.." ("..ARMORY_UPDATE_SUSPENDED..")"..FONT_COLOR_CODE_CLOSE;
                end
                for k, v in ipairs(result) do
                    if ( v.count > 0 ) then
                        table.insert(multipleItemCounts[k], {name=name, count=v.count, bags=v.bags, bank=v.bank, mail=v.mail, auction=v.auction, mine=mine});
                    elseif ( suspended ) then
                        table.insert(multipleItemCounts[k], {name=name, count=0});
                    end
                end
            end
        end
        self:SelectProfile(currentProfile);
    end

    return multipleItemCounts;
end

local detailCounts = {};
function Armory:GetCountDetails(bagCount, bankCount, mailCount, auctionCount, altCount, guildCount, equipCount)
    local details = "";
    table.wipe(detailCounts);
    if ( (bagCount or 0) > 0 ) then
        table.insert(detailCounts, TUTORIAL_TITLE10.." "..bagCount);
    end
    if ( (bankCount or 0) > 0 ) then
        table.insert(detailCounts, ARMORY_BANK_CONTAINER_NAME.." "..bankCount);
    end
    if ( (mailCount or 0) > 0 ) then
        table.insert(detailCounts, MAIL_LABEL.." "..mailCount);
    end
    if ( (auctionCount or 0) > 0 ) then
        table.insert(detailCounts, AUCTIONS.." "..auctionCount);
    end
    if ( (altCount or 0) > 0 ) then
        table.insert(detailCounts, ARMORY_ALTS.." "..altCount);
    end
    if ( (guildCount or 0) > 0 ) then
        table.insert(detailCounts, GUILD.." "..guildCount);
    end
    if ( (equipCount or 0) > 0 ) then
        table.insert(detailCounts, ARMORY_EQUIPPED.." "..equipCount);
    end
    if ( #detailCounts > 0 ) then
        details = "("..table.concat(detailCounts, ", ")..")";
    end
    table.wipe(detailCounts);
    return details;
end

function Armory:FindSpellTexture(name)
    local spellTab, spellId;

    for spellTab = 1, _G.GetNumSpellTabs() do
        local _, _, offset, numSpells = _G.GetSpellTabInfo(spellTab);
        for spellId = 1 + offset, numSpells + offset do
            spellName = _G.GetSpellName(spellId, BOOKTYPE_SPELL);
            if ( spellName == name ) then
                return _G.GetSpellTexture(spellId, spellTab);
            end
        end
    end
end

function Armory:IsToday(time)
    return ( date("%x", time) == date("%x") );
end

function Armory:MakeDate(day, month, year, hour, minute)
    if ( day and month and year ) then
        if ( year < 2000 ) then
            year = year + 2000;
        end
        return time({year=year, month=month, day=day, hour=hour or 0, min=minute or 0});
    end
end

local weekdays = {
    WEEKDAY_SUNDAY, 
    WEEKDAY_MONDAY, 
    WEEKDAY_TUESDAY, 
    WEEKDAY_WEDNESDAY, 
    WEEKDAY_THURSDAY, 
    WEEKDAY_FRIDAY, 
    WEEKDAY_SATURDAY
};
local monthNames = {
    FULLDATE_MONTH_JANUARY,
    FULLDATE_MONTH_FEBRUARY,
    FULLDATE_MONTH_MARCH,
    FULLDATE_MONTH_APRIL,
    FULLDATE_MONTH_MAY,
    FULLDATE_MONTH_JUNE,
    FULLDATE_MONTH_JULY,
    FULLDATE_MONTH_AUGUST,
    FULLDATE_MONTH_SEPTEMBER,
    FULLDATE_MONTH_OCTOBER,
    FULLDATE_MONTH_NOVEMBER,
    FULLDATE_MONTH_DECEMBER,
};
function Armory:GetFullDate(timestamp)
    local date = type(timestamp) == "table" and timestamp or date("*t", timestamp);
    local weekdayName = weekdays[date.wday];
    local monthName = monthNames[date.month];
    return weekdayName, monthName, date.day, date.year, date.month, date.hour, date.min;
end

function Armory:MinutesTime(timestamp)
    return floor((timestamp or time()) / 60) * 60;
end

function Armory:GetServerTime()
    local _, month, day, year = CalendarGetDate();
    local hour, min = GetGameTime();
    local serverTime = self:MakeDate(day, month, year, hour, min);
    local localTime = self:MinutesTime();
    local offset = serverTime - localTime;
    local bias = mod(offset, 100);
    if ( bias == 40 ) then
        offset = offset + 60;
    elseif ( bias == -40 ) then
        offset = offset - 60;
    elseif ( bias == 60 ) then
        offset = offset - 60;
    elseif ( bias == -60 ) then
        offset = offset + 60;
    end
    return serverTime, offset;
end

function Armory:GetServerTimeAsLocalTime(timestamp)
    local serverTime, offset = self:GetServerTime();
    return (timestamp or serverTime) - offset;
end

function Armory:GetLocalTimeAsServerTime(timestamp)
    local serverTime, offset = self:GetServerTime();
    return (timestamp or time()) + offset;
end

function Armory:Round(num, idp)
    local mult = 10^(idp or 0);
    return math.floor(num * mult + 0.5) / mult;
    --return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function Armory:Join(separator, ...)
    local numArgs = select("#", ...);
    local s = "";
    local arg;

    for i = 1, numArgs do
        arg = select(i, ...);
        if ( type(arg) == "number" ) then
           s = s.."N:"..tostring(arg);
        elseif ( type(arg) == "string" ) then
           s = s.."S:"..arg;
        end
        if ( i < numArgs ) then
            s = s..separator;
        end
    end

    return s;
end

function Armory:Split(separator, s)
    return self:SplitValues(self:StringSplit(separator, s));
end

function Armory:SplitValues(value, i)
    local getValue = function(v)
        local type, value = v:match("(.):(.*)");
        if ( type == "N" ) then
            return tonumber(value);
        elseif ( type == "S" ) then
            return value;
        else
            return nil;
        end
    end

    if ( type(value) == "table" ) then
        i = i or 1;
        if ( i <= #value ) then
            return getValue(value[i]), self:SplitValues(value, i + 1);
        end
    else
        return getValue(value);
    end
end

function Armory:StringSplit(separator, value)
    local fields = {};
    gsub(value..separator, "([^"..separator.."]*)"..separator, function(v) table.insert(fields, v) end);
    return fields;
end

function Armory:CopyTable(src, dest)
    for k, v in pairs(src) do
        if ( type(v) == "table" ) then
            if ( type(dest[k]) == "table" ) then
                table.wipe(dest[k]);
            else
                dest[k] = {};
            end
            self:CopyTable(v, dest[k]);
        else
            dest[k] = v;
        end
    end
end

function Armory:FillTable(t, ...)
    local key;
    table.wipe(t);
    for i = 1, select("#", ...) do
        t[i] = select(i, ...);
    end
end

function Armory:String2Table(string, ignoreQuotes)
    if ( string ) then
        if ( not ignoreQuotes ) then
            string = string:gsub('"(.-)"', function(s) return s:gsub(" ", 0x00) end);
            string = string:gsub("'(.-)'", function(s) return s:gsub(" ", 0x00) end);
        end        
        local words = self:StringSplit(" ", strtrim(string));
        for i = #words, 1, -1 do
            if ( words[i] == "" ) then
                table.remove(words, i);
            else
                words[i] = words[i]:gsub(0x00, " ");
            end
        end
        return words;
    end
end

function Armory:ToString(start, ...)
    local string = "";
    for i = start, select("#", ...) do
        if ( type(select(i, ...)) == "table" ) then
            for _, v in ipairs(select(i, ...)) do
                string = string.." "..self:ToString(1, v);
            end
        else
            string = string.." "..tostring(select(i, ...));
        end
    end
    return string;
end

function Armory:Text2String(text, r, g, b)
    return strjoin(ARMORY_TOOLTIP_CONTENT_SEPARATOR, self:Round(r, 2), self:Round(g, 2), self:Round(b, 2), text);
end

function Armory:String2Text(s)
    return strsplit(ARMORY_TOOLTIP_CONTENT_SEPARATOR, s);
end

function Armory:GetItemLinkInfo(link)
    local itemColor, itemId, itemName;
    if ( link ) then
        itemColor, itemId, itemName = link:match("(|c%x+)|Hitem:([-%d:]+)|h%[(.-)%]|h|r");
    end
    return itemName, itemId, itemColor;
end

function Armory:GetLinkInfo(link)
    local color, kind, id, name;
    if ( link ) then
        color, kind, id, name = link:match("^(|c%x+)|H(.-):(.-)|h%[(.-)%]|h|r");
    end
    return color, kind, id, name;
end

function Armory:GetItemId(link)
    local itemId;
    if ( link ) then
        itemId = link:match("item:([-%d]+)");
    end
    return itemId;
end

function Armory:GetLinkId(link)
    local idType, id;
    if ( link ) then
        idType, id = link:match("^.-(%l+):([-%d]+)");
    end
    return idType, id;
end

function Armory:GetLink(kind, id, name, color)
    if ( kind == "item" and type(color) == "number" ) then
        _, _, _, color = GetItemQualityColor(color);
    end
    if ( kind == "achievement" ) then
        color = "|cffffff00";
    elseif ( kind == "talent" ) then
        color = "|cff4e96f7";
    elseif ( kind == "spell" ) then
        color = "|cff71d5ff";
    elseif ( kind == "trade" ) then
        color = "|cffffd000";
    elseif ( kind == "enchant" ) then
        color = "|cffffd000";
    elseif ( kind == "quest" ) then
        color = "|cffffff00";
    elseif ( kind == "glyph" ) then
        color = "|cff66bbff";
    elseif ( not color ) then
        color = "|cffffd000";
    end
    return color.."|H"..kind..":"..id.."|h["..name.."]|h|r";
end

function Armory:GetInfoFromId(idType, id)
    local name, link, fontString, color;

    if ( not (idType and id) or strlen(id) == 0 ) then
        return;
    end

    self:PrepareTooltip();
    self.tooltip:SetHyperlink(idType..":"..id);
    name = self.tooltip:GetSpell();
    if ( name ) then
        link = _G.GetSpellLink(id);
    else
        name, link = self.tooltip:GetItem();
    end
    if ( not name ) then
        for i = 1, self.tooltip:NumLines() do
            fontString = _G[self.tooltip:GetName().."TextLeft"..i];
            if ( fontString and fontString:IsShown() ) then
                name = fontString:GetText();
                color = self:HexColor(fontString:GetTextColor());
                break;
            end
        end
    end
    self:ReleaseTooltip();

    if ( name and not link ) then
        link = self:GetLink(idType, id, name, color);
    end

    return name, link;
end

function Armory:GetNameFromLink(link)
    if ( link ) then
        return link:match("|h%[(.-)%]|h|r$");
    end
end

function Armory:GetColorFromLink(link)
    if ( link ) then
        return link:match("^(|c%x+)|H");
    end
end

function Armory:GetTextFromLink(link)
    local text = "";
    if ( link ) then
        self:PrepareTooltip();
        self.tooltip:SetHyperlink(link);
        text = self:Tooltip2String(self.tooltip);
        self:ReleaseTooltip();
    end
    return text;
end

function Armory:GetReagentsFromTooltip(tooltip)
    local fontString, text, quantity, reagents;
    for i = 1, tooltip:NumLines() do
        fontString = _G[tooltip:GetName().."TextLeft"..i];
        if ( fontString and fontString:IsShown() ) then
            text = fontString:GetText();
            if ( text:match(SPELL_REAGENTS.."(.*)") ) then
                reagents = Armory:StringSplit(",", text:match(SPELL_REAGENTS.."(.*)"));
                for k, v in ipairs(reagents) do
                    v = strtrim(v);
                    if ( v:match("|c%x%x%x%x%x%x%x%x(.-)|r") ) then
                        reagents[k] = v:match("|c%x%x%x%x%x%x%x%x(.-)|r");
                    else
                        reagents[k] = v;
                    end
                    if ( reagents[k]:match("%d%)$") ) then
                        quantity = tonumber(reagents[k]:match("%((%d+)%)$"));
                        text = strtrim(reagents[k]:gsub("%(%d+%)$", ""));
                    else
                        quantity = 1;
                        text = reagents[k];
                    end
                    reagents[k] = {text, quantity};
                end
                break;
            end
        end
    end
    return reagents;
end

function Armory:GetQualityFromLink(link)
    return self:GetQualityFromColor(self:GetColorFromLink(link));
end

function Armory:GetQualityFromColor(color)
    if ( color ) then
        for i = 0, 7 do
            local _, _, _, hex = GetItemQualityColor(i);
            if color == hex then
                return i
            end
        end
    end
    return -1
end

function Armory:CanEquip(link)
    local notEquippableText = function(name)
            local fontString = _G[self.tooltip:GetName().."Text"..name];
            if ( fontString ) then
                local r, g, b = fontString:GetTextColor();
                r = self:Round(r, 1);
                g = self:Round(g, 1);
                b = self:Round(b, 1);
                if ( r == RED_FONT_COLOR.r and g == RED_FONT_COLOR.g and b == RED_FONT_COLOR.b ) then
                    return fontString:GetText();
                end
            end
            return "";
        end

    if ( link and IsEquippableItem(link) ) then
        local _, _, _, itemLevel, itemMinLevel, _, _, _, equipLoc = GetItemInfo(link);
        local slotName = ARMORY_SLOTINFO[equipLoc];
        if ( slotName ) then
            if ( itemMinLevel <= _G.UnitLevel("player") ) then
                self:PrepareTooltip();
                self.tooltip:SetHyperlink(link);
                local text;
                for i = 2, self.tooltip:NumLines() do
                    text = notEquippableText("Left"..i);
                    if ( text ~= "" and not text:match(DURABILITY_TEMPLATE) ) then
                        self:ReleaseTooltip();
                        return nil;
                    end
                    text = notEquippableText("Right"..i);
                    if ( text ~= "" ) then
                        self:ReleaseTooltip();
                        return nil;
                    end
                end
                self:ReleaseTooltip();
                return ARMORY_SLOTID[slotName], itemLevel, self:GetItemGemString(link);
            end
        end
    end
end

function Armory:Lock(semaphore)
    self.locked[semaphore] = 1;
end

function Armory:Unlock(semaphore)
    self.locked[semaphore] = nil;
end

function Armory:IsLocked(semaphore)
    return self.locked[semaphore];
end

function Armory:Proper(text)
    return text:gsub("^%l", string.upper);
end

function Armory:HexColor(r, g, b)
    if ( type(r) == "table" ) then
        if ( r.r ) then
            b = r.b;
            g = r.g;
            r = r.r;
        else
            b = r[3];
            g = r[2];
            r = r[1];
        end
    end
    return "|cff"..format("%02x%02x%02x", r*255, g*255, b*255);
end

function Armory:ClassColor(unitClass, hex)
    -- !ClassColors support
    local classColors = CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS;
    local unitColor;

    if ( unitClass and classColors and classColors[strupper(unitClass)] ) then
        unitColor = classColors[strupper(unitClass)];
    else
        unitColor = HIGHLIGHT_FONT_COLOR;
    end

    if ( hex ) then
        return self:HexColor(GetTableColor(unitColor));
    end
    return unitColor;
end


----------------------------------------------------------
-- Modules
----------------------------------------------------------

function Armory:PetsEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Pets", value);
    end
    return self:GetModule("Pets");
end

function Armory:TalentsEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Talents", value);
    end
    return self:GetModule("Talents");
end

function Armory:PVPEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("PVP", value);
    end
    return self:GetModule("PVP");
end

function Armory:ReputationEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Reputation", value);
    end
    return self:GetModule("Reputation");
end

function Armory:SkillsEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Skills", value);
    end
    return self:GetModule("Skills");
end

function Armory:RaidEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Raid", value);
    end
    return self:GetModule("Raid");
end

function Armory:CurrencyEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Currency", value);
    end
    return self:GetModule("Currency");
end

function Armory:BuffsEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Buffs", value);
    end
    return self:GetModule("Buffs");
end

function Armory:HasInventory(value)
    if ( value ~= nil ) then
        self:SetModule("Inventory", value);
    end
    return self:GetModule("Inventory");
end

function Armory:MountsEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Mounts", value);
    end
    return self:GetModule("Mounts");
end

function Armory:CompanionsEnabled(value)
    if ( value ~= nil ) then
        self:SetModule("Companions", value);
    end
    return self:GetModule("Companions");
end

function Armory:HasQuestLog(value)
    if ( value ~= nil ) then
        self:SetModule("QuestLog", value);
    end
    return self:GetModule("QuestLog");
end

function Armory:HasSpellBook(value)
    if ( value ~= nil ) then
        self:SetModule("SpellBook", value);
    end
    return self:GetModule("SpellBook");
end

function Armory:HasTradeSkills(value)
    if ( value ~= nil ) then
        self:SetModule("Professions", value);
    end
    return self:GetModule("Professions");
end

function Armory:HasAchievements(value)
    if ( value ~= nil ) then
        self:SetModule("Achievements", value);
    end
    return self:GetModule("Achievements");
end

function Armory:HasDataSharing(value)
    if ( value ~= nil ) then
        self:SetModule("DataSharing", value);
    end
    return self:GetModule("DataSharing");
end

function Armory:HasMessageFilter(value)
    if ( value ~= nil ) then
        self:SetModule("MessageFilter", value);
    end
    return self:GetModule("MessageFilter");
end

function Armory:HasSocial(value)
    if ( value ~= nil ) then
        self:SetModule("Social", value);
    end
    return self:GetModule("Social");
end

function Armory:SetModule(module, enable)
    local dbEntry = self.modulesDbEntry;

    if ( dbEntry ) then
        dbEntry:SetValue("Disable"..module, not enable);
    end
end

function Armory:GetModule(module)
    local dbEntry = self.modulesDbEntry;
    local value;

    if ( dbEntry ) then
        value = dbEntry:GetValue("Disable"..module);
    end

    return not value;
end

----------------------------------------------------------
-- General Internals
----------------------------------------------------------

function Armory:SetGetCharacterValue(key, ...)
    self:SetCharacterValue(key, ...);
    return self:GetCharacterValue(key);
end

function Armory:SetCharacterValue(key, ...)
    self.playerDbBaseEntry:SetValue(key, ...);
end

function Armory:GetCharacterValue(key, unit)
    if ( unit == "player" ) then
        return self.playerDbBaseEntry:GetValue(key);
    end
    return self.selectedDbBaseEntry:GetValue(key);
end

function Armory:ClearPets()
    local dbEntry = self.selectedDbBaseEntry;
    dbEntry:SetValue("Pets", nil);
end

function Armory:SetGetPetValue(key, ...)
    --self:PrintDebug("SetGetPetValue", _G.HasPetUI(), _G.UnitName("pet"), self:GetCurrentPet(), "=>", key, ... );
    if ( not self:PetsEnabled() ) then
        self.playerDbBaseEntry:SetValue("Pets", nil);
    elseif ( _G.HasPetUI() and self:IsPersistentPet() ) then
        local name = _G.UnitName("pet");
        local _, className = _G.UnitClass("player");
        if ( strupper(className) == "DEATHKNIGHT" ) then
            local pets = self:GetPets();
            -- death knight persistent ghoul (Master of Ghouls talent) gets renamed every time
            if ( #pets > 0 and pets[1] ~= name ) then
                self.playerDbBaseEntry:SetValue("Pets", nil);
            end
        end
        self:SetPetValue(name, key, ...);
    end
    if ( self:PetExists(self:GetCurrentPet()) ) then
        return self:GetPetValue(self:GetCurrentPet(), key);
    end
    return ...;
end

function Armory:SelectPet(baseEntry, index)
    local dbEntry = ArmoryDbEntry:new(baseEntry);
    dbEntry:SetPosition("Pets", index);
    return dbEntry;
end

function Armory:SetPetValue(index, key, ...)
    if ( index ~= UNKNOWN and not self:IsLocked("Pets") ) then
        self:SelectPet(self.playerDbBaseEntry, index):SetValue(key, ...);
    end
end

function Armory:GetPetValue(index, key)
    local dbEntry = self.selectedDbBaseEntry;

    if ( dbEntry:Contains("Pets", index, key) ) then
        return self:SelectPet(dbEntry, index):GetValue(key);
    end
end

function Armory:DeletePet(pet, unit)
    local dbEntry = self.selectedDbBaseEntry;

    if ( unit == "player" ) then
        dbEntry = self.playerDbBaseEntry;
    end

      if ( pet and dbEntry:Contains("Pets", pet) ) then
        dbEntry:SetValue(2, "Pets", pet, nil);
    end
end

function Armory:SetTimePlayed(seconds)
    if ( seconds) then
        self.playerDbBaseEntry:SetValue("Played", seconds, time());
    end
end

function Armory:GetTimePlayed(unit)
    local dbEntry = self.selectedDbBaseEntry;
    local isPlayer = self:IsPlayerSelected();
    if ( unit and unit == "player" ) then
        dbEntry = self.playerDbBaseEntry;
        isPlayer = true;
    end

    local seconds, timestamp = dbEntry:GetValue("Played");
    if ( seconds ) then
        if ( isPlayer ) then
            return seconds + (time() - timestamp), timestamp;
        else
            return seconds, timestamp;
        end
    end
end

function Armory:GetXP()
    local unit = "player";
    local exhaustionStateID, exhaustionStateName, exhaustionStateMultiplier = self:GetRestState();
    local level = self:UnitLevel(unit);
    local restTimeLeft = 0;
    local xpText, tooltipText, chatText;
    if (  level ~= MAX_PLAYER_LEVEL ) then
        if ( self:IsXPUserDisabled() ) then
            xpText = OFF;
        else
            local currXP = self:UnitXP(unit);
            local nextXP = self:UnitXPMax(unit);
            local restXP, timestamp = self:GetXPExhaustion();
            local isResting = self:IsResting();
            local percentXP = 0;

            if ( (nextXP or 0) > 0 ) then
                percentXP = ceil((currXP * 100) / nextXP);
            end
            xpText = percentXP.."%";
            if ( timestamp and (restXP or 0) > 0 ) then
                local hours;
                if ( isResting ) then
                    -- 5% of max XP is earned every 8 hours spent resting in an inn or capital city
                    hours = 8;
                else
                    -- 5% of max XP is earned every 32 hours spent resting outside
                    hours = 32;
                end
                percentXP = (restXP * 100) / nextXP;
                restTimeLeft = ceil(((150 - percentXP) / 5) * (hours * 60 * 60) - (time() - timestamp));
                percentXP = floor(percentXP + ((time() - timestamp) / (hours * 60 * 60)) * 5);
                if ( percentXP >= 150 or restTimeLeft < 0 ) then
                    percentXP = 150;
                    restTimeLeft = 0;
                end
                
                chatText = format(ARMORY_XP_SUMMARY, level, xpText, nextXP - currXP, max(0, percentXP).."%");

                if ( percentXP > 0 ) then
                    xpText = xpText.." R "..percentXP.."%";
                end

                if ( exhaustionStateID ) then
                    tooltipText = format(EXHAUST_TOOLTIP1, exhaustionStateName, exhaustionStateMultiplier * 100);
                    if ( not isResting and (exhaustionStateID == 4 or exhaustionStateID == 5) ) then
                        tooltipText = tooltipText..EXHAUST_TOOLTIP2;
                    end
                    if ( restTimeLeft > 0 ) then
                        tooltipText = tooltipText.."\n"..format(ARMORY_FULLY_RESTED, SecondsToTime(restTimeLeft, true));
                    end
                end
            end
        end
    end
    return xpText, tooltipText, chatText;
end

----------------------------------------------------------
-- Inspect internals
----------------------------------------------------------

function Armory:GetInspectDbEntry(character)
    local realm = ARMORY_LOOKUP_REALM_ALIAS;
    if ( not ArmoryDB[realm] ) then
        ArmoryDB[realm] = {};
    end
    if ( not ArmoryDB[realm][character] ) then
        ArmoryDB[realm][character] = {};
    end
    return ArmoryDbEntry:new(ArmoryDB[realm][character]);
end

function Armory:ResetInpectValues()
    table.wipe(self.realms);
    self.characters[ARMORY_LOOKUP_REALM_ALIAS] = nil;
end

function Armory:DeleteInspectDb()
    ArmoryDB[ARMORY_LOOKUP_REALM_ALIAS] = nil;
    self:ResetInpectValues();
end

function Armory:IsInspectCharacter()
    local currentRealm, currentCharacter = self:GetPaperDollLastViewed();
    if ( ArmoryDB[currentRealm] and ArmoryDB[currentRealm][currentCharacter] ) then
        return (currentRealm == ARMORY_LOOKUP_REALM_ALIAS);
    end
end

function Armory:LoadInspectProfile(character)
    self:LoadProfile(ARMORY_LOOKUP_REALM_ALIAS, character);
end

function Armory:SetInspectValue(character, key, ...)
    local dbEntry = self:GetInspectDbEntry(character);
    local name, index = key:match("^(.+)(%d+)$");
    if ( name == "Buff" ) then
        self:SetInspectBuffValue(dbEntry, "HELPFUL", index, ...);
    elseif ( name == "Debuff" ) then
        self:SetInspectBuffValue(dbEntry, "HARMFUL", index, ...);
    else
        dbEntry:SetValue(key, ...);
    end
end

function Armory:SetInspectTalentValue(character, index, key, ...)
    self:SelectTalent(self:GetInspectDbEntry(character), index, 1):SetValue(key, ...);
end

function Armory:SetInspectBuffValue(dbEntry, filter, index, ...)
    dbEntry:SetValue(3, "Buffs", filter, "Aura"..index, ...);
end

----------------------------------------------------------
-- General Hooks
----------------------------------------------------------

local Orig_PetAbandon = _G.PetAbandon;
function PetAbandon(...)
    local pet = UnitName("pet");
    Armory:Lock("Pets");
    Armory:DeletePet(pet, "player");
    Orig_PetAbandon(...);
    Armory:Unlock("Pets");
    Armory:PrintDebug("PetAbandon", pet);
end

local Orig_PetRename = _G.PetRename;
function PetRename(name, ...)
    local dbEntry = Armory.playerDbBaseEntry;
    local pet = UnitName("pet");
    Armory:Lock("Pets");
    if ( pet and dbEntry:Contains("Pets", pet) ) then
        local values = dbEntry:SelectContainer("Pets", name);
        Armory:CopyTable(dbEntry:GetValue("Pets", pet), values);
        dbEntry:SetValue(2, "Pets", pet, nil);
    end
    Orig_PetRename(name, ...);
    Armory:Unlock("Pets");
    Armory:PrintDebug("PetRename", pet, name);
end

----------------------------------------------------------
-- Find functions
----------------------------------------------------------

local searchTypes = {
    [0] = ARMORY_CMD_FIND_ALL,
    ARMORY_CMD_FIND_ITEM,
    ARMORY_CMD_FIND_QUEST,
    ARMORY_CMD_FIND_SPELL,
    ARMORY_CMD_FIND_SKILL,
    ARMORY_CMD_FIND_INVENTORY,
    ARMORY_CMD_FIND_ACHIEVEMENT
};

function Armory:FindSearchType(searchType, loose)
    if ( type(searchType) == "number" ) then
        return searchTypes[searchType];
    end
    for index = 0, #searchTypes do
        local value = searchTypes[index];
        if ( strlower(searchType) == strlower(value) ) then
            return index;
        elseif ( loose and strlower(searchType) == strlower(value:sub(1, searchType:len())) ) then
            return index;
        end
    end
end

local findResults = {};
function Armory:Find(...)
    local invalidCommand = false;
    local windowMode = ArmoryFindFrame:IsShown() or self:GetConfigSearchWindow();

    if ( select("#", ...) > 0 ) then
        local flags = {};
        local searchType = self:FindSearchType(select(1, ...), select("#", ...) > 1);
        local firstArg, where;
        if ( searchType ) then
            firstArg = 2;
            where = searchTypes[searchType];
        else
            firstArg = 1;
            where = self:GetConfigDefaultSearch();
        end
        flags[where] = 1;

        if ( select(firstArg, ...) ) then
            local currentProfile = self:CurrentProfile();
            local numRealms = table.getn(self:RealmList());
            local count = 0;

            table.wipe(findResults);

            if ( windowMode ) then
                ArmoryFindFrame_Initialize(where, strtrim(self:ToString(1, select(firstArg, ...))));
                ShowUIPanel(ArmoryFindFrame);
            end

            if ( flags[ARMORY_CMD_FIND_INVENTORY] and self:HasInventory() ) then
                count = self:FindInventory(select(firstArg, ...));
            else
                for _, profile in ipairs(self:Profiles()) do
                    if ( self:GetConfigGlobalSearch() or profile.realm == self.playerRealm ) then
                        self:SelectProfile(profile);
                        if ( (flags[ARMORY_CMD_FIND_ALL] or flags[ARMORY_CMD_FIND_ITEM]) and self:HasInventory() ) then
                            findResults[ARMORY_CMD_FIND_ITEM] = self:FindItems(select(firstArg, ...));
                        end
                        if ( (flags[ARMORY_CMD_FIND_ALL] or flags[ARMORY_CMD_FIND_QUEST]) and self:HasQuestLog() ) then
                            findResults[ARMORY_CMD_FIND_QUEST] = self:FindQuest(select(firstArg, ...));
                        end
                        if ( (flags[ARMORY_CMD_FIND_ALL] or flags[ARMORY_CMD_FIND_SPELL]) and self:HasSpellBook() ) then
                            findResults[ARMORY_CMD_FIND_SPELL] = self:FindSpells(select(firstArg, ...));
                        end
                        if ( (flags[ARMORY_CMD_FIND_ALL] or flags[ARMORY_CMD_FIND_SKILL]) and self:HasTradeSkills() ) then
                            findResults[ARMORY_CMD_FIND_SKILL] = self:FindSkill(nil, select(firstArg, ...));
                        end
                        if ( (flags[ARMORY_CMD_FIND_ALL] or flags[ARMORY_CMD_FIND_ACHIEVEMENT]) and self:HasAchievements() ) then
                            findResults[ARMORY_CMD_FIND_ACHIEVEMENT] = self:FindAchievement(select(firstArg, ...));
                        end
                        for _, list in pairs(findResults) do
                            for _, line in ipairs(list) do
                                if ( self:GetConfigGlobalSearch() and numRealms > 1 ) then
                                    self:PrintSearchResult(format("%s (%s)", profile.character, profile.realm), line);
                                else
                                    self:PrintSearchResult(profile.character, line);
                                end
                                count = count + 1;
                            end
                        end
                        table.wipe(findResults);
                     end
                end
                self:SelectProfile(currentProfile);

                if ( (flags[ARMORY_CMD_FIND_ALL] or flags[ARMORY_CMD_FIND_ITEM]) and AGB and AGB.Find ) then
                    for _, line in ipairs(AGB:Find(select(firstArg, ...))) do
                        self:PrintSearchResult(format("%s (%s)", GUILD_BANK, line.guild), line);
                        count = count + 1;
                    end
                end
            end

            if ( windowMode ) then
                ArmoryFindFrame_Finalize();
            elseif ( count == 0 ) then
                self:Print(ARMORY_CMD_FIND_NOT_FOUND);
            else
                self:Print(format(ARMORY_CMD_FIND_FOUND, count));
            end
        elseif ( windowMode ) then
            ArmoryFindFrame_Initialize(where);
            ShowUIPanel(ArmoryFindFrame);
        else
            invalidCommand = true;
        end
    elseif ( windowMode ) then
         ArmoryFindFrame_Initialize();
         ShowUIPanel(ArmoryFindFrame);
    else
        invalidCommand = true;
    end

    return invalidCommand;
end

function Armory:FindTextParts(s, ...)
    local numParts = select("#", ...);
    if ( not s or numParts == 0 ) then
        return false;
    end

    s = strlower(s);
    for i = 1, numParts do
        if ( not string.find(s, strlower(select(i, ...)), 1, true) ) then
            return false;
        end
    end
    return true;
end

function Armory:FindItems(...)
    local list = {};

    self:FindInventoryItem(list, ...);
    self:FindQuestItem(list, ...);
    self:FindSkill(list, ...);

    return list;
end

function Armory:FindSpells(...)
    local list = {};

    self:FindSpell(list, ...);
    self:FindQuestSpell(list, ...);

    return list;
end

----------------------------------------------------------
-- Header State Methods
----------------------------------------------------------

local function GetHeaderLineStateKey(self)
    if ( not self.character ) then
        return self.playerRealm .. self.player;
    end
    return self.characterRealm .. self.character;
end

function Armory:GetHeaderLineState(container, header)
    local key = GetHeaderLineStateKey(self);
    if ( self.collapsedHeaders[key] and self.collapsedHeaders[key][container] ) then
        return self.collapsedHeaders[key][container][header];
    end
end

function Armory:SetHeaderLineState(container, header, isCollapsed)
    local key = GetHeaderLineStateKey(self);
    if ( not self.collapsedHeaders[key] ) then
        self.collapsedHeaders[key] = {};
    end
    if ( not self.collapsedHeaders[key][container] ) then
        self.collapsedHeaders[key][container] = {};
    end
    self.collapsedHeaders[key][container][header] = isCollapsed;
end

----------------------------------------------------------
-- Item String Caching
----------------------------------------------------------

function Armory:GetCachedItemString(name)
    local itemString;
    if ( self:GetConfigShowItemCount() and not self:GetConfigUseEncoding() ) then
        name = strtrim(name);
        if ( name ~= UNKNOWN ) then
            if ( ArmoryCache ) then
                itemString = ArmoryCache[name];
            end
            if ( not itemString ) then
                local _, link = _G.GetItemInfo(name);
                itemString = self:SetCachedItemString(name, link);
            end
        end
    end
    return itemString;
end

function Armory:SetCachedItemString(name, link)
    local itemString;
    if ( self:GetConfigShowItemCount() and not self:GetConfigUseEncoding() ) then
        name = strtrim(name);
        if ( name ~= UNKNOWN ) then
            if ( not ArmoryCache ) then
                ArmoryCache = {};
            end

            itemString = self:GetItemString(link);
            if ( itemString ) then
                ArmoryCache[name] = itemString;
                if ( ArmoryCache[UNKNOWN] ) then
                    ArmoryCache[UNKNOWN][name] = nil;
                end
            else
                if ( not ArmoryCache[UNKNOWN] ) then
                    ArmoryCache[UNKNOWN] = {};
                end
                ArmoryCache[UNKNOWN][name] = "";
            end
        end
    else
        ArmoryCache = nil;
    end
    return itemString;
end

function Armory:CheckUnknownCacheItems(name, itemString)
    if ( itemString and ArmoryCache and ArmoryCache[UNKNOWN] ) then
        name = strtrim(name);
        if ( ArmoryCache[UNKNOWN][name] ) then
            ArmoryCache[UNKNOWN][name] = nil;
            ArmoryCache[name] = itemString;
        end
    end
end

function Armory:GetItemString(link)
    local _, itemString = self:GetItemLinkInfo(link);
    -- itemId:enchantId:jewelId1:jewelId2:jewelId3:jewelId4:suffixId:uniqueId:linkLevel
    if ( itemString ) then
        local ids = self:StringSplit(":", itemString);
        if ( #ids > 8 ) then
            for i = #ids, 8, -1 do
                table.remove(ids);
            end
            itemString = table.concat(ids, ":");
        end
    end
    return itemString;
end

local gemIds = {};
function Armory:GetItemGemString(link)  
    local _, itemString = self:GetItemLinkInfo(link);
    local gemString;
    -- itemId:enchantId:jewelId1:jewelId2:jewelId3:jewelId4:suffixId:uniqueId:linkLevel
    if ( itemString ) then
        local ids = self:StringSplit(":", itemString);
        local gemLink, hasGems;
        for i = 1, 4 do
            gemIds[i] = "0";
            if ( ids[i + 2] ~= "0" ) then
                _, gemLink = _G.GetItemGem(link, i);
                if ( gemLink ) then
                    hasGems = true;
                    gemIds[i] = self:GetItemId(gemLink);
                end
            end
        end
        if ( hasGems ) then
            gemString = table.concat(gemIds, ":");
        end
    end
    return gemString;
end

local sockets = { {}, {}, {}, {} };
function Armory:GetSocketInfo(link)
    local numGems = 0;
    if ( link ) then    
        local itemId = self:GetItemId(link);
        if ( itemId and IsEquippableItem(itemId) ) then
            self:PrepareTooltip();
            self.tooltip:SetHyperlink("item:"..itemId);

            local gemName, gemLink, icon, gemColor;
            for i = 1, 4 do
                gemName, gemLink = GetItemGem(link, i);
                icon = _G[self.tooltip:GetName().."Texture"..i];
                if ( gemLink ) then
                    _, _, _, _, _, _, gemColor = GetItemInfo(gemLink);
                else
                    gemColor = nil;
                end

                sockets[i].gem = gemName;
                sockets[i].link = gemLink;
                sockets[i].gemColor = gemColor;
                if ( icon and icon:IsShown() ) then
                    sockets[i].texture = icon:GetTexture();
                else
                    sockets[i].texture = "Interface\\ItemSocketingFrame\\UI-EmptySocket";
                end
                
                if ( gemName ) then
                    numGems = numGems + 1;
                end
            end
        
            self:ReleaseTooltip();
        end
    end
    return sockets, numGems;
end