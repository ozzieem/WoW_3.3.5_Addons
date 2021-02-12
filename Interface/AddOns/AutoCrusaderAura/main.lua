print("Interface number: " .. (select(4, GetBuildInfo())) .. "");
print("AutoCrusaderAura Initialized")

mapID, isContinent = GetCurrentMapAreaID()

print(mapId);
print(isContinent);


local chatYellFrame = CreateFrame("Frame")
chatYellFrame:RegisterEvent("CHAT_MSG_YELL")

chatYellFrame:SetScript("OnEvent", 
function(self, event, ...)
	local arg1, arg2, arg3 = ...
	if arg3 == "Orcish" then
		print("CHAT_MSG_YELL triggered with: Author:" ..arg2.. ' Language: ' ..arg3.. '')
		AddIgnore(arg2);
	end
end
)



-- local frame = CreateFrame("Frame")
-- local frame1 = CreateFrame("Frame")
-- local frame2 = CreateFrame("Frame")
-- local frame3 = CreateFrame("Frame")
-- local frame4 = CreateFrame("Frame")

-- frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
-- frame1:RegisterEvent("UNIT_AURA")
-- frame2:RegisterEvent("PLAYER_GAINS_VEHICLE_DATA")
-- frame3:RegisterEvent("UNIT_ENTERING_VEHICLE")
-- frame4:RegisterEvent("COMPANION_UPDATE")

-- frame:SetScript("OnEvent",
    -- function(self, event, ...)
	    -- local arg1, arg2, arg3 = ...
		-- print("Triggered UNIT_ENTERED_VEHICLE")
		-- print('UNITID: ' ..arg1.. 'Boolean Value: ' ..arg2.. ' VehicleType: ' ..arg3.. '')
	-- end
-- )

-- frame1:SetScript("OnEvent",
    -- function(self, event, ...)
	    -- local arg1 = ...
		-- print("Triggered UNIT_AURA")
		-- print('UNITID: ' .. UnitName("player") .. '')
	-- end
-- )

-- frame2:SetScript("OnEvent",
    -- function(self, event, ...)
	    -- local arg1 = ...
		-- print("Triggered PLAYER_GAINS_VEHICLE_DATA")
	-- end
-- )

-- frame3:SetScript("OnEvent",
    -- function(self, event, ...)
	    -- local arg1 = ...
		-- print("Triggered UNIT_ENTERING_VEHICLE")
	-- end
-- )

-- frame4:SetScript("OnEvent",
    -- function(self, event, ...)
	    -- local arg1, arg2  = ...
		-- print("Triggered COMPANION_UPDATE")
		-- print('UNITID: ' ..arg1.. 'Boolean Value: ' ..arg2.. "")
	-- end
-- )


	
