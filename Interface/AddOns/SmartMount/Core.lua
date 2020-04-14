
if Rock and Rock:HasLibrary('LibRockConfig-1.0') and Rock:HasLibrary('LibRockDB-1.0') then
	SmartMount = Rock:NewAddon('SmartMount', 'LibRockConfig-1.0', 'LibRockDB-1.0')
	
	BINDING_HEADER_SMARTMOUNT = 'Smart Mount'
	BINDING_NAME_SMARTMOUNT_MOUNTORCONFIG = SmartMount_Locale['Show Options']

	SmartMount:SetDatabase('SmartMount_Config')
	
	SmartMount.Version = '1.1'
	
	SmartMount.rock = true
else
	SmartMount = {}

	-- no Rock: only english
	BINDING_HEADER_SMARTMOUNT = 'Smart Mount'
	BINDING_NAME_SMARTMOUNT_MOUNTORCONFIG = 'Mount'

	SmartMount.db = { profile = {} }
	
	SmartMount.rock = false
end -- if

-- generate button (keyboard use only)
CreateFrame('Button', 'SmartMount_Button', UIParent, 'SecureActionButtonTemplate')
SmartMount_Button:SetScript('PreClick', function (_, btn) SmartMount:PreClick(btn, SmartMount_Button) end)
SmartMount_Button:SetScript('PostClick', function (_, btn) SmartMount:PostClick(btn, SmartMount_Button) end)
SmartMount_Button:RegisterForClicks('LeftButtonUp', 'RightButtonUp', 'MiddleButtonUp')

-- list of all buttons
SmartMount.Buttons = {SmartMount_Button}

function SmartMount:OnLoad()
	SLASH_SMARTMOUNT1 = '/smartmount';
	SlashCmdList['SMARTMOUNT'] = SmartMount_HelpOrConfig

	self.frame = CreateFrame('Frame', 'SmartMount Timer');
	self.spellNameColdWeatherFlying = GetSpellInfo(54197)

	if self.rock then
		this:RegisterEvent('PLAYER_REGEN_DISABLED')
		this:RegisterEvent('PLAYER_REGEN_ENABLED')
		self:SetDatabaseDefaults('profile', self.ConfigDefaults)
		
		this:RegisterEvent('PLAYER_UNGHOST')
		this:RegisterEvent('PLAYER_CONTROL_GAINED')
--		this:RegisterEvent('COMPANION_UPDATE')
	else
		this:RegisterEvent('PLAYER_LOGIN')
	end
	this:RegisterEvent('PLAYER_ENTERING_WORLD');
	this:RegisterEvent('CHARACTER_POINTS_CHANGED');
	this:RegisterEvent('PLAYER_TALENT_UPDATE');
	this:RegisterEvent('SPELLS_CHANGED');
	this:RegisterEvent('PLAYER_ALIVE')
end

function SmartMount:OnEvent(event, arg1)
	self:dump('event', event)

	if event == 'PLAYER_LOGIN' then
		-- only get's called without rock
		self:CheckConfig()
		self:HijackBindings(false)

		-- for debugging without rock, uncomment the following line
		-- SmartMount.db.profile[SmartMount.ConfigVersion].Debug = true

	elseif event == 'PLAYER_REGEN_DISABLED' or event == 'PLAYER_REGEN_ENABLED' then
		-- disable some configs while in combat
		Rock('LibRockConfig-1.0'):RefreshConfigMenu(self)
	elseif event == 'PLAYER_ENTERING_WORLD' or event == 'CHARACTER_POINTS_CHANGED' or event == 'PLAYER_TALENT_UPDATE' or event == 'SPELLS_CHANGED' or event == 'PLAYER_ALIVE' then
		self:InitConfig()
		self:InitClick()
		self:SetupLibDataBroker()
	elseif event == 'COMPANION_UPDATE' then
		self:InitConfig(true)
		self:InitClick()
	end -- if

	if event == 'PLAYER_ALIVE' and not self.first_alive_timer then
		self.first_alive_timer_timeouttimer = 0.5
		self.first_alive_timer = CreateFrame('Frame')
		self.first_alive_timer:SetScript('OnUpdate', function(frame, elapsed)
			self.first_alive_timer_timeouttimer = self.first_alive_timer_timeouttimer - elapsed
			if self.first_alive_timer_timeouttimer <= 0 then
				self.first_alive_timer:Hide()
				self:dump('event', 'AFTER PLAYER_ALIVE')
				if self.rock then
					self:InitConfig(true)
				end -- if
				self:InitClick()
			end -- if
		end)
	end

	if event == 'PLAYER_UNGHOST' or event == 'PLAYER_ENTERING_WORLD' or event == 'PLAYER_ALIVE' or event == 'PLAYER_CONTROL_GAINED' then
		if not InCombatLockdown() and not IsMounted() and not CanExitVehicle() and self:GetPref('SummonMiniPet') then
			local pet = self:GetRandomPet()
			if pet then
				CallCompanion(pet['type'], pet['slot'])
			end -- if
		end -- if
	end -- if
