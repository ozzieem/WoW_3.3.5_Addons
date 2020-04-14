-- $Id: Events.lua 376 2010-09-20 07:07:46Z shefki $

local _G = getfenv(0)

function TBag:VARIABLES_LOADED()
  self.Inv:init(0)
  self.Bank:init(0)
  self:RegisterEvent("BAG_UPDATE")
  self:RegisterEvent("BAG_UPDATE_COOLDOWN")
  self:RegisterEvent("ITEM_LOCK_CHANGED")
  self:RegisterEvent("UNIT_INVENTORY_CHANGED")
  self:RegisterEvent("PLAYER_LEAVING_WORLD")
  self:RegisterEvent("MAIL_INBOX_UPDATE")
  self:RegisterEvent("TRADE_SKILL_SHOW")
  self:RegisterEvent("AUCTION_HOUSE_SHOW")
  self:RegisterEvent("MAIL_SHOW")
  self:RegisterEvent("MERCHANT_SHOW")
  self:RegisterEvent("BANKFRAME_OPENED")
  self:RegisterEvent("BANKFRAME_CLOSED")
  self:RegisterEvent("PLAYERBANKSLOTS_CHANGED")
  self:RegisterEvent("PLAYERBANKBAGSLOTS_CHANGED")
  self:RegisterEvent("PLAYER_LEVEL_UP")
  self:RegisterEvent("SKILL_LINES_CHANGED")
  self:RegisterEvent("QUEST_ACCEPTED")
  self:RegisterEvent("UNIT_QUEST_LOG_CHANGED")

  -- Scan equipment on login.
  TBag:ScanEquipped()
  TBagInfo[TBag.PLAYERID][TBag.G_BASIC][TBag.S_LEVEL] = UnitLevel("player")
  TBagInfo[TBag.PLAYERID][TBag.G_BASIC][TBag.S_FACTION] = UnitFactionGroup("player")
end

function TBag:SKILL_LINES_CHANGED()
  TBag.Professions:ScanAllTradeRanks()
end

function TBag:BAG_UPDATE(event, bag)
  local frame, stack
  if bag then
    if TBag:Member(TInvFrame.bags, bag) then
      frame = TInvFrame
      stack = self.STACK_INV
    elseif TBag:Member(TBnkFrame.bags, bag) then
      frame = TBnkFrame
      stack = self.STACK_BNK
    end
  end

  if not frame then return end

  if not self:IsStacking(stack) and frame.cfg.stack_auto == 1 and self:IsLive(frame) then
    frame.cfg.stack_once = 1
  end

  frame:UpdateWindow()
end

function TBag:BAG_UPDATE_COOLDOWN(event, bag)
  -- If we're given an argument check if it's a inventory bag and ignore the event
  -- if it isn't.  If not argument is passed we have to update the window
  -- regardless.  /sigh
  if not bag then
    TInvFrame:UpdateWindow()
    TBnkFrame:UpdateWindow()
  else
    if TBag:Member(TInvFrame.bags, bag) then
      TInvFrame:UpdateWindow()
    elseif TBag:Member(TBnkFrame.bags, bag) then
      TBnkFrame:UpdateWindow()
    end
  end
end

function TBag:ITEM_LOCK_CHANGED(event, bag, slot)
  if bag and slot and type(slot) == "number" then
    TBag.ItemButton.UpdateLock(_G[TBag:GetBagItemButtonName(bag,slot)])
  end
end

function TBag:UIFRAME_SHOW()
  TInvFrame:Show()
end

function TBag:PLAYER_LEAVING_WORLD()
  TBagInfo[TBag.PLAYERID][TBag.G_BASIC][TBag.S_HEARTH] = GetBindLocation()
  TBagInfo[TBag.PLAYERID][TBag.G_BASIC][TBag.S_LEVEL] = UnitLevel("player")
end

function TBag:BANKFRAME_OPENED()
  TBnkFrame.atbank = 1
  TBnkFrame:Show()
end

function TBag:BANKFRAME_CLOSED()
  TBnkFrame.atbank = 0
  TBnkFrame:Hide()
end

function TBag:PLAYERBANKSLOTS_CHANGED()
  TBnkFrame:UpdateWindow()
end

function TBag:PLAYERBANKBAGSLOTS_CHANGED()
  TBnkFrame:UpdateWindow(TBag.REQ_MUST)
end

function TBag:PLAYER_LEVEL_UP(event, level)
  TBagInfo[TBag.PLAYERID][TBag.G_BASIC][TBag.S_LEVEL] = level
end

function TBag:QUEST_ACCEPTED()
      TInvFrame:UpdateWindow()
end

function TBag:UNIT_QUEST_LOG_CHANGED(event, unit)
      if unit == "player" then
              TInvFrame:UpdateWindow()
      end
end
 


local events = {
  ["VARIABLES_LOADED"] = TBag.VARIABLES_LOADED,
  ["BAG_UPDATE"] = TBag.BAG_UPDATE,
  ["BAG_UPDATE_COOLDOWN"] = TBag.BAG_UPDATE_COOLDOWN,
  ["ITEM_LOCK_CHANGED"] = TBag.ITEM_LOCK_CHANGED,
  ["AUCTION_HOUSE_SHOW"] = TBag.UIFRAME_SHOW,
  ["MAIL_SHOW"] = TBag.UIFRAME_SHOW,
  ["MERCHANT_SHOW"] = TBag.UIFRAME_SHOW,
  ["TRADE_SKILL_SHOW"] = TBag.Professions.ScanRecipes,
  ["UNIT_INVENTORY_CHANGED"] = TBag.ScanEquipped,
  ["MAIL_INBOX_UPDATE"] = TBag.ScanMail,
  ["PLAYER_LEAVING_WORLD"] = TBag.PLAYER_LEAVING_WORLD,
  ["BANKFRAME_OPENED"] = TBag.BANKFRAME_OPENED,
  ["BANKFRAME_CLOSED"] = TBag.BANKFRAME_CLOSED,
  ["PLAYERBANKSLOTS_CHANGED"] = TBag.PLAYERBANKSLOTS_CHANGED,
  ["PLAYERBANKBAGSLOTS_CHANGED"] = TBag.PLAYERBANKBAGSLOTS_CHANGED,
  ["PLAYER_LEVEL_UP"] = TBag.PLAYER_LEVEL_UP,
  ["SKILL_LINES_CHANGED"] = TBag.SKILL_LINES_CHANGED,
  ["QUEST_ACCEPTED"] = TBag.QUEST_ACCEPTED,
  ["UNIT_QUEST_LOG_CHANGED"] = TBag.UNIT_QUEST_LOG_CHANGED,
}

function TBag:OnEvent(event, ...)
--  TBag:Print("OnEvent: "..event)
  if events[event] then
    events[event](TBag,event, ...)
  end
end

TBag:SetScript("OnEvent",TBag.OnEvent)
TBag:SetScript("OnUpdate",TBag.OnUpdate)
