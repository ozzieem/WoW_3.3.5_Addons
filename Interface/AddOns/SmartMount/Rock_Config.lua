--[[

	this file conatins everything which is neccecary to configure via rock
	
--]]

--
-- create the main-config-menu
--

function SmartMount:InitConfig(force)

	if self.options and not force then
		return
	end -- if

	local L = SmartMount_Locale

	self.options = {
		type = 'group',
		name = 'SmartMount',
		desc = [[The One-Key-Mount™

Simple to use, configured with Rock]],
		icon = 'Interface\\Icons\\Ability_Mount_BlackPanther',
		child_get = 'GetSetting',
		child_set = 'SetSetting',
		child_child_get = 'GetSetting',
		child_child_set = 'SetSetting',
		child_child_child_get = 'GetSetting',
		child_child_child_set = 'SetSetting',
		child_child_child_child_get = 'GetSetting',
		child_child_child_child_set = 'SetSetting',
		args = {
			{
				order = 1,
				type = 'keybinding',
				name = L['key1'],
				desc = L['key1_desc'],
				passValue = 'key1',
				disabled = InCombatLockdown,
			},
			{
				order = 2,
				type = 'keybinding',
				name = L['key2'],
				desc = L['key2_desc'],
				passValue = 'key2',
				disabled = InCombatLockdown,
			},
			{
				order = 2,
				type = 'keybinding',
				name = L['key3'],
				desc = L['key3_desc'],
				passValue = 'key3',
				disabled = InCombatLockdown,
			},
			{
				order = 3,
				type = 'execute',
				name = L.key_helper_name,
				desc = L.key_helper_desc,
				confirmText = L.key_helper_confirm,
				buttonText = L.key_helper_button,
				func = 'ImportKeys'
			},
			{
				order = 4,
				type = 'string',
				name = L.show_action_button_name,
				desc = '',
				get = function() return 'If you need one, install the SmartMount-ActionButton Addon' end,
				disabled = true,
			},
			{
				order = 5,
				type = 'boolean',
				name = L.summon_minipet_name,
				desc = L.summon_minipet_desc,
				passValue = 'SummonMiniPet',
			},
			{
				order = 6,
				type = 'boolean',
				name = L.debug_name,
				desc = L.debug_desc,
				passValue = 'Debug',
			},
			{
				order = 7,
				type = 'boolean',
				name = L.exit_vehicle_name,
				desc = L.exit_vehicle_desc,
				passValue = 'ExitVehicle',
			},
			{
				order = 8,
				type = 'boolean',
				name = L.ldb_name,
				desc = L.ldb_desc,
				passValue = 'LibDataBroker',
			},
			{
				order = 9,
				type = 'string',
				name = L['help_version'],
				desc = L['help_version'],
				get = function() return ' ' .. string.gsub(GetAddOnMetadata('SmartMount', 'Version'), '@project%-revision@', 'svn') end,
				usage = '',
				disabled = true,
			},
			
			self:CreateConfigGroup(1),
			self:CreateConfigGroup(2),
			self:CreateConfigGroup(3),

			{
				order = 19,
				type = 'group',
				name = L.config_exclude_name,
				desc = L.config_exclude_desc,
				args = {
					{
						order = 1,
						type = 'string',
						name = L.help_exclude_perplayer_name,
						desc = L.help_exclude_perplayer_desc,
						get = function() return ' ' .. L.help_exclude_perplayer_help end,
						usage = '',
						disabled = true,
					},
					{
						order = 2,
						type = 'choice',
						name = L.exclude_mounts_list_name,
						desc = L.exclude_mounts_list_desc,
						choices = {[false] = L.exclude_both_list_black, [true] = L.exclude_both_list_white},
						get = function() return self:GetPlayerPref('ExcludedMountsWhitelist') or false end,
						set = function(v) if v == false then v = nil end self:SetPlayerPref('ExcludedMountsWhitelist', v) end,
					},
					{
						order = 3,
						type = 'choice',
						name = L.exclude_minipets_list_name,
						desc = L.exclude_minipets_list_desc,
						choices = {[false] = L.exclude_both_list_black, [true] = L.exclude_both_list_white},
						get = function() return self:GetPlayerPref('ExcludedMiniPetsWhitelist') or false end,
						set = function(v) if v == false then v = nil end self:SetPlayerPref('ExcludedMiniPetsWhitelist', v) end,
					},
					{
						order = 100,
						type = 'group',
						name = L.exclude_mounts_name,
						desc = L.exclude_mounts_desc,
						args = self:CreateConfigExclude('MOUNT', 'ExcludedMounts'),
					},
					{
						order = 101,
						type = 'group',
						name = L.exclude_minipets_name,
						desc = L.exclude_minipets_desc,
						args = self:CreateConfigExclude('CRITTER', 'ExcludedMiniPets', 0),
					}
				}
			},

			{
				order = 20,
				type = 'group',
				name = L['help_name'],
				desc = L['help_desc'],
				args = {
					{
						order = 1,
						type = 'execute',
						name = L['help_help_name'],
						desc = L['help_help_desc'],
						buttonText = L['help_help_btn'],
						func = function() end,
					},
					{
						order = 2,
						type = 'group',
						groupType = 'inline',
						name = L['help_mounts_name'],
						desc = L['help_mounts_desc'],
						args = {
							{
								order = 1,
								type = 'string',
								name = L['help_mounts_reg'],
								desc = L['help_mounts_reg'],
								get = function() return ' ' .. L['help_mounts_reg'] end,
								usage = '',
								disabled = true,
							},
							{
								order = 3,
								type = 'string',
								name = L['help_mounts_dru'],
								desc = self.SpellLocale['Travel Form'] .. ', ' .. L['Flight / Swift Flight Form'],
								get = function() return ' ' .. self.SpellLocale['Travel Form'] .. ', ' .. L['Flight / Swift Flight Form'] end,
								usage = '',
								disabled = true,
							},
							{
								order = 4,
								type = 'string',
								name = L['help_mounts_sha'],
								desc = self.SpellLocale['Ghost Wolf'],
								get = function() return ' ' .. self.SpellLocale['Ghost Wolf'] end,
								usage = '',
								disabled = true,
							},
						},
					},
					{
						order = 3,
						type = 'execute',
						name = L['help_macro_name'],
						desc = L['help_macro_desc'],
						buttonText = L['help_macro_btn'],
						func = 'createMacro',
						disabled = InCombatLockdown,
					},
					{
						order = 6,
						type = 'string',
						name = L['help_inspiration_name'],
						desc = L['help_inspiration_btn'],
						get = function() return L['help_inspiration_btn'] end,
						usage = '',
						disabled = true,
					},
					{
						order = 7,
						type = 'string',
						name = L['help_ranslator_name'],
						desc = L['translated_by'],
						get = function() return L['translated_by'] end,
						usage = '',
						disabled = true,
					},
					{
						order = 8,
						type = 'execute',
						name = L['help_donate'],
						desc = L['help_donate'],
						buttonText = L['help_donate'],
						func = function() self:DisplayURL([[https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=1732648]]) end,
					},
				},
			},
		},
	}

	self:SetConfigTable(self.options)
