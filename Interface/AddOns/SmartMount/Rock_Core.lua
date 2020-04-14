--[[

	this file contains everything which is required for running the addon WITH rock
	
--]]

function SmartMount:OnEnable()
	self:CheckConfig()
	self:InitClick()
	self:UpdateSettings()
end

function SmartMount:OnDisable()
	ClearOverrideBindings(SmartMount_Button)
	self:SetAttributes(false, {})
	self:SetAttributes(true, {})
end

function SmartMount:UpdateSettings()
	ClearOverrideBindings(SmartMount_Button)
	if self:GetPref('key1') then
		SetOverrideBindingClick(SmartMount_Button, true, self:GetPref('key1'), 'SmartMount_Button', 'LeftButton')
	end -- if
	if self:GetPref('key2') then
		SetOverrideBindingClick(SmartMount_Button, true, self:GetPref('key2'), 'SmartMount_Button', 'RightButton')
	end -- if
	if self:GetPref('key3') then
		SetOverrideBindingClick(SmartMount_Button, true, self:GetPref('key3'), 'SmartMount_Button', 'MiddleButton')
	end -- if
	self:PostClick('LeftButton')
	self:PostClick('RightButton')
	self:PostClick('MiddleButton')
end

function SmartMount:OnProfileEnable()
	self:CheckConfig()
	self:InitClick()
	self:UpdateSettings()
end

