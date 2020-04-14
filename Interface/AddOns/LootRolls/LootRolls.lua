LootRolls = LibStub("AceAddon-3.0"):NewAddon("LootRolls","AceConsole-3.0", "AceEvent-3.0");

BINDING_HEADER_LOOTROLLS = "Loot Rolls"
BINDING_NAME_LOOTROLLS_SHOW = "Show Loot Rolls Window"
BINDING_NAME_LOOTROLLS_HIDE = "Hide Loot Rolls Window"
BINDING_NAME_LOOTROLLS_TOGGLE = "Toggle Loot Rolls Window"


local LSM = LibStub("LibSharedMedia-3.0",true)
if (not AceGUIWidgetLSMlists) then LSM=nil; end -- don't use LSM without the gui for selecting
local lTEXTURES = {
      need = {
      	   up = "Interface\\BUTTONS\\UI-GroupLoot-Dice-Up",
      	   down = "Interface\\BUTTONS\\UI-GroupLoot-Dice-Down",
      	   highlight = "Interface\\BUTTONS\\UI-GroupLoot-Dice-Highlight",
      },
      greed = {
      	   up = "Interface\\BUTTONS\\UI-GroupLoot-Coin-Up",
      	   down = "Interface\\BUTTONS\\UI-GroupLoot-Coin-Down",
      	   highlight = "Interface\\BUTTONS\\UI-GroupLoot-Coin-Highlight",
      },
      disenchant = {
      	   up = "Interface\\BUTTONS\\UI-GroupLoot-DE-Up",
      	   down = "Interface\\BUTTONS\\UI-GroupLoot-DE-Down",
      	   highlight = "Interface\\BUTTONS\\UI-GroupLoot-DE-Highlight",
      },
      pass = {
      	   up = "Interface\\BUTTONS\\UI-GroupLoot-Pass-Up",
      	   down = "Interface\\BUTTONS\\UI-GroupLoot-Pass-Down",
      	   highlight = "Interface\\BUTTONS\\UI-GroupLoot-Pass-Highlight",
      },
}
local lACTIONS = {
      need = 1,
      greed = 2,
      disenchant =3,
      pass = 4,
      pending = 5,
}
local lROLLTRANSLATION = {
      need = 1,
      greed = 2,
      disenchant =3,
      pass = 0,
}

local options = {
      type = 'group',
      args = {
      	main = {
		type = 'group',
		childGroups = 'tab',
		order = 1,
		args = {
		     details = {
	    	     	     order=99,
	    	    	     type = 'description',
		    	     name = 'Go to the key bindings option (hit escape) to set bindings for this mod.  Type /lr help for command line options',
	        	     },
		     label = {
		     	   name = " Version " .. GetAddOnMetadata("LootRolls","version"),
			   type = "description",
			   order = 1,
			   },
		     params = {
			type = 'group',
			name = 'Global Settings',
			inline = true,
			order = 10,
			args = {
			     skipconfirm = {
      	      		     	    name = 'Skip Confirmation Popup',
	      			    desc = 'Remove the confirmation window for BoP items',
	      			    type = 'toggle',
	      			    handler = LootRolls, -- should become self
	      			    get = "GetConfigValue",
	      			    set = "SetConfigValue",
				},
			     popup = {
      	      		     	    name = 'Popup Loot Window',
	      			    desc = 'Popup the loot window on new rolls',
	      			    type = 'toggle',
	      			    handler = LootRolls, -- should become self
	      			    get = "GetConfigValue",
	      			    set = "SetConfigValue",
				},
			     hidebliz = {
      	      		     	    name = 'Hide Blizzard Rolls',
	      			    desc = 'Hide the Blizzard Loot Popups',
	      			    type = 'toggle',
	      			    handler = LootRolls, -- should become self
	      			    get = "GetConfigValue",
	      			    set = "SetConfigValue",
				},
			     fontsize = {
      	      		     	      name = 'Font Size',
	      			      desc = 'Font Sizefor strings',
	      			      type = 'range',
	      			      min = 10,
	      			      max = 30,
	      			      step = 1,
	      			      handler = LootRolls, -- should become self
	      			      get = "GetConfigValue",
	      			      set = "SetConfigValue",
				},
			     fadeout = {
			     	     name = 'Fadeout',
				     desc = 'Fade window this long after the last roll ends (0 to disable)',
				     type = 'range',
				     min = 0,
				     max = 60,
				     step = 1,
				     handler = LootRolls,
				     get = "GetConfigValue",
				     set = "SetConfigValue",
				},
			},
		     },
		},
	    },
	},
}
if (LSM) then
     options.args.main.args.params.args.background = {
      	      name = 'Background',
	      desc = 'Background to use for the main frame',
	      type = 'select',
	      dialogControl = 'LSM30_Background',
	      values = AceGUIWidgetLSMlists.background,
	      handler = LootRolls, -- should become self
	      get = "GetConfigValue",
	      set = "SetConfigValue",
      }
     options.args.main.args.params.args.border = {
      	      name = 'Border',
	      desc = 'Border for the main frame',
	      type = 'select',
	      dialogControl = 'LSM30_Border',
	      values = AceGUIWidgetLSMlists.border,
	      handler = LootRolls, -- should become self
	      get = "GetConfigValue",
	      set = "SetConfigValue",
      }
     options.args.main.args.params.args.lootbackground = {
      	      name = 'Loot Window Background',
	      desc = 'Background to use for the loot rolls frame',
	      type = 'select',
	      dialogControl = 'LSM30_Background',
	      values = AceGUIWidgetLSMlists.background,
	      handler = LootRolls, -- should become self
	      get = "GetConfigValue",
	      set = "SetConfigValue",
      }
     options.args.main.args.params.args.lootborder = {
      	      name = 'Loot Window Border',
	      desc = 'Border for the loot rolls frame',
	      type = 'select',
	      dialogControl = 'LSM30_Border',
	      values = AceGUIWidgetLSMlists.border,
	      handler = LootRolls, -- should become self
	      get = "GetConfigValue",
	      set = "SetConfigValue",
      }
     options.args.main.args.params.args.font = {
      	      name = 'Font',
	      desc = 'Font for strings',
	      type = 'select',
	      dialogControl = 'LSM30_Font',
	      values = AceGUIWidgetLSMlists.font,
	      handler = LootRolls, -- should become self
	      get = "GetConfigValue",
	      set = "SetConfigValue",
      }