end

--
-- generate sub-menus
--

local mountspeed2name = {
	[0] = '',
	[1] = ' (±0% / --)',
	[3] = ' (+60% / --)',
	[4] = ' (+100% / --)',
	[5] = ' (+60% / +60%)',
	[6] = ' (+100% / +280%)',
	[7] = ' (+100% / +310%)',
	[17] = ' (+100% / --)',
	[18] = ' (Variable Ground Speed)',
	[19] = ' (Variable Speed)',
	[20] = ' (Variable Flying Speed)',
}

local function sort_exclude_mounts(a, b)
	if type(a) ~= 'table' or type(b) ~= 'table' then
		return type(a) < type(b)
	elseif a['_ms'] ~= b['_ms'] then
		return a['_ms'] > b['_ms']
	elseif a['_groupnum'] ~= b['_groupnum'] then
		return a['_groupnum'] < b['_groupnum']
	else
		return a.name:gsub('|T(.-)|t ', '') < b.name:gsub('|T(.-)|t ', '')
	end -- if
end

function SmartMount:CreateConfigExclude(comptype, name, defms)
	local args = {}
	local groupmembers = {}
	for slot = 1, GetNumCompanions(comptype) do
		local _, creatureName, creatureSpellID, icon, _ = GetCompanionInfo(comptype, slot)
		local ms = defms or self.Mounts[creatureSpellID]
		if ms ~= nil then
			local grp = self.Groups[creatureSpellID] or creatureSpellID
			args[slot] = {
				type = 'boolean',
				name = '|T'..icon..':24:24:0:0:64:64:4:60:4:60|t' .. (creatureName or 'unknown')..mountspeed2name[ms],
				desc = '',
				icon = icon,
				get = function() return self:GetPlayerPref(name)[creatureSpellID] end,
				set = function(val) self:GetPlayerPref(name)[creatureSpellID] = val or nil end,
				['_ms'] = ms,
				['_group'] = grp,
				['_groupnum'] = 0,
			}
			if groupmembers[grp] == nil then
				groupmembers[grp] = 1
			else
				groupmembers[grp] = groupmembers[grp] + 1
			end -- if
		end -- if
	end -- for
	
	table.sort(args, sort_exclude_mounts)
	
	local groupnum, nextgroupnum = {}, 1
	for k,v in pairs(args) do
		if groupmembers[v['_group']] > 1 then
			if groupnum[v['_group']] == nil then
				groupnum[v['_group']] = nextgroupnum
				nextgroupnum = nextgroupnum + 1
			end -- if
			v.name = v.name .. string.format(' (Group %d)', groupnum[v['_group']])
			v['_groupnum'] = groupnum[v['_group']]
		end -- if
	end -- for
	
	table.sort(args, sort_exclude_mounts)

	for k,v in pairs(args) do
		v.order = k
	end -- for
	
	return args