end

function SmartMount:MountOrConfig()
	if self.rock then
		self:InitClick()
		self:OpenConfigMenu()
	else
		self:HijackBindings(true)
	end
end

function SmartMount_HelpOrConfig()
	if SmartMount.rock then
		SmartMount:InitClick()
		SmartMount:OpenConfigMenu()
	else
		DEFAULT_CHAT_FRAME:AddMessage('|cff3fcf26SmartMount|r: If you want to configure SmartMount (the One-Key-Mount™) please install LibRock-1.0 and LibRockConfig-1.0.')
		DEFAULT_CHAT_FRAME:AddMessage('|cff3fcf26SmartMount|r: Even with this default configuration you should have much fun!')
		DEFAULT_CHAT_FRAME:AddMessage('|cff3fcf26SmartMount|r: For an use in a macro, use |cff3fcf26/click SmartMount_Button|r.')
	end
end

function SmartMount:GetPref(k)
	return self.db.profile[self.ConfigVersion][k]
end

function SmartMount:SetPref(k, v)
	self.db.profile[self.ConfigVersion][k] = v
end

function SmartMount:GetPlayerPref(k)
	if type(self.dbchar) ~= 'table' then
		DEFAULT_CHAT_FRAME:AddMessage('attemted to check config!')
		return false
	end
	if type(self.dbchar[self.PlayerConfigVersion]) ~= 'table' then
		DEFAULT_CHAT_FRAME:AddMessage('attemted2 to check config!')
		return false
	end
	return self.dbchar[self.PlayerConfigVersion][k]
end

function SmartMount:SetPlayerPref(k, v)
	self.dbchar[self.PlayerConfigVersion][k] = v
end

-- LibDataBroker

function SmartMount:SetupLibDataBroker()
	local libDataBroker = LibStub and LibStub('LibDataBroker-1.1', true)
	
	if not libDataBroker or not self.rock or not self:GetPref('LibDataBroker') then
		return
	end

	libDataBroker:NewDataObject('SmartMount', {
		type = 'launcher',
		OnClick = function(_, msg)
			if msg == 'LeftButton' then
			  SmartMount_HelpOrConfig()
			end
		end,
		icon = 'Interface\\Icons\\Ability_Mount_BlackPanther',
		OnTooltipShow = function(tooltip)
			if not tooltip or not tooltip.AddLine then return end
			tooltip:AddLine('SmartMount')
			tooltip:AddLine('|cffffff00' .. SmartMount_Locale.ldb_tooltip)
		end,
	})
end

-- for debugging

function SmartMount:dump(na, va, hide, force)
	-- for debugging without rock, see near line 50

	-- debug only when needed
	if not force and not self:GetPref('Debug') then return end

	-- output	
	local t
	
	-- name
	if(na ~= nil)then
		t = self:dump(nil, na, true, force)..': '
	else
		t = ''
	end

	-- data
	local ty = type(va)
	if(ty == 'table')then
		t = t .. '{ '
		for k,v in pairs(va) do
			t = t .. self:dump(k, v, true, force) .. ', '
		end
		t = t .. '}'
	elseif(ty == 'string')then
		t = t .. '\'' .. va .. '\''
	elseif(ty == 'number')then
		t = t .. va
	elseif(ty == 'boolean')then
		t = t .. ((va and 'true') or 'false')
	else
		t = t .. '(' .. ty .. ')'
	end
	
	if(hide)then
		return t
	else
		DEFAULT_CHAT_FRAME:AddMessage('dump: '..t)
	end
end