end


local DEFAULTS = {
      main = {
      	   width = 300,
	   height = 300,
	   ["rect"] = {
			"CENTER",
			nil,
			"CENTER",
			0,
			0,
	   },
      },
      params = {
      	     fadeout = 30,
      	     popup=true,
      	     hidebliz = true,
      	     fontsize = 15,
	     lootFrameHeight = 60,
	     skipconfirm = false,
	     ["lootborder"] = "Blizzard Dialog",
	     ["lootbackground"] = "Blizzard Tabard Background",
	     ["background"] = "Blizzard Parchment",
	     ["border"] = "Blizzard Achievement Wood",
      },
}
function LootRolls:GetVersion()
	local ver = GetAddOnMetadata("LootRolls","version");
	if (ver) then return "v" .. ver; else return ""; end;
end

function LootRolls:OnInitialize()
	self.defaults = {
	      profile = {
	      	      LootRolls = { },
	      }
	}
	self.db = LibStub("AceDB-3.0"):New("LootRollsData", self.defaults,"global");
	options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("LootRolls", options.args.main)
	LibStub("AceConfigRegistry-3.0"):RegisterOptionsTable("LootRolls Profile",options.args.profile)
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("LootRolls","LootRolls")
	self.profileFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("LootRolls Profile","Profile","LootRolls")
	self.db.RegisterCallback(self, 'OnNewProfile', 'OnProfileReset')
	self.db.RegisterCallback(self, 'OnProfileChanged', 'OnProfileReset')
	self.db.RegisterCallback(self, 'OnProfileCopied', 'OnProfileReset')
	self.db.RegisterCallback(self, 'OnProfileReset', 'OnProfileReset')
	self.db.RegisterCallback(self, 'OnProfileDeleted', 'OnProfileReset')

	self:RegisterChatCommand("LootRolls","ChatCommand")
	self:RegisterChatCommand("lr","ChatCommand")
	local ver = self:GetVersion()
	if (ver) then
	   self:Print("LootRolls " .. ver .. " Initialized")
	else
	   self:Print("LootRolls Initialized")
	end
end 