end

function SmartMount:CreateConfigGroup(number)
	local L = SmartMount_Locale

	return {
		order = 10 + number,
		type = 'group',
		name = L['config'..number..'_name'],
		desc = L['configX_desc'],
		args = {
			self:CreateConfigPage(number, 1, 'combat'),
			self:CreateConfigPage(number, 2, 'swim'),
			self:CreateConfigPage(number, 3, 'fly'),
			self:CreateConfigPage(number, 4, 'land'),
		}
	}
end

function SmartMount:CreateConfigPage(number, order, name)
	local L = SmartMount_Locale

	local page = {
		order = order,
		type = 'group',
		name = L[name..'_name'],
		desc = L[name..'_desc'],
		args = {
			m = {
				order = 1,
				type = 'group',
				groupType = 'inline',
				name = L['grp_mount_name'],
				desc = L['grp_mount_desc'],
				args = {}
			},
			d = {
				order = 2,
				type = 'group',
				groupType = 'inline',
				name = L['grp_dismount_name'],
				desc = L['grp_dismount_desc'],
				args = {}
			},
		}
	}

	-- combat page: add disable	
	if name == 'combat' then
		page['disabled'] = InCombatLockdown
	end -- if
	
	for _,v in pairs(self:getCfgMount(number, name, 'mnt')) do
		table.insert(page['args']['m']['args'], v)
	end -- for

	if name == 'fly' then
		-- add a button to dismount
		table.insert(page['args']['d']['args'], {
			order = 1,
			type = 'choice',
			choiceType = 'dict',
			choices = { [1] = L['grp_dismount_do_fly_no'], [2] = L['grp_dismount_do_fly_yes'], [3] = L['grp_dismount_do_fly_yes_groundonly'] },
			name = L['grp_dismount_do_name'],
			desc = L['grp_dismount_do_desc'],
			get = function() return (self:GetPref('c'..number..'-'..name..'-dis-do-groundonly') and 3) or ((self:GetPref('c'..number..'-'..name..'-dis-do') and 2) or 1) end,
			set = function(v) self:SetPref('c'..number..'-'..name..'-dis-do', v >= 2); self:SetPref('c'..number..'-'..name..'-dis-do-groundonly', v == 3) end,
		})
	elseif name == 'combat' then
		-- add a button to dismount
		table.insert(page['args']['d']['args'], {
			order = 1,
			type = 'choice',
			choiceType = 'dict',
			choices = { [false] = L['grp_dismount_do_combat_no'], [true] = L['grp_dismount_do_combat_yes'] },
			name = L['grp_dismount_do_name'],
			desc = L['grp_dismount_do_desc'],
			passValue = 'c'..number..'-'..name..'-dis-do',
		})
	else
		-- add a button to dismount
		table.insert(page['args']['d']['args'], {
			order = 1,
			type = 'boolean',
			name = L['grp_dismount_do_name'],
			desc = L['grp_dismount_do_desc'],
			passValue = 'c'..number..'-'..name..'-dis-do',
		})
	end -- if

	if name ~= 'combat' then
		for _,v in pairs(self:getCfgMount(number, name, 'dis')) do
			table.insert(page['args']['d']['args'], v)
		end -- for
	end -- if
	
	return page
