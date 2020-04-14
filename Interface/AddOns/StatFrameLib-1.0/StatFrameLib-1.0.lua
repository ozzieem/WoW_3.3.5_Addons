--[[
Name: StatFrameLib-1.0
Revision: $Rev: 40 $
Developed by: Aliset (statframelib@fake.domain.name)
Inspired By: TankPoints by Whitetooth@Cenarius (hotdogee@bahamut.twbbs.org) and AceHook-2.1
Documentation: http://www.wowace.com/wiki/StatFrameLib-1.0
SVN: http://svn.wowace.com/root/trunk/StatFrameLib-1.0
Description: Mixin to allow for easily and safely adding stat frames (like Melee/Ranged/Spell Damage/etc)
Dependencies: AceLibrary, AceOO-2.0, AceHook-2.1
License: LGPL v2.1 or later

Copyright (C) 2007 Alan Shields <statframelib@fake.domain.name>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
--]]

--Future Feature: rapid-redraw optimization

local MAJOR_VERSION = "StatFrameLib-1.0"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 40 $"):match("(%d+)"))

if not AceLibrary then error(MAJOR_VERSION.." requires AceLibrary.") end
if not AceLibrary:IsNewVersion(MAJOR_VERSION, MINOR_VERSION) then return end
if not AceLibrary:HasInstance("AceOO-2.0") then error(MAJOR_VERSION.." requires AceOO-2.0") end
if not AceLibrary:HasInstance("AceHook-2.1") then error(MAJOR_VERSION.." requires AceHook-2.1") end


local AceOO = AceLibrary:GetInstance("AceOO-2.0")
local AceHook = AceLibrary:GetInstance("AceHook-2.1")
local StatFrameLib = AceOO.Mixin {
   "AddStatFrame",
   "RemoveStatFrame",
   "RemoveAllStatFrames",
   "StatFrameReport",
   "IsShowingStatFrame",
   "RepaintStatFrame",
   "RepaintAllStatFrames",
   "StatBoxSet",
   "StatBoxSetWithoutShow",
}

-- local declarations
local frame_index_from_name, frame_label_from_name, frame_name_from_index
local paintLeftStatFrame, paintRightStatFrame, repaintTooltips
local setupLeftStatFrame, setupRightStatFrame
local default_mouseovers, slurpDefaultEventHooks, setDefaultEventHooks
local UpdatePaperdollStatsHook, activate

local StatFrameLeft, StatFrameRight
local stat_frame_left_default_hooks,stat_frame_right_default_hooks
local setBlizEventHooks

-- indexes => frame_name
-- names => labels
local frame_indexes,frame_names
--#NODOC local
function frame_index_from_name(name)
   return "ACESTATFRAME_"..string.upper(name)
end
--#NODOC local
function frame_label_from_name(name)
   return frame_labels[self][name]
end
--#NODOC local
function frame_name_from_index(index)
   return frame_name[self][index]
end


--[[-------------------------------------------
  Public methods
--]]

--[[-------------------------------------------
-- Notes:
--         * Adds a stat frame to the dropdown list.
--         * Should be added on enable, not on load - frames will be dropped on suspend
--         * You MUST have a method for painting the frame. This will be a method
--           on your object named Paint[frame name]. So if you called AddStatFrame("Peter")
--           then it would be :PaintPeter. See the example.
--         * You MAY have a method for setting up custom mouseovers and such for the lines.
--           This method will be called SetupFrame[frame name] like the above. See the example.
--         * If you just want tooltips, create methods like Paint[frame name]Line1Tooltip.
--           GameTooltip anchor will be set up for you, just go ahead and write to it.
--           This will not work if you do a custom SetupFrame. See the example for more.
-- Arguments:
--         string - name of the frame to add. This is the programmatic name, not the label.
--         string - label for the frame.
--]]
function StatFrameLib:AddStatFrame(frame_name,frame_label)
   local frame_index = frame_index_from_name(frame_name)

   for _,v in ipairs(PLAYERSTAT_DROPDOWN_OPTIONS) do
      if v == frame_index then
         error(string.format("Attempted to doubly add stat frame %s",frame_name))
      end
   end

   tinsert(PLAYERSTAT_DROPDOWN_OPTIONS,frame_index)
   _G[frame_index] = frame_label

   frame_names[self][frame_name] = frame_label
   frame_indexes[self][frame_index] = frame_name

   local paint_method = self["Paint"..frame_name]
   if not paint_method then
      error(self.format("Cannot add stat frame %s: paint method %s does not exist!",frame_name,paint_method))
   end