function LootRolls:GetConfigValue(info)
	 -- this is so broken - I need a string, not a number
	 local frame = info[#info-1]
	 local name = info[#info]
	 local tmp = self:GetValue(frame,name)
	 if (info.type=='input') then 
	    return tostring(tmp)
	 else
	    return tmp;
	 end
end
function LootRolls:SetConfigValue(info,value)
	 local frame = info[#info-1]
	 local name = info[#info]
	 -- special checks
	 if (name == "innPercent" and (tonumber(value) > 1 or tonumber(value) < 0)) then 
	    return
	 end
	 self:SetValue(frame,name,value)
	 -- next line can skip in some cases but not right now
	 if (name=='background' or name =='border') then
	    self:UpdateMainLootFrameBackdrop()
	 end
	 if (name=='lootbackground' or name =='lootborder') then
	    self:UpdateAllLootFrames()
	 end
	 if (name=='font' or name=='fontsize') then -- update all
--	    self:UpdateMainLootFrameBackdrop()
	    self:UpdateAllLootFrames()
	 end
	 if (name=='hidebliz') then
	    self:ShowHideBlizFrames()
	 end
	 if (name=='skipconfirm') then
	    self:ShowHideConfirmFrame()
	 end
end

function LootRolls:OnProfileReset()
	 self:LoadProfile()
end

function LootRolls:ApplySettings()
	 self:LoadProfile()
end

function LootRolls:Show()
	 if (not self.data or not self.data.lootFrame) then
	    self:CreateMainLootFrame()
	 end
	 self.data.lootFrame:SetAlpha(1)
	 self.data.lootFrame:Show()
	 self:CancelFade()
end

function LootRolls:Hide()
	 if (self.data and self.data.lootFrame) then
	    self.data.lootFrame:Hide()
	    self.data.fadeAt = 0
	    self.data.lootFrame:SetScript("OnUpdate",nil)
	 end
end

function LootRolls:ToggleWin()
       if (self.data and self.data.lootFrame and self.data.lootFrame:IsShown()) then
       	  self:Hide();
       else
	  self:Show();
       end
end

function LootRolls:ChatCommand(input)
    if (not input or input:trim()=="") then
       InterfaceOptionsFrame_OpenToCategory(self.optionsFrame)
       return
    end
    input=input:trim()
    if (input=="show") then
       self:Show();
    elseif (input=="hide") then
       self:Hide();
    elseif (input=="win") then
       self:ToggleWin()
    else
       self:Print("Valid Commands")
       self:Print("Hide: Hide the window")
       self:Print("Show: Show the window")
       self:Print("Win:  Toggle the window")
       self:Print("<blank>: Open the config pane")
    end
end

function LootRolls:GetMembers(oTable)
	 if (not oTable or type(oTable) ~= 'table') then
	    return 0
	 end
	 local ret = 0
	 for k,v in pairs(oTable) do
	     ret = ret + 1
	 end
	 return ret
end

function LootRolls:GetRollNumbers(oRoll)
	 if (not oRoll) then return; end
	 local need = self:GetMembers(oRoll.need)
	 local greed = self:GetMembers(oRoll.greed)
	 local disenchant = self:GetMembers(oRoll.disenchant)
	 local pass = self:GetMembers(oRoll.pass)
	 local pending = self:GetMembers(oRoll.pending)
	 return need,greed,disenchant,pass,pending
end

function LootRolls:GetValue(frame,name,noProfile)
	 if (not self.db.profile.LootRolls) then self.db.profile.LootRolls = {}; end;
	 if (frame) then
	 	 if ((not noProfile) and self.db.profile.LootRolls[frame] and self.db.profile.LootRolls[frame][name] ~= nil) then
	 	    return self.db.profile.LootRolls[frame][name]
		 end
	 	 return DEFAULTS[frame][name]	 
	 end
	 return nil
end
function LootRolls:SetValue(frame,name,value)
	 if (not self.db.profile.LootRolls) then self.db.profile.LootRolls = {}; end;
	 if (frame) then
	    if (not self.db.profile.LootRolls[frame]) then self.db.profile.LootRolls[frame] = {}; end
	    self.db.profile.LootRolls[frame][name] = value;
	 end
	 return value
end

function LootRolls:Reset()
	 self.data = {}
end


function LootRolls:ShowHideBlizFrames()
	 if (not self.data) then self.data = {}; end
	 for i=1,4 do
	     if (self:GetValue("params","hidebliz")) then
	     	_G["GroupLootFrame"..i]:SetScript("OnShow",function(self) self:Hide(); end)
	     else
	     	_G["GroupLootFrame"..i]:SetScript("OnShow",GroupLootFrame_OnShow)
	     end
	 end
end

function LootRolls:ShowHideConfirmFrame()
	 if (not self.data) then self.data = {}; end
	 if (self:GetValue("params","skipconfirm")) then
	    UIParent:UnregisterEvent("CONFIRM_LOOT_ROLL")
	    UIParent:UnregisterEvent("CONFIRM_DISENCHANT_ROLL")
	 else
	    UIParent:RegisterEvent("CONFIRM_LOOT_ROLL")
	    UIParent:RegisterEvent("CONFIRM_DISENCHANT_ROLL")
	 end
end

function LootRolls:SetFrameState(oRoll)
	 if (not oRoll) then return; end
	 -- check if the player has rolled
	 -- and check time remaining
	 
	 if (oRoll.playerRolled and oRoll.oLoot) then
	    oRoll.oLoot.frame.clickFrame:Hide()
	 end
	 if (oRoll.winner) then
	    self:CloseRoll(oRoll,winner)
	 end
end

function LootRolls:LoadProfile()
	 self:Reset();
	 self:ShowHideBlizFrames()
	 self:ShowHideConfirmFrame()
	 if (self.db.profile.rolls) then
	    local order = {}
	    for k,_ in pairs(self.db.profile.rolls or {}) do
	    	tinsert(order,k)
	    end
	    table.sort(order)
	    for i=1,#self.db.profile.rolls do
	    	local oRoll = self.db.profile.loots[i]
		oRoll.oLoot = nil
		self:CreateLootFrame(oRoll)
		self:SetFrameState(oRoll)
	    end
	 end
	 -- probably not the right place for this.. but
end

function LootRolls:OnEnable()
	 self:LoadProfile()
	 self:RegisterEvent("START_LOOT_ROLL") -- roll to track
	 self:RegisterEvent("CANCEL_LOOT_ROLL") -- self cancel
	 self:RegisterEvent("CHAT_MSG_LOOT") -- ucch. localization
	 self:RegisterEvent("CONFIRM_LOOT_ROLL")
	 self:RegisterEvent("CONFIRM_DISENCHANT_ROLL","CONFIRM_LOOT_ROLL")
	 self:RegisterEvent("MODIFIER_STATE_CHANGED")
	 GameTooltip:HookScript("OnTooltipSetItem",function () self:TooltipChanged(); end)	 
end

function LootRolls:MODIFIER_STATE_CHANGED(event,key,state)
	 if (state and self.data.lootFrame and self.data.lootFrame:IsMouseOver()) then 
	    for k,v in pairs(self.data.loots) do
	    	if (v.frame.pictureFrame:IsMouseOver() or v.frame.linkFrame:IsMouseOver()) then
		   self:ShowTooltip(v.frame)
		end
	    end
	 end
end

function LootRolls:CONFIRM_LOOT_ROLL(event,id,rolltype)
	 if (self:GetValue("params","skipconfirm")) then
	    ConfirmLootRoll(id,rolltype)
	 end
end

function LootRolls:GetActionColor(action)
	 if (action=="need") then
	    return 0,1,0
	 elseif (action=="disenchant") then
	    return .6,.6,0
	 elseif (action=="greed") then
	    return .6,.6,0
	 else
	    return .5,.5,.5
	 end
end
function LootRolls:GetActionName(action)
	 if (not action) then return action; end
	 return string.upper(action:sub(1,1)) .. action:sub(2)
end
function LootRolls:GetNameColor(oRoll,player)
	 if (oRoll and oRoll.winner and oRoll.winner==player) then
	    return 0,1,0
	 end
	 return nil,nil,nil
end

function LootRolls:AddTooltipLines(oRoll,action,tip)
	 local r,g,b = self:GetActionColor(action)
	 local actionName = self:GetActionName(action)
	 if (not tip) then 
	    tip = GameTooltip;
	 end
	 for name,result in pairs(oRoll[action] or {}) do
	     local nameR,nameG,nameB = self:GetNameColor(oRoll,name)
	     local resString = actionName
	     if (result > 0 ) then
	     	resString = resString .. " (" .. result .. ")"
	     end
	     tip:AddDoubleLine(name,resString,nameR,nameG,nameB,r,g,b)
	 end
end

function LootRolls:TooltipChanged()
	 local tip = GameTooltip;
	 local name,link = tip:GetItem()
	 if (not name and not link) then return; end
	 local oRoll = self:FindRollByLink(link)
	 if (not oRoll) then return; end
	 tip:AddLine("")
	 tip:AddLine("Need/Greed/DE Results:")
	 if (oRoll.stop) then
	    if (oRoll.winner) then
	       tip:AddLine("Won by " .. oRoll.winner,0,.8,0)
	    else
	       tip:AddLine("Everyone Passed",.8,.8,0)
	    end
	 else
	    tip:AddLine("Roll in progress",.8,.8,.2)
	 end
	 self:AddTooltipLines(oRoll,"need",tip)
	 self:AddTooltipLines(oRoll,"greed",tip)
	 self:AddTooltipLines(oRoll,"disenchant",tip)
	 self:AddTooltipLines(oRoll,"pass",tip)
	 self:AddTooltipLines(oRoll,"pending",tip)
end

function LootRolls:START_LOOT_ROLL(event,rollID,rollTime)
	 -- make a new entry
	 local link = GetLootRollItemLink(rollID)
--	 self:Print("Now tracking " .. rollID .. " for " .. link)
	 self:CreateRoll(rollID,link)
end

function LootRolls:CANCEL_LOOT_ROLL(event,rollID)
--	 self:Print("Loot roll cancelled " .. rollID)
	 if (not self.data.rolls) then return; end
	 local oRoll = self.data.rolls[rollID]
	 if (not oRoll or not oRoll.oLoot) then 
	    return
	 end
	 oRoll.oLoot.frame.clickFrame:Hide()
end
function LootRolls:CHAT_MSG_LOOT(event,msg)
	 if (not msg) then return; end
	 -- has or have depending if its you our not (You have) vs (Joe has)
	 local player, action, link = msg:match("^(.+) ha[sve]+ selected (%w+) for: (.+)$");
	 if (player and action and link) then
	    if (player=="You") then player=UnitName("player"); end
	    local oRoll = self:FindRollByLink(link,true)
	    if (not oRoll) then
--	       self:Print(link .. " has no roll associated with it")
	       return
	    end
	    self:AddAction(oRoll,player,action)
	    return
	 end

--[04:33:52] Procsleep automatically passed on: [Surgeon's Needle] because he cannot loot that item.


	 -- and I hope noone every makes a character named "Everyone"
	 -- this also matches the next pattern so must come first

	 -- and I hope noone every makes a character named "Everyone"
	 local link = msg:match("^Everyone passed on: (.+)$")
	 if (link) then
	    local oRoll = self:FindRollByLink(link,true)
	    if (not oRoll) then
--	       self:Print(link .. " has no roll associated with it")
	       return
	    end
	    self:CloseRoll(oRoll,nil)
	    return
	 end
	 local player,link = msg:match("^(.+) passed on: (.+)$")
	 if (player and link) then
	    if (player=="You") then player=UnitName("player"); end
	    local oRoll = self:FindRollByLink(link,true)
	    if (not oRoll) then
--	       self:Print(link .. " has no roll associated with it")
	       return
	    end
	    self:AddAction(oRoll,player,"pass")
	    return
	 end
	 local action,roll,link,player = msg:match("^(%w+) Roll %- (%d+) for (.+) by (.+)$")
	 if (action and roll and link and player) then
	    -- I don't think this one can be "You" but being consistant
	    if (player=="You") then player=UnitName("player"); end
	    local oRoll = self:FindRollByLink(link,true)
	    if (not oRoll) then
--	       self:Print(link .. " has no roll associated with it")
	       return
	    end
	    self:AddRoll(oRoll,player,action,tonumber(roll))
	    return
	 end
	 local player,link = msg:match("^(.+) won: (.+)$")
	 if (player and link) then
	    if (player=="You") then player=UnitName("player"); end
	    local oRoll = self:FindRollByLink(link,true)
	    if (not oRoll) then
--	       self:Print(link .. " has no roll associated with it")
	       return
	    end
	    self:CloseRoll(oRoll,player)
	    return
	 end
end

function LootRolls:AddAction(oRoll,player,action)
	 if (not oRoll or not player or not action) then return; end
	 action = action:lower()
	 oRoll[action][player] = 0;
	 oRoll.all[player] = action
	 oRoll.pending[player] = nil;
	 -- update
	 if (oRoll.oLoot) then
	    local rolledFrameNames = {"need","greed","disenchant","pass","pending"}
	    local need,greed,disenchant,pass,pending = self:GetRollNumbers(oRoll)
	    local rollNumbers = {
	    	  need = need,
	      	  greed = greed,
	      	  disenchant = disenchant,
	      	  pass = pass,
	      	  pending = pending
            }
	    for _,name in pairs(rolledFrameNames) do
	    	local index = lACTIONS[name]
		oRoll.oLoot.frame.rolledFrames[index].bottom.string:SetText(rollNumbers[name])
	    end
	    if (UnitName("player")==player) then
	       oRoll.playerRolled = true
	    end
	 end
end
function LootRolls:AddRoll(oRoll,player,action,roll)
	 if (not oRoll or not player or not action or roll==nil) then return; end
--	 self:Print("Player " .. player .. " rolled " .. roll .. " as " .. action .. " for " .. oRoll.id)
	 action = action:lower()
	 oRoll[action][player] = roll;
end
function LootRolls:CloseRoll(oRoll,player)
	 if (not oRoll) then return; end
	 if (not player) then player = "no one"; end
--	 self:Print("Closing roll for " .. oRoll.id .. ". Winner: " .. player)
	 oRoll.winner = player;
	 oRoll.oLoot.frame.clickFrame:Hide()
	 oRoll.oLoot.frame.rolledFrames[#oRoll.oLoot.frame.rolledFrames]:SetPoint("RIGHT",oRoll.oLoot.frame.winFrame,"LEFT")
	 oRoll.oLoot.frame.winFrame:Show()
	 oRoll.oLoot.frame.winFrame.winString:SetText(player)
	 oRoll.oLoot.frame:SetAlpha(.7)
	 oRoll.oLoot.frame.pictureFrame:SetAlpha(.6)
	 oRoll.stop = GetTime()
	 if (self.data.activeRolls) then
	    self.data.activeRolls = self.data.activeRolls - 1
	    if (self.data.activeRolls==0) then
	       self:ScheduleFade()
	    end
	 end
end

function LootRolls:DumpRoll(oRoll)
	 if (not oRoll) then return; end
	 for name,action in pairs(oRoll.all) do
	     self:Print(string.format("%10s: %s",name,action))
	 end
end
function LootRolls:DumpLink(link)
	 if (not link) then return; end
	 local oRoll = self:FindRollByLink(link)
	 if (not oRoll) then
	    self:Print("No roll for " .. link)
	 else
	    self:DumpRoll(oRoll)
	 end
end

function LootRolls:CreateRoll(rollID,link)
	 if (not self.data) then self.data ={}; end
	 if (not self.data.rolls) then self.data.rolls = {}; end
	 if (self.data.rolls[rollID]) then
	    self:Print("Warning: Roll ID: " .. rollID .. " already exists")
	 end
	 link = link or GetLootRollItemLink(rollID)
	 if (not link) then 
	    return
	 end
	 local oRoll = {
	       id = rollID,
	       link = link,
	       pending = {},
	       need = {},
	       greed = {},
	       disenchant = {},
	       pass = {},
	       all = {},
	       start = GetTime(),
	 }
--	 local texture, name, count, quality, bindOnPickUp, canNeed, canGreed, canDisenchant = GetLootRollItemInfo(self.rollID);
	 local _,_,_,_,bop, canNeed, canGreed, canDisenchant = GetLootRollItemInfo(rollID);
	 oRoll.bop = bop
	 oRoll.allowed = {
	 	       need = canNeed,
		       greed = canGreed,
		       disenchant = canDisenchant,
		       pass = true,
	 }

	 -- how do I find everyone in the group?  
	 -- more important - how can I find people eligible?. skip this for now
	 if (UnitInRaid("player")) then
	    for i=1,GetNumRaidMembers() do
	    	local name = GetRaidRosterInfo(i)
		if (name) then
	    	   oRoll.all[name] = 'pending'
		   oRoll.pending[name] = 1
		end
	    end
	 else
	    for i=1,GetNumPartyMembers() do
	    	local name = UnitName("party"..i)
		if (name) then
	    	   oRoll.all[name] = 'pending'
		   oRoll.pending[name] = 0
		end
	    end
	    local name = UnitName("player")
	    oRoll.all[name] = 'pending'
	    oRoll.pending[name] = 0
	 end
	 self.data.rolls[rollID] = oRoll;
	 self:CreateLootFrame(oRoll)
	 if (not self.data.activeRolls) then 
	    self.data.activeRolls = 1;
	 else
	    self.data.activeRolls = self.data.activeRolls + 1
	 end
	 if (self:GetValue("params","popup")) then
	    self:Show()
	 end
	 self:CancelFade() -- new item appeared so stop fading
end

function LootRolls:FindRollByLink(link,bActive)
	 if (not link) then return nil; end
	 for _,oRoll in pairs(self.data.rolls or {}) do
	     if (oRoll.link == link) then
	     	if (not bActive or not oRoll.stop) then return oRoll; end
	     end
	 end
	 return nil;
end

function LootRolls:OnDisable()
	 self:Reset()
	 -- i really need to do more here
end

function LootRolls:UpdateMainLootFrameBackdrop()
	 if (not self.data and self.data.lootFrame) then return; end
	 local background = nil;
	 if (LSM) then
	    background = LSM:Fetch("background",self:GetValue("params","background"))
	 end
	 if (not background) then
	    background = "Interface\\Tooltips\\UI-Tooltip-Background"
	 end
	 local border = nil;
	 if (LSM) then
	    border = LSM:Fetch("border",self:GetValue("params","border"))
	 end
	 if (not border) then
	    border = "Interface\\Tooltips\\UI-Tooltip-Border"
	 end
	 -- texture test
--	 if (not self.data.lootFrame.textureTest) then
--	    self.data.lootFrame.textureTest=self.data.lootFrame:CreateTexture()
--	 end
--	 self.data.lootFrame.textureTest:SetTexture(background)
--	 self:Print(self.data.lootFrame.textureTest:GetSize())	 
--	 self.data.lootFrame.textureTest:SetTexture(border)
--	 self:Print(self.data.lootFrame.textureTest:GetSize())	 
	 self.data.lootFrame:SetBackdrop({
	   bgFile= background,
	   edgeFile= border,
	   tile=0, tileSize=10, edgeSize=32, 
	   insets={left=8, right=8, top=8, bottom=8}
	 });
end

function LootRolls:UpdateMainLootFrameSizeAndPosition()
	 if (not self.data or not self.data.lootFrame) then return; end	 
	 self.data.width  = self:GetValue("main","width")
	 self.data.height = self:GetValue("main","height")
	 local rect = self:GetValue("main","rect")
	 self.data.lootFrame:SetPoint(rect[1],rect[2],rect[3],rect[4],rect[5])
         self.data.lootFrame:SetWidth(self.data.width)
         self.data.lootFrame:SetHeight(self.data.height)
	 -- iterate through children frames here
	 self:UpdateAllLootFrames()
end

function LootRolls:UpdateMainLootFrame()
	 self:UpdateMainLootFrameBackdrop()
	 self:UpdateMainLootFrameSizeAndPosition()
end

function LootRolls:GetTemplateSizeFrame()
	 if (not self.data.templateSizeFrame) then 
	    self.data.templateSizeFrame = CreateFrame("Frame");
	 end
	 return self.data.templateSizeFrame
end

function LootRolls:GetTemplateSize(template)
	 if (true) then return; end
	 if (not template) then return nil; end
	 local frame = self:GetTemplateSizeFrame()
	 frame:SetTexture(template)
	 local x,y = frame:GetSize()
	 self:Print(x .. "," .. y)
	 return x,y
end

-- now need fancy stuff for custom lootframe!
function LootRolls:CreateMainLootFrame()

	 self.data.lootFrame = CreateFrame("Frame",nil,UIParent)
	 self.data.lootFrame:SetMovable(true)
	 self.data.lootFrame:SetResizable(true)
	 self.data.lootFrame:EnableMouse(true)
	 self.data.lootFrame:SetScript("OnMouseDown",function() self:StartMovingMain(); end)
	 self.data.lootFrame:SetScript("OnMouseUp",function() self:StopMovingMain(); end)
	 local resizeFrame = CreateFrame("Frame",nil,self.data.lootFrame)
	 self.data.lootFrame.resizeFrame = resizeFrame
	 resizeFrame:SetWidth(10)
	 resizeFrame:SetHeight(10)
	 resizeFrame:SetPoint("BOTTOMRIGHT");
	 resizeFrame:EnableMouse(true)
	 resizeFrame:SetScript("OnMouseDown",function() self.data.lootFrame:StartSizing(); end)
	 resizeFrame:SetScript("OnMouseUp",function() self:StopMovingMain(); end)

	 
	 local scrollFrame = CreateFrame("ScrollFrame","LootRollsScrollFrame",self.data.lootFrame,"UIPanelScrollFrameTemplate")
	 self.data.lootFrame.scrollFrame = scrollFrame
--	 local scale = UIParent:GetEffectiveScale() 
--	 scrollFrame:SetPoint("TOPLEFT",32*scale,-32*scale)
--	 scrollFrame:SetPoint("BOTTOMRIGHT",-40*scale,32*scale)
	 scrollFrame:SetPoint("TOPLEFT",0,-8)
	 scrollFrame:SetPoint("BOTTOMRIGHT",-32,8)

	 self.data.lootFrame.body = CreateFrame("Frame",nil,self.data.lootFrame.scrollFrame)
	 scrollFrame:SetScrollChild(self.data.lootFrame.body)
	 scrollFrame:SetScript("OnSizeChanged", function(...) self:OnScrollFrameSizeChanged(...); end)
	 -- the body frame needs absolute dimensions. renachoring it does bad stuff

	 self:UpdateMainLootFrame()
end

function LootRolls:OnScrollFrameSizeChanged(frame,width,height)
	 if (not self.data or not self.data.lootFrame or not self.data.lootFrame.scrollFrame or not self.data.lootFrame.body) then 
	    return
	 end
	 local width = self.data.lootFrame.scrollFrame:GetWidth()
	 self.data.lootFrame.body:SetWidth(width)
	 self:UpdateScrollData()
end

function LootRolls:StartMovingMain()
	 if (self.data.lootFrame) then 
	    self.data.lootFrame:StartMoving()
	 end
end
function LootRolls:StopMovingMain()
	 if (self.data.lootFrame) then 
	    self.data.lootFrame:StopMovingOrSizing()
	    local width = self.data.lootFrame:GetWidth();
	    local height = self.data.lootFrame:GetHeight();
	    if (width < 0) then width = -width; end
	    if (height < 0) then height = -height; end
	    if (width > 50 and height > 50) then
	       local point, relativeTo, relativePoint, offsetX, offsetY = self.data.lootFrame:GetPoint(1)
	       self:SetValue("main","width",width)
	       self:SetValue("main","height",height)
	       self:SetValue("main","rect",{point,relativeTo,relativePoint,offsetX,offsetY});
	       self.data.width = self.data.lootFrame:GetWidth()
	       self.data.height = self.data.lootFrame:GetHeight()
	    end
	    self:UpdateMainLootFrameSizeAndPosition()
	 end
end

function LootRolls:UpdateLootFrameBackdrop(oLoot)
	 if (not oLoot or not oLoot.frame) then return; end
	 local background = nil;
	 if (LSM) then
	    background = LSM:Fetch("background",self:GetValue("params","lootbackground"))
	 end
	 if (not background) then
	    background = "Interface\\Tooltips\\UI-Tooltip-Background"
	 end
	 local border = nil;
	 if (LSM) then
	    border = LSM:Fetch("border",self:GetValue("params","lootborder"))
	 end
	 if (not border) then
	    border = "Interface\\Tooltips\\UI-Tooltip-Border"
	 end
	 local x,y = self:GetTemplateSize(border)
	 oLoot.frame:SetBackdrop({
	   bgFile= background,
	   edgeFile= border,
	   tile=0, tileSize=0, edgeSize=32, 
	   insets={left=8, right=8, top=8, bottom=8}
	 });
end

function LootRolls:UpdateLootFrameSizeAndPosition(oLoot)
	 if (not oLoot or not oLoot.frame) then return; end
	 local height = self:GetValue("params","lootFrameHeight")
	 local width = self.data.width - 16
	 local actHeight = height - 16
	 local actWidth = width - 16

	 oLoot.frame:SetHeight(height)
	 oLoot.frame.pictureFrame:SetWidth(actHeight)

	 -- HARD CODE OF 5 ROLL FRAMES
	 local rollFrameWidth = 15
	 for _,frame in pairs(oLoot.frame.rolledFrames) do
	     frame:SetWidth(rollFrameWidth)
	     frame.top:SetHeight(actHeight * .3)
	 end

	 local clickFrameSpaceAvail = ((actWidth - actHeight) * .2)
	 local clickFrameWidth = actHeight / 4
	 if (clickFrameSpaceAvail > actHeight) then 
	    -- 2 columns, each actHeight/2
	    clickFrameWidth = actHeight / 2
	    oLoot.frame.clickFrame:SetWidth(actHeight)
	    oLoot.frame.winFrame:SetWidth(actHeight)
	    oLoot.frame.clickFrame.frames[3]:ClearAllPoints()
	    oLoot.frame.clickFrame.frames[3]:SetPoint("TOPLEFT",oLoot.frame.clickFrame.frames[1],"TOPRIGHT")
	 else
	    -- 1 column, 4 rows
	    oLoot.frame.clickFrame:SetWidth(clickFrameWidth)
	    oLoot.frame.winFrame:SetWidth(clickFrameWidth)
	    oLoot.frame.clickFrame.frames[3]:ClearAllPoints()
	    oLoot.frame.clickFrame.frames[3]:SetPoint("TOPLEFT",oLoot.frame.clickFrame.frames[2],"BOTTOMLEFT")
	 end
	 for _,frame in pairs(oLoot.frame.clickFrame.frames) do
	     frame:SetWidth(clickFrameWidth)
	     frame:SetHeight(clickFrameWidth)
	 end
end

function LootRolls:UpdateLootFrameFont(oLoot)
	 if (not oLoot or not oLoot.frame) then return; end
	 local font = nil;
	 if (LSM) then
	    font = LSM:Fetch("font",self:GetValue("params","font"))
	 end
	 if (not font) then
	    font = "Fonts\\skurri.ttf"
	 end
	 local fontSize = self:GetValue("params","fontsize")
	 oLoot.frame.linkFrame.linkString:SetFont(font,fontSize)
	 for _,frame in pairs(oLoot.frame.rolledFrames) do
	     frame.top.string:SetFont(font,fontSize)
	     frame.bottom.string:SetFont(font,fontSize)
	 end
	 oLoot.frame.winFrame.winString:SetFont(font,fontSize*.7)
end

function LootRolls:UpdateLootFrame(oLoot)
	 self:UpdateLootFrameBackdrop(oLoot)
	 self:UpdateLootFrameFont(oLoot)
	 self:UpdateLootFrameSizeAndPosition(oLoot)
end

function LootRolls:UpdateAllLootFrames()
	 for k,v in pairs(self.data.loots or {}) do
	     self:UpdateLootFrame(v)
	 end
end

function LootRolls:ShowTooltip(frame)
	 --  man I wish I hadn't had to steal the next line from bartender
	 -- seems like it should be documented somewhere
	 if (not frame or not frame.oRoll) then
	    return
	 end
	 GameTooltip_SetDefaultAnchor(GameTooltip, self.data.lootFrame)
	 if (GetLootRollTimeLeft(frame.oRoll.id)>0) then
	    GameTooltip:SetLootRollItem(frame.oRoll.id)
	 else
	    GameTooltip:SetHyperlink(frame.oRoll.link)
	 end
	 GameTooltip:Show()
end
function LootRolls:HideTooltip(frame)
	GameTooltip:Hide()
end
function LootRolls:ClickTooltip(frame)
	if (not frame or not frame.pictureFrame or not frame.linkFrame or not frame.oRoll) then
	   return
	end
	if (not(frame.pictureFrame:IsMouseOver() or frame.linkFrame:IsMouseOver())) then
	   return
	end
	-- below code stolen from FrameXML/ItemRef.lua
	if ( IsModifiedClick() ) then
		HandleModifiedItemClick(frame.oRoll.link);
	else
		ShowUIPanel(ItemRefTooltip);
		if ( not ItemRefTooltip:IsShown() ) then
			ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE");
		end
		ItemRefTooltip:SetHyperlink(frame.oRoll.link);
	end
end

function LootRolls:GetLocalTip()
	 if (not self.data) then self.data = {}; end
	 if (self.data.localTip) then return self.data.localTip; end
	 self.data.localTip = CreateFrame("GameTooltip",nil,self.data.lootFrame)
	 return self.data.localTip;
end

function LootRolls:ShowLocalTip(lines)
	 if (not lines) then return; end
	 local tip = self:GetLocalTip()
	 tip:ClearLines()
	 if (type(lines)=="string") then
	    tip:AddLine(lines)
	 else
	    for i=1,#lines do
	    	if (type(lines[i])==string) then
		   tip:AddLine(lines[i])
		else
		   tip:AddLine(lines[i][1],lines[i][2],lines[i][3],lines[i][4],lines[i][5],lines[i][5],lines[i][6],lines[i][7],lines[i][8]) 
		end
	    end
	 end
end

function LootRolls:CancelFade()
	 if (not self.data or not self.data.lootFrame) then return; end
	 self.data.lootFrame:SetAlpha(1)
	 self.data.fadeAt=0;
end

function LootRolls:ScheduleFade(fadeWhen)
	 if (not self.data or not self.data.lootFrame) then return; end
	 local fadeTime = fadeWhen or self:GetValue("params","fadeout")
	 if (not fadeTime or fadeTime==0) then return; end; -- no fade
	 if (self.data.fadeAt and self.data.fadeAt > 0) then
	    self:CancelFade()
	 end
	 self.data.fadeAt = GetTime()+fadeTime
	 self.data.lootFrame:SetScript("OnUpdate",function() self:OnUpdate(); end)
end

local FADETIME = 5
function LootRolls:OnUpdate()

	 if (not self.data or not self.data.lootFrame) then return; end
	 if (not self.data.fadeAt or self.data.fadeAt==0) then
	    self.data.lootFrame:SetScript("OnUpdate",nil)
	    return
	 end
	 -- not time yet
	 if (self.data.fadeAt > GetTime()) then return; end
	 local fadeTime = GetTime() - self.data.fadeAt
	 if (fadeTime > FADETIME) then
	    -- done fading
	    self.data.fadeAt = 0
	    self.data.lootFrame:Hide()
	    self.data.lootFrame:SetAlpha(1)
	    self.data.lootFrame:SetScript("OnUpdate",nil)
	 else
	    self.data.lootFrame:SetAlpha(1-(fadeTime / FADETIME))
	 end	 
end

function LootRolls:UpdateRollTime(frame,oRoll)
	 if (not frame) then return; end
	 if (not oRoll or not oRoll.id) then
	    frame:SetScript("OnUpdate",nil)
	    return
	 end
	 local time = GetLootRollTimeLeft(oRoll.id)
	 frame:SetValue(time)
	 if (time <= 0) then
	    frame:SetScript("OnUpdate",nil)
	 end
end

function LootRolls:CreateLootFrame(oRoll) -- this should become a oRoll
	if (not oRoll) then return; end
	local link = oRoll.link
	if (not link) then return; end
	local texture = select(10,GetItemInfo(link))
	if (not texture) then self:Print("No texture for " .. link);return; end -- invalid itemlink
	if (not self.data.lootFrame) then self:CreateMainLootFrame(); end
	local frame = CreateFrame("Frame",nil,self.data.lootFrame.body)
	frame:SetPoint("LEFT",8,0)
	frame:SetPoint("RIGHT",0,0)

 	-- picture frame
	local pictureFrame = CreateFrame("Frame",nil,frame)
	frame.pictureFrame = pictureFrame
	frame.oRoll = oRoll
	pictureFrame.texture = pictureFrame:CreateTexture()
	pictureFrame.texture:SetTexture(texture)
	pictureFrame.texture:SetAllPoints()
	pictureFrame:SetPoint("LEFT",8,0) -- link to left edge, no insert
	pictureFrame:SetPoint("TOP",0,-8)
	pictureFrame:SetPoint("BOTTOM",0,8)
	pictureFrame:EnableMouse()
	pictureFrame:SetScript("OnEnter",function() self:ShowTooltip(frame); end)
	pictureFrame:SetScript("OnLeave",function() self:HideTooltip(frame); end)
	pictureFrame:SetScript("OnMouseUp",function() self:ClickTooltip(frame);end)

	-- link (short)
	local linkFrame = CreateFrame("Frame",nil,frame)
	frame.linkFrame = linkFrame
	linkFrame:SetPoint("LEFT",pictureFrame,"RIGHT")
	linkFrame:SetPoint("TOP",0,-8)
	linkFrame:SetPoint("BOTTOM",0,8)
	linkString=linkFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
	linkFrame.linkString = linkString
	linkString:SetWordWrap(true)
	linkString:SetNonSpaceWrap(true)
	linkString:SetText(link)	
	linkString:SetAllPoints()
	linkString:SetJustifyV("MIDDLE")
	linkFrame:EnableMouse()
	linkFrame:SetScript("OnEnter",function() self:ShowTooltip(frame); end)
	linkFrame:SetScript("OnLeave",function() self:HideTooltip(frame); end)
	linkFrame:SetScript("OnMouseUp",function() self:ClickTooltip(frame);end)

	-- n/g/d/p/p numbers
	local rolledFrameNames = {"need","greed","disenchant","pass","pending"}
	local need,greed,disenchant,pass,pending = self:GetRollNumbers(oRoll)
	local rollNumbers = {
	      need = need,
	      greed = greed,
	      disenchant = disenchant,
	      pass = pass,
	      pending = pending
	}
	frame.rolledFrames = {}
	for i=1,#rolledFrameNames do
	    local rollFrame = CreateFrame("Frame",nil,frame)
	    rollFrame:SetPoint("TOP",0,-8)
	    rollFrame:SetPoint("BOTTOM",0,8)
	    -- ok. need a top and bottom part now
	    local top = CreateFrame("Frame",nil,rollFrame)
	    rollFrame.top = top
	    top:SetPoint("TOP")
	    top:SetPoint("LEFT")
	    top:SetPoint("RIGHT")
	    top.string = top:CreateFontString(nil,"ARTWORK","GameFontNormal")
	    top.string:SetText(string.upper(rolledFrameNames[i]:sub(1,1)))
	    top.string:SetAllPoints()
	    top.string:SetJustifyV("TOP")
	    local bottom = CreateFrame("Frame",nil,rollFrame)
	    rollFrame.bottom = bottom
	    bottom:SetPoint("TOP",top,"BOTTOM")
	    bottom:SetPoint("LEFT")
	    bottom:SetPoint("RIGHT")
	    bottom:SetPoint("BOTTOM")
	    bottom.string = bottom:CreateFontString(nil,"ARTWORK","GameFontNormal")
	    bottom.string:SetText(rollNumbers[rolledFrameNames[i]])
	    bottom.string:SetAllPoints()
	    bottom.string:SetJustifyV("MIDDLE")
	    tinsert(frame.rolledFrames,rollFrame)
--	    frame.rolledFrames[rolledFrameNames[i]] = rollFrame
	end

	-- clickies to do things
	local clickFrame = CreateFrame("Frame",nil,frame)
	frame.clickFrame = clickFrame
	for i=1,#frame.rolledFrames do
	    if (i==#frame.rolledFrames) then
	       frame.rolledFrames[i]:SetPoint("RIGHT",clickFrame,"LEFT")	
	    else
	       frame.rolledFrames[i]:SetPoint("RIGHT",frame.rolledFrames[i+1],"LEFT")	
	    end
	end
	frame.linkFrame:SetPoint("RIGHT",frame.rolledFrames[1],"LEFT")

	clickFrame:SetPoint("RIGHT",-8,0) -- fix to right edge
	clickFrame:SetPoint("TOP",0,-8)
	clickFrame:SetPoint("BOTTOM",0,8)
	local status = CreateFrame("StatusBar",nil,clickFrame)
	clickFrame.status = status
	status:SetOrientation("VERTICAL")
	status:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	status:SetStatusBarColor(0,1,0)
	status:SetAllPoints()
	status:SetMinMaxValues(0,GetLootRollTimeLeft(oRoll.id))
	status:SetScript("OnUpdate",function(funcFrame) self:UpdateRollTime(funcFrame,oRoll); end)
	status:Show()
	
	local clickFrameNames = {"need","greed","disenchant","pass"}
	frame.clickFrame.frames = {}
	for i=1,#clickFrameNames do
	    local tmpFrame = CreateFrame("Button",nil,clickFrame)
	    if (i==1) then
	       tmpFrame:SetPoint("TOPLEFT")
	    else
	       tmpFrame:SetPoint("TOPLEFT",clickFrame.frames[i-1],"BOTTOMLEFT")	
	    end
	    tmpFrame:SetPushedTexture(lTEXTURES[clickFrameNames[i]].down)
	    tmpFrame:SetNormalTexture(lTEXTURES[clickFrameNames[i]].up)
	    tmpFrame:SetHighlightTexture(lTEXTURES[clickFrameNames[i]].highlight)
	    tmpFrame:SetScript("OnClick", function() RollOnLoot(oRoll.id,lROLLTRANSLATION[clickFrameNames[i]]); end)
	    if (not oRoll.allowed[clickFrameNames[i]]) then
	       tmpFrame:Disable()
	       tmpFrame:GetNormalTexture():SetVertexColor(.4,.4,.4)
	    end
--	    tmpFrame:SetDisabledTexture()-- only valid for disenchant
	    tinsert(clickFrame.frames,tmpFrame)
--	    clickFrame.frames[clickFrameNames[i]] = tmpFrame
	end

---   frame for winner announce
	local winFrame = CreateFrame("Frame",nil,frame)
	frame.winFrame = winFrame
	winFrame:SetPoint("RIGHT",-8,0) -- fix to right edge
	winFrame:SetPoint("TOP",0,-8)
	winFrame:SetPoint("BOTTOM")
	winString=winFrame:CreateFontString(nil,"ARTWORK","GameFontNormal")
	winFrame.winString = winString
	winString:SetWordWrap(true)
	winString:SetNonSpaceWrap(true)
	winString:SetText(win)	
	winString:SetAllPoints()
	winString:SetJustifyV("MIDDLE")
	winFrame:Hide()

	local oLoot = {frame=frame, oRoll=oRoll}
	oRoll.oLoot = oLoot
	if (not self.data.loots) then self.data.loots = {}; end
	tinsert(self.data.loots,oLoot)
	if (#self.data.loots==1) then
	   frame:SetPoint("TOP",self.data.lootFrame.body,"TOP",0,0)
	else
	   local oldTop = self.data.loots[#self.data.loots-1].frame
	   frame:SetPoint("TOP",self.data.lootFrame.body,"TOP",0,0)
	   oldTop:SetPoint("TOP",frame,"BOTTOM")
	end
	self:UpdateLootFrame(oLoot)
	self:UpdateScrollData()
	return oLoot
end

function LootRolls:UpdateScrollData()
	 if (not self.data or not self.data.loots or not self.data.lootFrame) then
	    return
	 end
	 local _,oLoot = next(self.data.loots)
	 if (not oLoot) then	
	    return
	 end
	 local numEntries = #self.data.loots
	 local height = oLoot.frame:GetHeight()
	 self.data.lootFrame.body:SetHeight(numEntries * height)
end