end

function SmartMount:getCfgMount(number, name, mode)
	local L = SmartMount_Locale

	return
		{
			{
				order = 11,
				type = 'choice',
				name = L.grp_mount_1st,
				desc = L.grp_mount_1st2nd_desc,
				choices = function() return self:GetListOfMounts(name, mode) end,
				choiceIcons = 'GetListOfMountIcons',
				choiceOrder = 'GetListOfMountOrder',
				choiceType = 'dict',
				passValue = 'c'..number..'-'..name..'-'..mode..'-try1',
				disabled = function() return mode == 'dis' and not self:GetPref('c'..number..'-'..name..'-dis-do') end,
			},
			{
				order = 12,
				type = 'choice',
				name = L.grp_mount_2nd,
				desc = L.grp_mount_1st2nd_desc,
				choices = function() return self:GetListOfMounts(name, mode) end,
				choiceIcons = 'GetListOfMountIcons',
				choiceOrder = 'GetListOfMountOrder',
				choiceType = 'dict',
				passValue = 'c'..number..'-'..name..'-'..mode..'-try2',
				disabled = function() return mode == 'dis' and not self:GetPref('c'..number..'-'..name..'-dis-do') end,
			},
			{
				order = 13,
				type = 'choice',
				name = L.grp_mount_3rd,
				desc = L.grp_mount_3rd_desc,
				choices = function() return self:GetListOfMounts(name, mode) end,
				choiceIcons = 'GetListOfMountIcons',
				choiceOrder = 'GetListOfMountOrder',
				choiceType = 'dict',
				passValue = 'c'..number..'-'..name..'-'..mode..'-try3',
				disabled = function() return mode == 'dis' and not self:GetPref('c'..number..'-'..name..'-dis-do') end,
			},
		}
end


--
-- perform an action
--

function SmartMount:createMacro()
	if GetMacroIndexByName('SmartMount') == 0 then
		local icon, numicons, i = 1, GetNumMacroIcons()
		for i=1, numicons do
			if GetMacroIconInfo(i) == 'Interface\\Icons\\Ability_Mount_BlackPanther' then
				icon = i
			end -- if
		end -- for
		CreateMacro('SmartMount', icon, '/click [button:3] SmartMount_Button MiddleButton; [button:2] SmartMount_Button RightButton ; SmartMount_Button LeftButton', nil, nil)
	end
end

function SmartMount:DisplayURL(theLink)
	-- thanks to WIM
	
	-- The following code was written by the creator of Prat.
	StaticPopupDialogs['SMARTMOUNT_SHOW_URL'] = {
		text = '%s',
		button2 = TEXT(ACCEPT),
		hasEditBox = 1,
		hasWideEditBox = 1,
		--showAlert = 1, -- HACK : it's the only way I found to make de StaticPopup have sufficient width to show WideEditBox :(

		OnShow = function()
			local editBox = getglobal(this:GetName()..'WideEditBox');
			editBox:SetText(theLink);
			editBox:SetFocus();
			editBox:HighlightText(0);

			local button = getglobal(this:GetName()..'Button2');
			button:ClearAllPoints();
			button:SetWidth(200);
			button:SetPoint('CENTER', editBox, 'CENTER', 0, -30);

			--getglobal(this:GetName()..'AlertIcon'):Hide();  -- HACK : we hide the false AlertIcon
		end,

		OnHide = function() end,
		OnAccept = function() end,
		OnCancel = function() end,
		EditBoxOnEscapePressed = function() this:GetParent():Hide() end,
		timeout = 0,
		whileDead = 1,
		hideOnEscape = 1,
	}

	StaticPopup_Show('SMARTMOUNT_SHOW_URL', SmartMount_Locale['geturl_info']);
