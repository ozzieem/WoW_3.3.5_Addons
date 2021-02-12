--[[Thanks to Ketho for codes on http://eu.battle.net/wow/en/forum/topic/1710172906]]--
local index, SpellTable




local function CalcSpellCooldownRemaining(frame)
    local start,duration = GetSpellCooldown(frame.SpellID);
    frame.Remaining = start - GetTime() + duration
end
local function OnAnimationTimeCal(self, elapsed)
    self.TimeRemaining = self.TimeRemaining - elapsed
    if self.TimeRemaining < 0 then
        self:SetScript("OnUpdate",nil)
        self:ClearModel()
    end
end

local function OnUpdate(self, elapsed)
    CalcSpellCooldownRemaining(self)
    if start ~= nil then
        print(GetSpellLink(self.SpellID)..start)
    end
    if self.Remaining <= 0.1 then -- cooldown has ended
        print(GetSpellLink(self.SpellID))
        message(GetSpellLink(self.SpellID))
        self.Remaining = 0
        self:SetScript("OnUpdate", nil) -- no need to check anymore
        PlaySoundFile(self.AlertSound) -- play sound
        if self.Animation then
            self.Animation:SetModel(self.Animation.Path)
            self.Animation:SetModelScale(self.Animation.Scale)
            self.Animation:SetSequence(self.Animation.Seq)
            self.Animation:SetCamera(self.Animation.Camera)
            self.Animation:SetPosition(self.Animation.Position[1] ,self.Animation.Position[2] ,self.Animation.Position[3])
            self.Animation:SetFacing(self.Animation.Facing)
            self.Animation.TimeRemaining = self.Animation.Time
            self.Animation:SetScript("OnUpdate",OnAnimationTimeCal)
        end
    end
end

local function OnEvent(self)
    local start, duration = GetSpellCooldown(self.SpellID) -- Get cool down duration of this spell
    CalcSpellCooldownRemaining(self)

    print(GetSpellLink(self.SpellID), "start", start, "duration", duration, "remaining", self.Remaining)
    
    if duration >= 3 and self:GetScript("OnUpdate") == nil and self.Remaining >= 3  then --Current Spell needs to be track / if you have spell which cooldown is less than 3 sec, you should perform a face roll~~~
        self:SetScript("OnUpdate", OnUpdate)
   end
end


for index,SpellTable in pairs(SpellMap) do -- create frames for each spell
    if SpellTable["Enable"] then -- if user wants to monitor current spell
        local dummyframe = CreateFrame("Frame","SexySoundDummyFrame"..index)
        dummyframe.SpellID = SpellTable["SpellID"] --associate spell information to dummy frames
        dummyframe.AlertSound = SpellTable["AlertSound"]
        --check CD of current spell
        CalcSpellCooldownRemaining(dummyframe)
        if dummyframe.Remaining <= 0 then --no needs to track this spell
            dummyframe.Remaining = 0
            dummyframe:SetScript("OnUpdate",nil)
        else --spell is already in cooldown
            dummyframe:SetScript("OnUpdate", OnUpdate) --track spell
        end
        dummyframe:RegisterEvent("SPELL_UPDATE_COOLDOWN") --register for spell cooldown event
        dummyframe:SetScript("OnEvent", OnEvent)
        
        --CreateAnimationFrame
        if SpellTable["Animation"] then
            dummyframe.Animation = CreateFrame("Model",dummyframe:GetName().."Animation",UIParent)
            dummyframe.Animation:SetAllPoints()
            dummyframe.Animation:ClearModel()
            dummyframe.Animation.Path = SpellTable["Animation"].Path
            dummyframe.Animation.Seq = SpellTable["Animation"].Seq
            dummyframe.Animation.Position = SpellTable["Animation"].Position
            dummyframe.Animation.Time = SpellTable["Animation"].Time
            dummyframe.Animation.Camera = SpellTable["Animation"].Camera
            dummyframe.Animation.Scale = SpellTable["Animation"].Scale
            dummyframe.Animation.Facing = SpellTable["Animation"].Facing
            dummyframe.Animation:SetScript("OnUpdate",nil)
        end
    end
end