end

--[[-------------------------------------------
-- Arguments:
--         string - programmatic name of the frame to remove
-- Notes:
--         * Not necessary to call this method on disable - will automatically be called.
--]]
function StatFrameLib:RemoveStatFrame(frame_name)
   local frame_index = frame_index_from_name(frame_name)
   local removed = false
   for k,v in ipairs(PLAYERSTAT_DROPDOWN_OPTIONS) do
      if v == frame_index then
         removed = true
         tremove(PLAYERSTAT_DROPDOWN_OPTIONS,k)
      end
   end
   if not removed then
      error("Attempted to remove non-existant StatFrame %s",frame_name);
   end

   -- cleanup after ourselves
   if GetCVar("playerStatLeftDropdown") == frame_index then
      SetCVar("playerStatLeftDropdown", "PLAYERSTAT_BASE_STATS")
   end
   if GetCVar("playerStatRightDropdown") == frame_index then
      local _,class = UnitClass("player")
      if "MAGE" == class or "PRIEST" == class or "WARLOCK" == class or "DRUID" == class then
         SetCVar("playerStatRightDropdown", "PLAYERSTAT_SPELL_COMBAT")
      elseif "HUNTER" == class then
         SetCVar("playerStatRightDropdown", "PLAYERSTAT_RANGED_COMBAT")
      else
         SetCVar("playerStatRightDropdown", "PLAYERSTAT_MELEE_COMBAT")
      end
   end
   UIDropDownMenu_SetSelectedValue(PlayerStatFrameLeftDropDown, GetCVar("playerStatLeftDropdown"))
   UIDropDownMenu_SetSelectedValue(PlayerStatFrameRightDropDown, GetCVar("playerStatRightDropdown"))
   PaperDollFrame_UpdateStats()

   frame_names[self][frame_name] = nil
   frame_indexes[self][frame_index] = nil
end

--[[-------------------------------------------
-- Notes:
--         * Removes all of your stat frames
--]]
function StatFrameLib:RemoveAllStatFrames()
   DEFAULT_CHAT_FRAME:AddMessage("removing all frames")
   for frame_name,_ in pairs(frame_names[self]) do
      self:RemoveStatFrame(frame_name)
   end
end

--[[-------------------------------------------
-- Notes:
--         * Lets you know if your stat frame is being displayed
-- Arguments:
--         string - name of the frame you're querying
--]]
function StatFrameLib:IsShowingStatFrame(frame_name)
   local index = frame_index_from_name(frame_name)
   if not index then
      error("Frame %s does not exist", frame_name)
   end

   if GetCVar("playerStatRightDropdown") == index or
      GetCVar("playerStatLeftDropdown")  == index then
      return true
   else
      return false
   end
end

--[[-------------------------------------------
-- Notes:
--          * Method you call to actually set the label and text for lines in the StatBox
--          * labels and values will be coerced to strings, so don't worry too much about them
--          * Will automatically show the line. Use the variant call if you don't want to do that.
--          * See the example for how this is used
-- Arguments:
--         object - the line you're drawing to
--         string - the label
--         string or number - the value
--         boolean - if the VALUE is a number show it as a percentage
--]]
function StatFrameLib:StatBoxSet(statbox, label, value, percentage)
   if type(value) ~= "number" then
      value = tostring(value)
   end
   PaperDollFrame_SetLabelAndText(statbox, tostring(label), value, percentage)
   statbox:Show()
end