end

function SmartMount:ImportKeys()
	local key1, key2 = GetBindingKey('SMARTMOUNT_MOUNTORCONFIG')
	if key1 then
		SetBinding(key1)
	end -- if
	if key2 then
		SetBinding(key2)
	end -- if
	self:SetPref('key1', key1 or false)
	self:SetPref('key2', key2 or false)
	self:UpdateSettings()
	Rock('LibRockConfig-1.0'):RefreshConfigMenu(self)
end

--
-- get/set a key
--

function SmartMount:GetSetting(key)
	return self:GetPref(key)
end

function SmartMount:SetSetting(key, value)
	if value == self:GetPref(key) then
		-- no change: don't do anything
		return
	end
	
	-- preserve old value (currently not needed)
	-- local oldvalue = self:GetPref(key)
	
	-- update setting
	self:SetPref(key, value)
	
	-- check for duplicates
	if key == 'key1' then
		if value == self:GetPref('key2') then
			self:SetPref('key2', false)
		elseif value == self:GetPref('key3') then
			self:SetPref('key3', false)
		end
	elseif key == 'key2' then
		if value == self:GetPref('key1') then
			self:SetPref('key1', false)
		elseif value == self:GetPref('key3') then
			self:SetPref('key3', false)
		end
	elseif key == 'key3' then
		if value == self:GetPref('key1') then
			self:SetPref('key1', false)
		elseif value == self:GetPref('key2') then
			self:SetPref('key2', false)
		end
	end

	self:UpdateSettings()
end

--
-- sorted list of mounts
--

local function sort_fly(a, b)
	if a.s == 0 and b.s == 0 then
		-- both fly = 0: just primary speed
		if a.f == b.f then
			return a.m < b.m
		else
			return a.f < b.f
		end -- if
	else
		-- at laest one is flying: check ONLY fly speed
		if a.s == b.s then
			return a.m < b.m
		else
			return a.s < b.s
		end -- if
	end -- if
end

local function sort_fs(a, b)
	if a.f == b.f then
		if a.s == nil or a.s == b.s then
			return a.m < b.m
		else
			return a.s < b.s
		end -- if
	else
		return a.f < b.f
	end -- if
end

local function ppp(n)
	if not n then
		return '--'
	elseif n < 100 then
		return (n - 99) .. '%'
	elseif n > 100 then
		return '+' .. (n - 100) .. '%'
	else
		return '±0%'
	end -- if
end

