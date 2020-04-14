local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ALIVE")
f:RegisterEvent("PLAYER_UNGHOST")
f:RegisterEvent("RESURRECT_REQUEST")
f:SetScript("OnEvent", function(self, event, arg1)
	if event == "RESURRECT_REQUEST" then
    	self.resser = arg1
    	AcceptResurrect()
	elseif self.resser and UnitExists(self.resser) and not UnitIsDeadOrGhost("player") then
    	DoEmote("thank", self.resser)
		if StaticPopup_Visible("RESURRECT") then
			StaticPopup_Hide("RESURRECT")
		elseif StaticPopup_Visible("RESURRECT_NO_TIMER") then
			StaticPopup_Hide("RESURRECT_NO_TIMER")
		elseif StaticPopup_Visible("RESURRECT_NO_SICKNESS") then
			StaticPopup_Hide("RESURRECT_NO_SICKNESS")
		end
    	self.resser = nil
	end
end)