--[[-------------------------------------------
-- Notes:
--         * Same call as StatBoxSet, but does not automatically show the line
-- Arguments:
--         object - the line you're drawing to
--         string - the label
--         string or number - the value
--         boolean - if the VALUE is a number show it as a percentage
--]]
function StatFrameLib:StatBoxSetWithoutShow(statbox,label,value,percentage)
   if type(value) ~= "number" then
      value = tostring(value)
   end
   PaperDollFrame_SetLabelAndText(statbox,tostring(label),value,percentage)
end

--[[-------------------------------------------
-- Notes:
--         * Orders a repaint of your stat frame
-- Arguments:
--         string - the programmatic name of the frame
--]]
function StatFrameLib:RepaintStatFrame(frame_name)
   local index = frame_index_from_name(frame_name)
   local painter = self["Paint"..frame_name]
   if not index then
      error("Stat frame %s does not exist",frame_name)
   end
   if GetCVar("playerStatRightDropdown") == index then
      paintRightStatFrame(painter, self)
      repaintTooltips("PlayerStatFrameRight", StatFrameRight)
   end
   if GetCVar("playerStatLeftDropdown") == index then
      paintLeftStatFrame(painter, self)
      repaintTooltips("PlayerStatFrameLeft", StatFrameLeft)
   end
end

--[[-------------------------------------------
-- Notes:
--         * Repaints all of your stat frames
--]]
-- TankPoints:RepaintStatFrame("TankPoints")
function StatFrameLib:RepaintAllStatFrames()
   for frame_name, _ in pairs(frame_names[self]) do
      self:RepaintStatFrame(frame_name)
   end
end
--[[-------------------------------------------
  Private Methods
--]]

StatFrameLeft = {
   _G["PlayerStatFrameLeft1"],
   _G["PlayerStatFrameLeft2"],
   _G["PlayerStatFrameLeft3"],
   _G["PlayerStatFrameLeft4"],
   _G["PlayerStatFrameLeft5"],
   _G["PlayerStatFrameLeft6"]
}
StatFrameRight = {
   _G["PlayerStatFrameRight1"],
   _G["PlayerStatFrameRight2"],
   _G["PlayerStatFrameRight3"],
   _G["PlayerStatFrameRight4"],
   _G["PlayerStatFrameRight5"],
   _G["PlayerStatFrameRight6"]
}

--#NODOC local
function paintLeftStatFrame(painter,obj)
   for _,line in ipairs(StatFrameLeft) do
      line:Hide()
   end
   painter(obj,StatFrameLeft[1],StatFrameLeft[2],StatFrameLeft[3],
               StatFrameLeft[4],StatFrameLeft[5],StatFrameLeft[6])
end
--#NODOC local
function paintRightStatFrame(painter, obj)
   for _, line in ipairs(StatFrameRight) do
      line:Hide()
   end
   painter(obj,StatFrameRight[1],StatFrameRight[2],StatFrameRight[3],
               StatFrameRight[4],StatFrameRight[5],StatFrameRight[6])
end
--#NODOC local
function repaintTooltips(frame,framelist)
   for _,line in ipairs(framelist) do
      if GameTooltip:IsOwned(line) then
         line:GetScript("OnEnter")(frame)
      end
   end
end
--#NODOC local
function setupLeftStatFrame(frame_setup,obj,frame_name)
   frame_setup(obj,StatFrameLeft[1],StatFrameLeft[2],StatFrameLeft[3],
                   StatFrameLeft[4],StatFrameLeft[5],StatFrameLeft[6],
                frame_name)
end
--#NODOC local
function setupRightStatFrame(frame_setup,obj,frame_name)
   frame_setup(obj,StatFrameRight[1],StatFrameRight[2],StatFrameRight[3],
                   StatFrameRight[4],StatFrameRight[5],StatFrameRight[6],
                frame_name)