function SmartMount:GetListOfMounts(name, mode)
	local MustCanCombat = false
	local MustCanSwim = false
	local MustCanFly = false
	local MustCanLand = false

	local MustCanSpecial = false

	if mode == 'dis' then
		MustCanSpecial = true
	end -- if
	
	if name == 'combat' then
		MustCanCombat = true
	elseif name == 'swim' then
		MustCanSwim = true
	elseif name == 'fly' then
		MustCanFly = true
	else -- if name == 'land' then
		MustCanLand = true
	end -- if

	local first, second, sortfn, secondbr
	
	if MustCanSpecial then
		self.chooseMounts = { ['off'] = ' - ' .. SmartMount_Locale['mount_dis_off'] }
		first = false
		sortfn = sort_fs
		secondbr = false
	elseif MustCanLand then
		self.chooseMounts = { ['off'] = ' - ' .. SmartMount_Locale['mount_mnt_off'] .. ': ' .. ppp(100) .. '' }
		first = 'land'
		second = 'fly'
		sortfn = sort_fly
		secondbr = false
	elseif MustCanFly then
		self.chooseMounts = { ['off'] = ' - ' .. SmartMount_Locale['mount_mnt_off'] .. ': ' .. ppp(100) .. '' }
		first = 'fly'
		second = '__'
		sortfn = sort_fly
		secondbr = false
	elseif MustCanSwim then
		self.chooseMounts = { ['off'] = ' - ' .. SmartMount_Locale['mount_mnt_off'] .. ': ' .. ppp(66) .. '' }
		first = 'swim'
		second = '__'
		sortfn = sort_fs
		secondbr = false
	else --if MustCanCombat then
		self.chooseMounts = { ['off'] = ' - ' .. SmartMount_Locale['mount_mnt_off'] .. ': ' .. ppp(100) .. ' (' .. ppp(66) .. ')' }
		first = 'land'
		second = 'swim'
		sortfn = sort_fs
		secondbr = true
	end -- if
	self.chooseMountIcons = { ['off'] = 'Interface\\Icons\\Temp'}
	self.chooseMountOrder = {}
	table.insert(self.chooseMountOrder, {a = 'off', f = -100, s = 0, m = '' })
	if (MustCanLand or MustCanSwim) and not MustCanSpecial then
		self.chooseMounts['rnd_fast'] = ' ' .. SmartMount_Locale['mount_rnd_fast']
		self.chooseMountIcons['rnd_fast'] = 'Interface\\Icons\\INV_Gizmo_RocketBootExtreme'
		table.insert(self.chooseMountOrder, {a = 'rnd_fast', f = -50, s = 0, m = '' })
		self.chooseMounts['rnd_fast2'] = ' ' .. SmartMount_Locale['mount_rnd_fast2']
		self.chooseMountIcons['rnd_fast2'] = 'Interface\\Icons\\INV_Gizmo_RocketBootExtreme'
		table.insert(self.chooseMountOrder, {a = 'rnd_fast2', f = -40, s = 0, m = '' })
		self.chooseMounts['rnd_fast3'] = ' ' .. SmartMount_Locale['mount_rnd_fast3']
		self.chooseMountIcons['rnd_fast3'] = 'Interface\\Icons\\INV_Gizmo_RocketBootExtreme'
		table.insert(self.chooseMountOrder, {a = 'rnd_fast3', f = -30, s = 0, m = '' })
		self.chooseMounts['rnd_all'] = ' ' .. SmartMount_Locale['mount_rnd_any']
		self.chooseMountIcons['rnd_all'] = 'Interface\\Icons\\INV_Gizmo_RocketBoot_01'
		table.insert(self.chooseMountOrder, {a = 'rnd_all', f = -25, s = 0, m = '' })
	end -- if
	if ( MustCanSpecial and not MustCanCombat and not MustCanFly ) or MustCanLand then
		self.chooseMounts['rnd_pet'] = ' - ' .. SmartMount_Locale['mount_rnd_pet']
		self.chooseMountIcons['rnd_pet'] = 'Interface\\Icons\\INV_Jewelcrafting_GoldenHare'
		table.insert(self.chooseMountOrder, {a = 'rnd_pet', f = -5, s = 0, m = '' })
	end -- if
	
	for k, v in pairs(self.ListOfMounts) do
		if (not MustCanCombat or v.incombat) and (not MustCanSwim or v.inwater) and (not MustCanFly or v.inair) and (not MustCanLand or v.onground) and (not MustCanSpecial or not v.mount) then
			local fspeed
			local sspeed
			if first then
				fspeed = v[first]
				sspeed = v[second]
				if secondbr then
					-- 'xxx% (xxx%): '
					self.chooseMounts[v.action] = ' ' .. ppp(fspeed) .. ' (' .. ppp(sspeed) .. '): ' .. v.name
				elseif sspeed then
					-- 'xxx% / xxx%: '
					self.chooseMounts[v.action] = ' ' .. ppp(fspeed) .. ' / ' .. ppp(sspeed) .. ': ' .. v.name
				else
					-- 'xxx%: '
					self.chooseMounts[v.action] = ' ' .. ppp(fspeed) .. ': ' .. v.name
				end -- if
			else
				fspeed, sspeed = 0, 0
				self.chooseMounts[v.action] = ' ' .. v.name
			end -- if
			self.chooseMountIcons[v.action] = v.icon
			table.insert(self.chooseMountOrder, {a = v.action, f = fspeed or 100, s = sspeed or 0, m = v.name})
		end -- if
	end -- for
	
	table.sort(self.chooseMountOrder, sortfn)
	for k,v in pairs(self.chooseMountOrder) do
		self.chooseMountOrder[k] = v.a
	end -- for
	
	return self.chooseMounts
end

function SmartMount:GetListOfMountIcons()
	return self.chooseMountIcons
end

function SmartMount:GetListOfMountOrder()
	return self.chooseMountOrder
end