end
--#NODOC local
function default_mouseovers(obj,line1,line2,line3,line4,line5,line6,frame_name)
   local painter = function(line)
                      local p = obj["Paint"..frame_name.."Line"..tostring(line).."Tooltip"]
                      if p then
                         return function(frame,_)
                                   GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
                                   p(obj)
                                   GameTooltip:Show()
                                end
                      else
                         return nil
                      end
                   end
   line1:SetScript("OnEnter",painter(1))
   line2:SetScript("OnEnter",painter(2))
   line3:SetScript("OnEnter",painter(3))
   line4:SetScript("OnEnter",painter(4))
   line5:SetScript("OnEnter",painter(5))
   line6:SetScript("OnEnter",painter(6))
end

--#NODOC local
function slurpDefaultEventHooks()
   local events = {"OnEnter","OnLeave","OnMouseUp","OnMouseDown"}
   stat_frame_left_default_hooks = {}
   for _, line in ipairs(StatFrameLeft) do
      local line_hooks = {}
      for _, event in ipairs(events) do
         line_hooks[event] = line:GetScript(event)
      end
      tinsert(stat_frame_left_default_hooks,line_hooks)
   end
   stat_frame_right_default_hooks = {}
   for _, line in ipairs(StatFrameRight) do
      local line_hooks = {}
      for _, event in ipairs(events) do
         line_hooks[event] = line:GetScript(event)
      end
      tinsert(stat_frame_right_default_hooks,line_hooks)
   end
end
--#NODOC local
-- this sets things back to Bliz-ish
function setDefaultEventHooks(frame,defaults,index)
   for i,line in ipairs(frame) do
      for event,func in pairs(defaults[i]) do
         line:SetScript(event,func)
      end
   end
   setBlizEventHooks(frame,index)
end

--#NODOC local
-- this is a copy of what PaperDollFrame.lua:function UpdatePaperdollStats
-- using ONLY the SetScript commands
function setBlizEventHooks(frame, index)
   local stat1,stat2,stat3,stat4,stat5,stat6 = unpack(frame)

   -- reset any OnEnter scripts that may have been changed
   stat1:SetScript("OnEnter", PaperDollStatTooltip);
   stat2:SetScript("OnEnter", PaperDollStatTooltip);
   stat4:SetScript("OnEnter", PaperDollStatTooltip);

   if ( index == "PLAYERSTAT_BASE_STATS" ) then
   elseif ( index == "PLAYERSTAT_MELEE_COMBAT" ) then
      stat1:SetScript("OnEnter", CharacterDamageFrame_OnEnter);
   elseif ( index == "PLAYERSTAT_RANGED_COMBAT" ) then
      stat1:SetScript("OnEnter", CharacterRangedDamageFrame_OnEnter);
   elseif ( index == "PLAYERSTAT_SPELL_COMBAT" ) then
      stat1:SetScript("OnEnter", CharacterSpellBonusDamage_OnEnter);
      stat4:SetScript("OnEnter", CharacterSpellCritChance_OnEnter);
   elseif ( index == "PLAYERSTAT_DEFENSES" ) then
   end
end

--#NODOC local
function UpdatePaperdollStatsHook(frame, index)
   local custom_paint = false
   for obj, frames in pairs(frame_indexes) do
      for frame_index,frame_name in pairs(frames) do
         if index == frame_index then
            custom_paint = true
            if "PlayerStatFrameLeft" == frame then
               frame_setup = obj["SetupFrame"..frame_name]
               if frame_setup then
                  setupLeftStatFrame(frame_setup,obj)
               else
                  setupLeftStatFrame(default_mouseovers,obj,frame_name)
               end
               paintLeftStatFrame(obj["Paint"..frame_name],obj)
            elseif "PlayerStatFrameRight" == frame then
               frame_setup = obj["SetupFrame"..frame_name]
               if frame_setup then
                  setupRightStatFrame(frame_setup,obj)
               else
                  setupRightStatFrame(default_mouseovers,obj,frame_name)
               end
               paintRightStatFrame(obj["Paint"..frame_name],obj)
            else
               error("Unknown frame to paint: %s",frame)
            end
         end
      end
   end
   if not custom_paint then
      if "PlayerStatFrameLeft" == frame then
         setDefaultEventHooks(StatFrameLeft,stat_frame_left_default_hooks,index)
      elseif "PlayerStatFrameRight" == frame then
         setDefaultEventHooks(StatFrameRight,stat_frame_right_default_hooks,index)
      end -- we don't know what to do with it so just leave it alone
   end
end

--[[--------------------------------------------
  Load/unload and debug help
--]]

--#NODOC
function StatFrameLib:StatFrameReport()
   self:Print("List of stat frames added:")
   if not next(frame_names[self]) then
      self:Print("No stat frames have been added")
   end

   for index,name in pairs(frame_indexes[self]) do
      self:Print(string.format('"%s" - "%s" (index: %s)', name, frame_names[self][name], index))
   end
end

--#NODOC
function StatFrameLib:OnInstanceInit(object)
   -- make sure AceHook is initialized before us
   -- it should be safe to call this multiple times
   AceHook:OnInstanceInit(object)

   if not frame_names[object] then
      frame_names[object] = {}
   end
   if not frame_indexes[object] then
      frame_indexes[object] = {}
   end

   object:SecureHook("UpdatePaperdollStats",UpdatePaperdollStatsHook)
end

--#NODOC
function StatFrameLib:OnEmbedDisable(object)
   -- OnEmbedDisable needs to be in the StatFrameLib table, but it isn't
   -- called in relation to the table. Odd, but there you are.
   object:RemoveAllStatFrames()
end

-------------------------------
--#NODOC local
function activate(self, oldLib, oldDeactivate)
   StatFrameLib = self

   self.frame_names = oldLib and oldLib.frame_names or {}
   self.frame_indexes = oldLib and oldLib.frame_indexes or {}

   frame_names = self.frame_names
   frame_indexes = self.frame_indexes

   slurpDefaultEventHooks()
   self:activate(oldLib, oldDeactivate)
   if oldDeactivate then
      oldDeactivate(oldLib)
   end
end

AceLibrary:Register(StatFrameLib, MAJOR_VERSION, MINOR_VERSION, activate)


--[[----------------------------------------
Example:

MyMod = AceLibrary("AceAddon-2.0"):new("AceHook-2.1","StatFrameLib-1.0")

function MyMod:OnEnable()
   self:AddStatFrame("OverNine","Over 9,000")
   self:AddStatFrame("LolCats","Kittens!")
end

function MyMod:PaintOverNine(line1,line2,line3,line4,line5,line6)
   self:StatBoxSet(line1,"How High","Over 9,000!")
end

function MyMod:PaintOverNineLine1Tooltip()
   GameTooltip:SetText("ZOMG!",HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
   GameTooltip:AddLine("It's over 9,000!", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
end

function MyMod:PaintLolCats(line1,line2,line3,line4,line5,line6)
   self:StatBoxSet(line1,"Oh Noes?","yes")
   self:StatBoxSet(line2,"Caturdayness",30,true)
   self:StatBoxSet(line3,"Invisible Bikes",1)
end

function MyMod:SetupFrameLolCats(line1,line2,line3,line4,line5,line6)
   line1:SetScript("OnEnter", MyMod:OhNoesFrame_OnEnter)
   -- lexical closures let you keep variables! Mooray!
   line2:SetScript("OnEnter", function (frame,motion) MyMod:InvisibleBikeFrame_OnEnter(frame,motion,line2) end)
   line2:SetScript("OnLeave", function (frame,motion) MyMod:InvisibleBikeFrame_OnLeave(frame,motion,line,) end)
end

function MyMod:OhNoesFrame_OnEnter(frame,motion)
   -- because you're not using the default tooltip events, you have to set your frame owner and do Show at the end
   GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
   GameTooltip:SetText("They be takin my buckit!", HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
   GameTooltip:Show()
end

function MyMod:InvisibleBikeFrame_OnEnter(frame, motion, line)
   line:SetTextColor(GREEN_FONT_COLOR.r, GREEN_FONT_COLOR.g, GREEN_FONT_COLOR.b)
end
function MyMod:InvisibleBikeFrame_OnLeave(frame, motion, line)
   line:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
end

--]]----------------------------------------