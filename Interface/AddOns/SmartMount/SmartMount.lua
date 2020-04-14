
--		spell (EN),		is mount/speedindex,	fly-speed,		in:combat		in:air			outlandonly		icon
--										ground-speed,	water-speed,	in:water		on:ground		can indoor				instant

SmartMount.InitSpells = {
		-- death knight
		{'Path of Frost',		false,	100,	false,	100,	false,	true,	false,	false,	false,	false,	'Interface\\Icons\\Spell_DeathKnight_PathOfFrost', true},
		-- hunter
		{'Aspect of the Cheetah',false,	130,	false,	66	,	true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Mount_JungleTiger', true},
		{'Aspect of the Pack',	false,	130,	false,	66	,	true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Mount_WhiteTiger', true},
		{'Aspect of the Viper',	false,	100,	false,	66	,	true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Hunter_AspectoftheViper', true},
		{'Aspect of the Dragonhawk',false,100,	false,	66	,	true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Hunter_Pet_DragonHawk', true},
		-- mage
		{'Blink',				false,	false,	false,	false,	true,	true,	true,	true,	false,	true,	'Interface\\Icons\\Ability_Ambush', true},
		{'Slow Fall',			false,	100,	100,	false,	false,	false,	true,	true,	false,	true,	'Interface\\Icons\\Spell_Magic_FeatherFall', true},
		-- priest
		{'Levitate',			false,	100,	100,	100,	false,	true,	true,	true,	false,	true,	'Interface\\Icons\\Spell_Holy_LayOnHands', true},
		-- rogue
		{'Sprint',				false,	150,	false,	false,	true,	false,	false,	true,	false,	false,	'Interface\\Icons\\Ability_Rogue_Sprint', true},
		-- shaman
		{'Ghost Wolf',			2,		140,	false,	66,		true,	true,	false,	true,	false,	false,	'Interface\\Icons\\Spell_Nature_SpiritWolf', false},
		{'Water Breathing',		false,	100,	false,	66,		false,	true,	false,	false,	false,	true,	'Interface\\Icons\\Spell_Shadow_Demonbreath', true},
		{'Water Walking',		false,	100,	false,	100,	false,	true,	false,	false,	false,	false,	'Interface\\Icons\\Spell_Frost_WindWalkOn', true},
		-- warlock
		{'Unending Breath',		false,	100,	false,	66,	false,	true,	false,	false,	false,	true,	'Interface\\Icons\\Spell_Shadow_Demonbreath', true},

		-- nightelf
		{'Shadowmeld',			false,	false,	false,	false,	true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Ambush', true},
	}

SmartMount.InitShapeshifts = {
		{'Bear Form',			false,	100,	false,	66,		true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Racial_BearForm'},
		{'Dire Bear Form',		false,	100,	false,	66,		true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Racial_BearForm'},
		{'Aquatic Form',		false,	false,	false,	100,	true,	true,	false,	false,	false,	true,	'Interface\\Icons\\Ability_Druid_AquaticForm'},
		{'Cat Form',			false,	100,	false,	66,		true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Druid_CatForm'},
		{'Travel Form',			2,		140,	false,	false,	true,	false,	false,	true,	false,	false,	'Interface\\Icons\\Ability_Druid_TravelForm'},
		{'Moonkin Form',		false,	100,	false,	66,		true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Spell_Nature_ForceOfNature'},
		{'Tree of Life',		false,	100,	false,	66,		true,	true,	false,	true,	false,	true,	'Interface\\Icons\\Ability_Druid_TreeofLife'},
		{'Flight Form',			5,		false,	160,	false,	false,	false,	true,	true,	true,	false,	'Interface\\Icons\\Ability_Druid_FlightForm'},
		{'Swift Flight Form',	6,		false,	380,	false,	false,	false,	true,	true,	true,	false,	'Interface\\Icons\\Ability_Druid_FlightForm'},
	}

function SmartMount:InitClick()
	self.InitedClick = true

	self.SpecialSpells = {}

	-- setup the variable mounts!!
	local skill, gskill = 0, 0
	for skillIndex = 1, GetNumSkillLines() do
		skillName, isHeader, isExpanded, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType, skillDescription = GetSkillLineInfo(skillIndex)
		if skillName == self.SpellLocale['Riding'] then
			skill = skillRank
		end -- if
	end -- if
	if skill >= 300 then
		skill = 6
		gskill = 4
	elseif skill >= 225 then
		skill = 5
		gskill = 4
	elseif skill >= 150 then
		skill = 4
		gskill = 4
	elseif skill >= 75 then
		skill = 3
		gskill = 3
	else
		skill = 1
		gskill = 1
	end -- if
--[[	self:dump('skill', skill)
	self.Mounts[48025] = skill -- The Horseman's Reins
	self.Mounts[54729] = skill -- Winged Steed of the Ebon Blade
	self.Mounts[58983] = gskill -- Big Blizzard Bear
	self.Mounts[75596] = skill -- Frosty Flying Carpet
	self.Mounts[75614] = skill -- Celestial Steed ]]--
	self.MountGSkill = gskill
	self.MountFSkill = skill
	-- /setup
	
	-- check for spells...
	for _, spell in pairs(self.InitSpells) do
		local locspell = self.SpellLocale[spell[1]]
		
		self.SpecialSpells['spell:' .. spell[1]] = {
			type = 'spell',
			spell = locspell,
			name = locspell,
			can = GetSpellTexture(locspell),
			mount = spell[2],
			land = spell[3],
			fly = spell[4],
			swim = spell[5],
			incombat = spell[6],
			inwater = spell[7],
			inair = spell[8],
			onground = spell[9],
			outlandonly = spell[10],
			inhouse = spell[11],
			icon = spell[12],
			instant = spell[13],
		}
	end -- for
	
	local _, myclass = UnitClass('player')
	if myclass == 'SHAMAN' then
		-- I'm an Shaman
		local name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(self.SpellLocale['Ghost Wolf'])
		if castTime == 0 then
			self.SpecialSpells['spell:Ghost Wolf'].instant = true
		end -- if
	end -- if
	
	-- check for shapeshift forms
	for _, spell in pairs(self.InitShapeshifts) do
		local locspell = self.SpellLocale[spell[1]]

		local can = false
		for i=1, GetNumShapeshiftForms() do
			local _,name, _ = GetShapeshiftFormInfo(i)
			if name == locspell then
				can = true
			end -- if
		end -- for
		self.SpecialSpells['spell:' .. spell[1]] = {
			type = 'spell',
			spell = locspell,
			name = locspell,
			can = can,
			mount = spell[2],
			land = spell[3],
			fly = spell[4],
			swim = spell[5],
			incombat = spell[6],
			inwater = spell[7],
			inair = spell[8],
			onground = spell[9],
			outlandonly = spell[10],
			inhouse = spell[11],
			icon = spell[12],
			instant = true,
		}
	end -- for
	
	-- special enties
	self.SpecialSpells['special:instantform'] = {
		type = 'special',
		name = SmartMount_Locale['Travel, Flight or Swift Flight Form'],
		can = self.SpecialSpells['spell:Travel Form'].can,
		mount = 2,
		land = 140,
		fly = false,
		swim = false,
		incombat = false,
		inwater = false,
		inair = false,
		onground = true,
		outlandonly = false,
		inhouse = false,
		icon = 'Interface\\Icons\\Ability_Hunter_Pathfinding',
	}
	
	-- 'join' flight form
	if self.SpecialSpells['spell:Swift Flight Form'].can then
		-- just say, that the Flight Form has speed 6, and another spell...
		self.SpecialSpells['spell:Flight Form'].spell = self.SpecialSpells['spell:Swift Flight Form'].spell
		self.SpecialSpells['spell:Flight Form'].mount = self.SpecialSpells['spell:Swift Flight Form'].mount
		self.SpecialSpells['spell:Flight Form'].fly = self.SpecialSpells['spell:Swift Flight Form'].fly
		self.SpecialSpells['spell:Flight Form'].can = true
	end
	self.SpecialSpells['spell:Flight Form'].name = SmartMount_Locale['Flight / Swift Flight Form']
	self.SpecialSpells['spell:Swift Flight Form'] = nil
	
	-- 'join' bear form
	if self.SpecialSpells['spell:Dire Bear Form'].can then
		-- just say, that the Flight Form has speed 6, and another spell...
		self.SpecialSpells['spell:Bear Form'].spell = self.SpecialSpells['spell:Dire Bear Form'].spell
		self.SpecialSpells['spell:Bear Form'].can = true
	end
	self.SpecialSpells['spell:Bear Form'].name = SmartMount_Locale['Bear / Dire Bear Form']
	self.SpecialSpells['spell:Dire Bear Form'] = nil

	-- Hook of the Master Angler
	self.SpecialSpells['special:Hook of the Master Angler'] = {
		type = 'item',
		item = 'item:19979:0:0:0:0:0:0:',
		name = self.SpellLocale['Hook of the Master Angler'],
		spell = self.SpellLocale['Hook of the Master Angler'],
		can = self:WearItem('item:19979:'),
		mount = false,
		land = false,
		fly = false,
		swim = 100,
		incombat = true,
		inwater = true,
		inair = false,
		onground = false,
		outlandonly = false,
		inhouse = false,
		icon = [[Interface\Icons\Trade_Fishing]],
		instant = true,
	}
	
	-- Parachute Cloak
	self.SpecialSpells['special:Parachute Cloak'] = {
		type = 'item',
		item = 'item:10518:0:0:0:0:0:0:',
		name = self.SpellLocale['Parachute Cloak'],
		spell = self.SpellLocale['Parachute Cloak'],
		can = self:WearItem('item:10518:'),
		mount = false,
		land = false,
		fly = 100,
		swim = false,
		incombat = true,
		inwater = false,
		inair = true,
		onground = false,
		outlandonly = false,
		inhouse = false,
		icon = [[Interface\Icons\INV_Misc_Cape_11]],
		instant = true,
	}
	
	-- Hearthstone
	self.SpecialSpells['special:Hearthstone'] = {
		type = 'item',
		item = 'item:6948:0:0:0:0:0:0:',
		name = self.SpellLocale['Hearthstone'],
		spell = self.SpellLocale['Hearthstone'],
		can = true,
		mount = false,
		land = false,
		fly = false,
		swim = false,
		incombat = true,
		inwater = true,
		inair = false,
		onground = true,
		outlandonly = false,
		inhouse = true,
		icon = [[Interface\Icons\INV_Misc_Rune_01]],
		instant = false,
	}
	
	-- Astral Recall
	self.SpecialSpells['special:Astral Recall'] = {
		type = 'spell',
		name = self.SpellLocale['Astral Recall'],
		spell = self.SpellLocale['Astral Recall'],
		can = myclass == 'SHAMAN',
		mount = false,
		land = false,
		fly = false,
		swim = false,
		incombat = true,
		inwater = true,
		inair = false,
		onground = true,
		outlandonly = false,
		inhouse = true,
		icon = [[Interface\Icons\Spell_Nature_AstralRecal]],
		instant = false,
	}
	
	if self.rock then
		-- update the ListOfMountsCache (profile)
		-- and generate the self.ListOfMounts

		local mountspeed = { [1]={100, false}, [3]={160,false}, [4]={200,false}, [5]={160,160}, [6]={200,380}, [7]={200,410}, [17]={200,false}, [18]={self.MountGSkill,false}, [19]={self.MountFSkill,true}, [20]={self.MountFSkill,true} }

		self.ListOfMounts = {}
	
		-- count the mounts I have	
		local mounts = self:CountMounts(true, false, true)
		for i, _ in pairs(mounts) do
			for _, v in pairs(mounts[i]) do
				local _, itemName, _, itemTexture, _ = GetCompanionInfo("MOUNT", v.slot)
				if type(itemName) ~= 'string' then
					self:dump('mounts['..i..']', v)
					self:dump('itemName', itemName)
					self:dump('itemTexture', itemTexture)
				else
					-- update cache
					self:GetPref('ListOfMountsCache')[v.action] = i..':'..itemName
					--self:SetTablePref('ListOfMountsCache', v.action, i..':'..itemName)
					-- set list
					self.ListOfMounts[v.action] = {
						type = 'MOUNT',
						action = v.action,
						name = itemName,
						slot = v.slot,
						can = true,
						mount = i,
						land = mountspeed[i][1],
						fly = mountspeed[i][2],
						swim = false,
						incombat = false,
						inwater = true,
						inair = false,
						onground = true,
						outlandonly = mountspeed[i][2],
						inhouse = false,
						icon = itemTexture,
					}
				end -- if
			end -- for
		end -- for
	
		for k,v in pairs(self:GetPref('ListOfMountsCache')) do
			local found, _, speed, name = string.find(v, '(%d+):(.*)')
			if not found or string.sub(k, 1, 6) ~= 'MOUNT:' then
				self:GetPref('ListOfMountsCache')[k] = nil
				--self:SetTablePref('ListOfMountsCache', k, nil)
			elseif self.ListOfMounts[k] == nil then
				self.ListOfMounts[k] = {
					action = k,
					name = name,
					spell = name,
					can = false,
					land = mountspeed[tonumber(speed)][1],
					fly = mountspeed[tonumber(speed)][2],
					swim = false,
					incombat = false,
					inwater = true,
					inair = false,
					onground = true,
					outlandonly = mountspeed[tonumber(speed)][2],
					inhouse = false,
					icon = nil,
				}
				-- we can set icon/spell to nil, because of 'can=false'
			end -- if
		end -- for
	
		for k, v in pairs(self.SpecialSpells) do
			v['action'] = k
			self.ListOfMounts[k] = v
		end -- for
		
		for k,v in pairs(self.ListOfMounts) do
			if not v['can'] then
				if string.sub(k, 1, 5) == 'item:' then
					v['icon'] = 'Interface\\AddOns\\SmartMount\\Icons\\Mount_Item'
				elseif k == 'special:Hook of the Master Angler' then
					v['icon'] = 'Interface\\AddOns\\SmartMount\\Icons\\Special_Hook'
				elseif (v.land and v.land > 100) or (v.fly and v.fly > 100) then
					v['icon'] = 'Interface\\AddOns\\SmartMount\\Icons\\Mount_Spell'
				else
					v['icon'] = 'Interface\\AddOns\\SmartMount\\Icons\\Spell'
				end -- if
			end -- if
		end -- do
	end
	
	local hasinstant = false
	for _,v in pairs(self.SpecialSpells) do
		if v.instant then
			hasinstant = true
		end -- if
	end
		self:dump('hasinstant', hasinstant)
	
	self:PostClick('LeftButton')
	self:PostClick('RightButton')
	self:PostClick('MiddleButton')
	
end

function SmartMount:HijackBindings(showmessage)
    self:dump('hijack');
	
	if showmessage then
		DEFAULT_CHAT_FRAME:AddMessage('|cff3fcf26SmartMount|r: Please press the key again to use SmartMount.')
	end -- if

	-- normal bindings
	ClearOverrideBindings(SmartMount_Button)
	
	local key1, key2 = GetBindingKey('SMARTMOUNT_MOUNTORCONFIG')
	if key1 then
		SetOverrideBindingClick(SmartMount_Button, true, key1, 'SmartMount_Button', 'LeftButton')
	end --if
	if key2 then
		SetOverrideBindingClick(SmartMount_Button, true, key2, 'SmartMount_Button', 'LeftButton')
	end --if
end


function SmartMount:PreClick(btn, button)
self:dump('pc', btn)
	local config

	if btn == 'MiddleButton' then
		config = 3
	elseif btn == 'RightButton' then
		config = 2
	else -- if btn == 'LeftButton' then
		config = 1
	end -- if

	local mounted = nil
	
	if CanExitVehicle() then
		mounted = 'vehicle'
	elseif IsMounted() then
		mounted = 'regular'
	end -- if
	
	for _, spell in pairs(self.SpecialSpells) do
		if spell['spell'] and spell['mount'] and UnitBuff('player', spell['spell']) then
			mounted = spell['spell']
		end -- if
	end -- for

	local name, mode
	if InCombatLockdown() then
		name = 'combat'
	elseif IsSwimming() then
		name = 'swim'
	elseif IsFlying() or IsFalling() then
		name = 'fly'
	else
		name = 'land'
	end -- if
	
	local _, myclass = UnitClass('player')
	if not mounted and myclass == 'DRUID' then
		for i=1, GetNumShapeshiftForms() do
			local _, name, active, _ = GetShapeshiftFormInfo(i)
			self:dump(i, {name, active})
			if active then
				mounted = name
			end -- if
		end -- for
	end -- if

	self:dump('preclick', {cfg = config, name = name, mounted = mounted})

	if mounted then
		mode = 'dis'
		
		if not self:GetPref('c'..config..'-'..name..'-dis-do') then
			-- cancel here, cause we would'nt dismount
			if name ~= 'combat' then
				-- if in combat: don't change button; otherwise: don't do anything
				self:SetAttributes(config, {})
			end -- if
			return
		end
	
		if name == 'fly' and self:GetPref('c'..config..'-'..name..'-dis-do-groundonly') and IsFlying() then
			-- cancel here, cause we would'nt dismount
			self:SetAttributes(config, {})
			return
		end
	
	    if mounted == 'regular' then
			Dismount()
		elseif mounted == 'vehicle' then
			if not self:GetPref('ExitVehicle') then
				self:SetAttributes(config, {})
				return
			end -- if
			VehicleExit()
		else
--			CancelUnitBuff('player', mounted)
			self:SetAttributes(config, {type='spell', spell=mounted})
			return
		end -- if
	else
		mode = 'mnt'
	end -- if
	
	self:dump('preclick-mode:', mode)
	
	if name == 'combat' then
		-- cancel here, cause we can't do anything
		return
	end -- if
		
	local chgbutton = self:GetMount('c'..config..'-'..name..'-'..mode..'-try', name, false) or {}
	-- or => if nothing found: nothing

	self:dump('preclick-button', chgbutton)
	
	self:SetAttributes(config, chgbutton, button)
end

function SmartMount:PostClick(btn, button)
	if btn == 'MiddleButton' then
		config = 3
	elseif btn == 'RightButton' then
		config = 2
	else -- if btn == 'LeftButton' then
		config = 1
	end -- if
	self:dump('postclick', config)

	if not InCombatLockdown() then
		local chgbutton = self:GetMount('c'..config..'-combat-mnt-try', 'combat', true) or {}
		-- or => if nothing found: nothing

		self:dump('postclick-button', chgbutton)
	
		self:SetAttributes(config, chgbutton, button)
	end
end

function SmartMount:SetAttributes(config, attr, button)
	local buttons
	if button == nil then
		buttons = self.Buttons
	else
		buttons = { button }
	end -- if
	for _, btn in pairs(buttons) do
		if attr['type'] == 'MOUNT' or attr['type'] == 'CRITTER' then
			CallCompanion(attr['type'], attr['slot'])
			btn:SetAttribute('type'..config, nil)
			btn:SetAttribute('spell'..config, nil)
			btn:SetAttribute('item'..config, nil)
			btn:SetAttribute('unit'..config, nil)
		else
			btn:SetAttribute('type'..config, attr['type'])
			btn:SetAttribute('spell'..config, attr['spell'])
			btn:SetAttribute('item'..config, attr['item'])
			btn:SetAttribute('unit'..config, 'player')
		end -- if
	end -- for
end

-- some tables for mount-checking

local MountTable_FlyFirst = {
	{7, 6}, 5, 17, 4, 3, 2, 1
}

local MountTable_FastestFirst = {
	7, 6, 17, 4, 5, 3, 2, 1
}

local MountTable_GroundOnly = {
	17, 4, 3, 2, 1,
}

function SmartMount:MyUnit()
	if UnitInVehicle('player') then
		return 'vehicle'
	else
		return 'player'
	end -- if
end

function SmartMount:xor(a, b)
	return (a and not b) or (not a and b)
end

function SmartMount:GetRandomPet()
	local useable = {}
	for slot = 1 , GetNumCompanions('CRITTER') do
		local _, _, creatureSpellID, _, issummoned = GetCompanionInfo('CRITTER', slot)
		if not issummoned and not self:xor(self:GetPlayerPref('ExcludedMiniPetsWhitelist'), self:GetPlayerPref('ExcludedMiniPets')[creatureSpellID]) then
			table.insert(useable, {
				type = 'CRITTER',
				slot = slot,
			})
		end -- if
	end -- for
	if #useable > 0 then
		return useable[math.random(#useable)]
	end -- if
	return nil
end

function SmartMount:GetMount(prefix, name, ignoremoving)
	local IsMoving = GetUnitSpeed(self:MyUnit()) > 0
	if ignoremoving then
		IsMoving = false
	end
	
	local zone = GetZoneText()
	local allowed = self:GetAllowedSpeeds()
	
	for i=1, 3 do
		local mount = self:GetPref(prefix .. i)

		--self:dump(prefix..i..name, mount)

		local result = nil
		if not mount or mount == 'off' then
			return nil -- found nothing: do nothing
		elseif mount == 'rnd_fast' and IsOutdoors() then
			result = self:GetRandomMount(allowed, IsMoving, MountTable_FlyFirst)
		elseif mount == 'rnd_fast2' and IsOutdoors() then
			result = self:GetRandomMount(allowed, IsMoving, MountTable_FastestFirst)
		elseif mount == 'rnd_fast3' and IsOutdoors() then
			result = self:GetRandomMount(allowed, IsMoving, MountTable_GroundOnly)
		elseif mount == 'rnd_all' and IsOutdoors() then
			result = self:GetAnyRandomMount(allowed, IsMoving)
		elseif mount == 'rnd_pet' then
			result = self:GetRandomPet()
		elseif string.sub(mount, 1, 5) == 'item:' then
			if self:WearItem(mount) then
				result = {
					type = 'item',
					item = mount,
				}
			end -- if
		elseif ( string.sub(mount, 1, 6) == 'MOUNT:' and IsOutdoors() and not IsMoving ) or string.sub(mount, 1, 8) == 'CRITTER:' then
			self:dump(mount, self.ListOfMounts[mount])
			if self.ListOfMounts[mount].can and allowed[self.ListOfMounts[mount].mount] then
				result = {
					type = self.ListOfMounts[mount].type,
					slot = self.ListOfMounts[mount].slot,
				}
			end -- if
		elseif self.SpecialSpells[mount] then
			-- something special (which is in SpecialSpells)
			if 
				(
					(self.SpecialSpells[mount].type == 'spell' and self.SpecialSpells[mount].can) or
					(self.SpecialSpells[mount].type == 'item' and self:WearItem(self.SpecialSpells[mount].item))
				)
					and
				(
					allowed[self.ListOfMounts[mount].mount]
				)
					and
				(
					self.SpecialSpells[mount].inhouse or IsOutdoors()
				)
					and
				(
					self.SpecialSpells[mount].instant or not IsMoving
				)
					and
				(
					(name == 'swim' and self.SpecialSpells[mount].inwater) or
					(name == 'fly' and self.SpecialSpells[mount].inair) or
					(name == 'land' and self.SpecialSpells[mount].onground) or
					(name == 'combat' and self.SpecialSpells[mount].incombat)
				)
			then
				result = self.SpecialSpells[mount]
			end -- if
		end -- if
		if result then
			return result
		end -- if
	end
	return nil
end

function SmartMount:GetRandomMount(allowed, IsMoving, tab)
	-- get 'regular' mounts
	local mounts = self:CountMounts(false, IsMoving)
	
	self:dump('mounts_avail', mounts)
	self:dump('allowed', allowed)
	self:dump('tab', tab)
	
	-- pick speed category
	for _, speedtab in pairs(tab) do
		if type(speedtab) ~= 'table' then
			speedtab = {speedtab}
		end -- if
		local joinedtab = {}
		for _, speed in pairs(speedtab) do
			if allowed[speed] and #(mounts[speed]) > 0 then
				for _, v in pairs(mounts[speed]) do
					table.insert(joinedtab, v)
				end -- for
			end -- for
		end -- if
		if #(joinedtab) > 0 then
			self:dump('mounts_sele', joinedtab)
			return self:PickGroupedMount(joinedtab)
		end -- if
	end -- for
	
	return nil
end

function SmartMount:GetAnyRandomMount(allowed, IsMoving)
	-- get 'regular' mounts
	local mounts = self:CountMounts(false, IsMoving)
	
	self:dump('mounts_biglist', mounts)
	
	local biglist = {}
	
	-- pick speed category
	for speed, _ in pairs(mounts) do
		if allowed[speed] then
			for _, v in pairs(mounts[speed]) do
				table.insert(biglist, v)
			end -- for
		end -- if
	end -- for
	
	return self:PickGroupedMount(biglist)
end

function SmartMount:PickGroupedMount(list)
	if #list == 0 then
		return nil
	end -- if
	
	local groups, groupids = {}, {}
	for _, v in pairs(list) do
		local id = self.Groups[v.companionid] or v.companionid or -(#groups)
		-- -(#gorups) generates a new group for everything whithout an companionid
		if groups[id] == nil then
			groups[id] = {}
			table.insert(groupids, id)
		end -- if
		table.insert(groups[id], v)
	end -- for
	
	self:dump('mounts_groups', groups)
	local group = groups[groupids[math.random(#groupids)]]
	self:dump('mounts_group', group)
	return group[math.random(#group)]
end

function SmartMount:CountMounts(withoutSpells, IsMoving, noExcl)
	local mounts = { [1]={}, [2]={}, [3]={}, [4]={}, [5]={}, [6]={}, [7]={}, [17]={} }
	local excl = noExcl or self:GetPlayerPref('ExcludedMounts')

	if not IsMoving then
		for slot = 1, GetNumCompanions("MOUNT") do
			local creatureID, creatureName, creatureSpellID, icon, issummoned = GetCompanionInfo("MOUNT", slot)
			self:dump('mount', {creatureID, creatureName, creatureSpellID, issummoned})
			if noExcl or not self:xor(self:GetPlayerPref('ExcludedMountsWhitelist'), excl[creatureSpellID]) then
				-- only if not excluded by the user
				local speed = self.Mounts[tonumber(creatureSpellID)]
				if speed == 18 then
					-- fasted ground mount
					table.insert(mounts[self.MountGSkill], { type = 'MOUNT', slot = slot, companionid =  creatureSpellID, action = 'MOUNT:' .. creatureSpellID} )
				elseif speed == 19 then
					-- fasted mount, count as ground and flying mount
					table.insert(mounts[self.MountGSkill], { type = 'MOUNT', slot = slot, companionid =  creatureSpellID, action = 'MOUNT:' .. creatureSpellID} )
					if self.MountGSkill ~= self.MountFSkill then
						table.insert(mounts[self.MountFSkill], { type = 'MOUNT', slot = slot, companionid =  creatureSpellID, action = 'MOUNT:' .. creatureSpellID} )
					end -- if
				elseif speed == 20 then
					-- fasted flying mountt
					table.insert(mounts[self.MountFSkill], { type = 'MOUNT', slot = slot, companionid =  creatureSpellID, action = 'MOUNT:' .. creatureSpellID} )
				elseif speed then
					table.insert(mounts[speed], { type = 'MOUNT', slot = slot, companionid =  creatureSpellID, action = 'MOUNT:' .. creatureSpellID} )
				end -- if
			end -- if
		end -- for
	end -- if
	
	if not withoutSpells then
		for name, spell in pairs(self.SpecialSpells) do
			if spell.can and spell['mount'] and ( spell.instant or not IsMoving ) then
				table.insert(mounts[spell['mount']], spell)
			end -- if
		end -- for
	end -- if

	return mounts
end

function SmartMount:WearItem(item)
	-- search in bags
	for bag = 0, NUM_BAG_FRAMES do
		for slot = 1, GetContainerNumSlots(bag) do
			local link = GetContainerItemLink(bag, slot)
			if link and string.find(link, item) then
				return true
			end -- if
		end -- for
	end -- for
	
	-- search on me
	for slot = 1, 39 do
		local link = GetInventoryItemLink('player', slot)
		if link and string.find(link, item) then
			return true
		end -- if
	end -- for
	return false
end

function SmartMount:GetAllowedSpeeds()
	local zone, subzone = GetZoneText(), GetSubZoneText()
	
	local allowed = {}
	
	allowed[false] = true -- dummy entry for spells
	allowed[2] = true -- travel form / ghost wolf
	
	-- ground mounts always
	if self:CanMountHere(zone, subzone) then
		allowed[1] = true
		allowed[3] = true
		allowed[4] = true
	
		-- check flying mounts
		if self:CanFlyHere(zone, subzone) then
			allowed[5] = true
			allowed[6] = true
			allowed[7] = true
		end -- if
		
		-- check AQ mounts
		if zone == self.SpellLocale['Ahn\'Qiraj'] then
			allowed[17] = true
		end -- if
	end -- if
	
	return allowed
end

function SmartMount:CanMountHere(zone, subzone)
	--if zone == self.SpellLocale['Dalaran Arena'] then
	--	return false
	--end -- if
	return true
end

function SmartMount:CanFlyHere(zone, subzone)
	--self:dump('flyable', self.spellNameColdWeatherFlying)
	-- check for flyable area
	if not IsFlyableArea() then
		-- not flyable!
		--self:dump('flyable', 'no: not in this area')
		return false
	end -- if

	if (zone == self.SpellLocale['Wintergrasp'] and not GetWintergraspWaitTime()) then
		-- in Wintergrasp: no flying allowed
		-- thanks to TooGStyle
		--self:dump('flyable', 'wintergrasp')
		return false
	end -- if

	if GetSpellInfo(self.spellNameColdWeatherFlying) then
		--self:dump('flyable', 'yes: i have CWF')
		-- with cold weather flying we can fly everywhere
		return true
	end -- if

	-- here: flyable area AND no cold weather flying
	-- means: don't fly in northrend
	--local zone = GetZoneText()
	for _,name in pairs({GetMapZones(4)}) do
		if(name == zone) then
			--self:dump('flyable', 'no: no CWF and in Northrend')
			return false
		end -- if
	end -- for

	--self:dump('flyable', 'yes: no CWF and not in Northrend')
	return true
end

SmartMount.Mounts = {
	-- 1 = Riding Skill 0 / Speed 100% (±0%)
	[6896] = 1, -- Harness: Black Ram, Lvl 40
	[6897] = 1, -- Harness: Blue Ram, Lvl 40
	[10787] = 1, -- Reins of the Night saber, Lvl 40
	[10792] = 1, -- Reins of the Spotted Nightsaber, Lvl 40
	[18363] = 1, -- Kodo Mount, Lvl 40
	[30174] = 1, -- Riding Turtle, Lvl 1
	[42692] = 1, -- Rickety Magic Broom, Lvl 1
	[64749] = 1, -- Loaned Gryphon Reins, Lvl 77
	[64762] = 1, -- Loaned Wind Rider Reins, Lvl 77
	-- 3 = Riding Skill 75 / Speed +60%
	[458] = 3, -- Brown Horse Bridle, Lvl 20
	[470] = 3, -- Black Stallion Bridle, Lvl 30
	[472] = 3, -- Pinto Bridle, Lvl 20
	[580] = 3, -- Horn of the Timber Wolf, Lvl 30
	[6648] = 3, -- Chestnut Mare Bridle, Lvl 20
	[6653] = 3, -- Horn of the Dire Wolf, Lvl 30
	[6654] = 3, -- Horn of the Brown Wolf, Lvl 30
	[6777] = 3, -- Gray Ram, Lvl 30
	[6898] = 3, -- White Ram, Lvl 30
	[6899] = 3, -- Brown Ram, Lvl 30
	[8394] = 3, -- Reins of the Striped Frostsaber, Lvl 30
	[8395] = 3, -- Whistle of the Emerald Raptor, Lvl 30
	[10789] = 3, -- Reins of the Spotted Frostsaber, Lvl 30
	[10793] = 3, -- Reins of the Striped Nightsaber, Lvl 30
	[10796] = 3, -- Whistle of the Turquoise Raptor, Lvl 30
	[10799] = 3, -- Whistle of the Violet Raptor, Lvl 30
	[10873] = 3, -- Red Mechanostrider, Lvl 30
	[10969] = 3, -- Blue Mechanostrider, Lvl 30
	[16058] = 3, -- Reins of the Primal Leopard, Lvl 30
	[16059] = 3, -- Reins of the Tawny Sabercat, Lvl 30
	[16060] = 3, -- Reins of the Golden Sabercat, Lvl 30
	[17453] = 3, -- Green Mechanostrider, Lvl 30
	[17454] = 3, -- Unpainted Mechanostrider, Lvl 30
	[17455] = 3, -- Purple Mechanostrider, Lvl 30
	[17462] = 3, -- Red Skeletal Horse, Lvl 30
	[17463] = 3, -- Blue Skeletal Horse, Lvl 30
	[17464] = 3, -- Brown Skeletal Horse, Lvl 30
	[18989] = 3, -- Gray Kodo, Lvl 30
	[18990] = 3, -- Brown Kodo, Lvl 30
	[22717] = 3, -- Black War Steed Bridle, Lvl 55
	[22718] = 3, -- Black War Kodo, Lvl 55
	[22719] = 3, -- Black Battlestrider, Lvl 55
	[22720] = 3, -- Black War Ram, Lvl 55
	[22721] = 3, -- Whistle of the Black War Raptor, Lvl 55
	[22722] = 3, -- Red Skeletal Warhorse, Lvl 55
	[22723] = 3, -- Reins of the Black War Tiger, Lvl 55
	[22724] = 3, -- Horn of the Black War Wolf, Lvl 55
	[34406] = 3, -- Brown Elekk, Lvl 20
	[34795] = 3, -- Red Hawkstrider, Lvl 30
	[35018] = 3, -- Purple Hawkstrider, Lvl 30
	[35020] = 3, -- Blue Hawkstrider, Lvl 30
	[35022] = 3, -- Black Hawkstrider, Lvl 30
	[35710] = 3, -- Gray Elekk, Lvl 20
	[35711] = 3, -- Purple Elekk, Lvl 20
	[42680] = 3, -- Old Magic Broom, Lvl 40
	[42776] = 3, -- Reins of the Spectral Tiger, Lvl 20
	[43899] = 3, -- Brewfest Ram, Lvl 20
	[47977] = 3, -- Magic Broom, Lvl 30
	[50869] = 3, -- Brewfest Kodo, Lvl 30
	[64657] = 3, -- White Kodo, Lvl 20
	[64658] = 3, -- Horn of the Black Wolf, Lvl 20
	[64731] = 3, -- Sea Turtle, Lvl 1
	[64977] = 3, -- Black Skeletal Horse, Lvl 20
	[66847] = 3, -- Striped Dawnsaber, Lvl 40
	[72286] = 3, -- Invincible's Reins, Lvl 20
	[73313] = 3, -- Reins of the Crimson Deathcharger, Lvl 20
	-- 4 = Riding Skill 150 / Speed +100%
	[15779] = 4, -- White Mechanostrider Mod B, Lvl 60
	[16055] = 4, -- Reins of the Nightsaber, Lvl 60
	[16056] = 4, -- Reins of the Ancient Frostsaber, Lvl 60
	[16080] = 4, -- Horn of the Red Wolf, Lvl 60
	[16081] = 4, -- Horn of the Arctic Wolf, Lvl 60
	[16082] = 4, -- Palomino Bridle, Lvl 60
	[16083] = 4, -- White Stallion Bridle, Lvl 60
	[16084] = 4, -- Whistle of the Mottled Red Raptor, Lvl 40
	[17229] = 4, -- Reins of the Winterspring Frostsaber, Lvl 60
	[17450] = 4, -- Whistle of the Ivory Raptor, Lvl 40
	[17459] = 4, -- Icy Blue Mechanostrider Mod A, Lvl 60
	[17460] = 4, -- Frost Ram, Lvl 60
	[17461] = 4, -- Black Ram, Lvl 40
	[17465] = 4, -- Green Skeletal Warhorse, Lvl 60
	[17481] = 4, -- Deathcharger's Reins, Lvl 60
	[18991] = 4, -- Green Kodo, Lvl 60
	[18992] = 4, -- Teal Kodo, Lvl 60
	[22717] = 4, -- Black War Steed Bridle, Lvl 60
	[22718] = 4, -- Black War Kodo, Lvl 60
	[22719] = 4, -- Black Battlestrider, Lvl 60
	[22720] = 4, -- Black War Ram, Lvl 60
	[22721] = 4, -- Whistle of the Black War Raptor, Lvl 60
	[22722] = 4, -- Red Skeletal Warhorse, Lvl 60
	[22723] = 4, -- Reins of the Black War Tiger, Lvl 60
	[22724] = 4, -- Horn of the Black War Wolf, Lvl 60
	[23219] = 4, -- Reins of the Swift Mistsaber, Lvl 60
	[23220] = 4, -- Reins of the Swift Dawnsaber, Lvl 60
	[23221] = 4, -- Reins of the Swift Frostsaber, Lvl 60
	[23222] = 4, -- Swift Yellow Mechanostrider, Lvl 60
	[23223] = 4, -- Swift White Mechanostrider, Lvl 60
	[23225] = 4, -- Swift Green Mechanostrider, Lvl 60
	[23227] = 4, -- Swift Palomino, Lvl 40
	[23228] = 4, -- Swift White Steed, Lvl 40
	[23229] = 4, -- Swift Brown Steed, Lvl 40
	[23238] = 4, -- Swift Brown Ram, Lvl 60
	[23239] = 4, -- Swift Gray Ram, Lvl 60
	[23240] = 4, -- Swift White Ram, Lvl 60
	[23241] = 4, -- Swift Blue Raptor, Lvl 60
	[23242] = 4, -- Swift Olive Raptor, Lvl 60
	[23243] = 4, -- Swift Orange Raptor, Lvl 60
	[23246] = 4, -- Purple Skeletal Warhorse, Lvl 60
	[23247] = 4, -- Great White Kodo, Lvl 60
	[23248] = 4, -- Great Gray Kodo, Lvl 60
	[23249] = 4, -- Great Brown Kodo, Lvl 60
	[23250] = 4, -- Horn of the Swift Brown Wolf, Lvl 60
	[23251] = 4, -- Horn of the Swift Timber Wolf, Lvl 60
	[23252] = 4, -- Horn of the Swift Gray Wolf, Lvl 60
	[23338] = 4, -- Reins of the Swift Stormsaber, Lvl 60
	[23509] = 4, -- Horn of the Frostwolf Howler, Lvl 60
	[23510] = 4, -- Stormpike Battle Charger, Lvl 60
	[24242] = 4, -- Swift Razzashi Raptor, Lvl 40
	[24252] = 4, -- Swift Zulian Tiger, Lvl 60
	[26656] = 4, -- Black Qiraji Resonating Crystal, Lvl 60
	[33660] = 4, -- Swift Pink Hawkstrider, Lvl 60
	[34407] = 4, -- Great Elite Elekk, Lvl 60
	[34790] = 4, -- Reins of the Dark War Talbuk, Lvl 60
	[34896] = 4, -- Reins of the Cobalt War Talbuk, Lvl 40
	[34897] = 4, -- Reins of the White War Talbuk, Lvl 40
	[34898] = 4, -- Reins of the Silver War Talbuk, Lvl 40
	[34899] = 4, -- Reins of the Tan War Talbuk, Lvl 40
	[35025] = 4, -- Swift Green Hawkstrider, Lvl 60
	[35027] = 4, -- Swift Purple Hawkstrider, Lvl 60
	[35028] = 4, -- Swift Warstrider, Lvl 60
	[35712] = 4, -- Great Green Elekk, Lvl 40
	[35713] = 4, -- Great Blue Elekk, Lvl 40
	[35714] = 4, -- Great Purple Elekk, Lvl 40
	[36702] = 4, -- Fiery Warhorse's Reins, Lvl 70
	[39315] = 4, -- Reins of the Cobalt Riding Talbuk, Lvl 40
	[39316] = 4, -- Reins of the Dark Riding Talbuk, Lvl 60
	[39317] = 4, -- Reins of the Silver Riding Talbuk, Lvl 40
	[39318] = 4, -- Reins of the Tan Riding Talbuk, Lvl 40
	[39319] = 4, -- Reins of the White Riding Talbuk, Lvl 40
	[41252] = 4, -- Reins of the Raven Lord, Lvl 70
	[42668] = 4, -- Swift Magic Broom, Lvl 60
	[42777] = 4, -- Reins of the Swift Spectral Tiger, Lvl 40
	[43688] = 4, -- Amani War Bear, Lvl 70
	[43900] = 4, -- Swift Brewfest Ram, Lvl 40
	[46628] = 4, -- Swift White Hawkstrider, Lvl 60
	[48027] = 4, -- Reins of the Black War Elekk, Lvl 60
	[49322] = 4, -- Swift Zhevra, Lvl 40
	[49379] = 4, -- Great Brewfest Kodo, Lvl 40
	[51412] = 4, -- Big Battle Bear, Lvl 40
	[54753] = 4, -- Reins of the White Polar Bear, Lvl 60
	[55531] = 4, -- Mechano-hog, Lvl 80
	[59572] = 4, -- Reins of the Black Polar Bear, Lvl 60
	[59573] = 4, -- Reins of the Brown Polar Bear, Lvl 60
	[59785] = 4, -- Reins of the Black War Mammoth, Lvl 60
	[59788] = 4, -- Reins of the Black War Mammoth, Lvl 60
	[59791] = 4, -- Reins of the Wooly Mammoth, Lvl 40
	[59793] = 4, -- Reins of the Wooly Mammoth, Lvl 60
	[59797] = 4, -- Reins of the Ice Mammoth, Lvl 60
	[59799] = 4, -- Reins of the Ice Mammoth, Lvl 40
	[60114] = 4, -- Reins of the Armored Brown Bear, Lvl 40
	[60116] = 4, -- Reins of the Armored Brown Bear, Lvl 60
	[60118] = 4, -- Reins of the Black War Bear, Lvl 60
	[60119] = 4, -- Reins of the Black War Bear, Lvl 60
	[60424] = 4, -- Mekgineer's Chopper, Lvl 80
	[61425] = 4, -- Reins of the Traveler's Tundra Mammoth, Lvl 40
	[61447] = 4, -- Reins of the Traveler's Tundra Mammoth, Lvl 60
	[61465] = 4, -- Reins of the Grand Black War Mammoth, Lvl 60
	[61467] = 4, -- Reins of the Grand Black War Mammoth, Lvl 60
	[61469] = 4, -- Reins of the Grand Ice Mammoth, Lvl 60
	[61470] = 4, -- Reins of the Grand Ice Mammoth, Lvl 40
	[63232] = 4, -- Stormwind Steed, Lvl 40
	[63635] = 4, -- Swift Darkspear Raptor, Lvl 60
	[63636] = 4, -- Ironforge Ram, Lvl 60
	[63637] = 4, -- Darnassian Nightsaber, Lvl 40
	[63638] = 4, -- Gnomeregan Mechanostrider, Lvl 60
	[63639] = 4, -- Exodar Elekk, Lvl 60
	[63640] = 4, -- Swift Orgrimmar Wolf, Lvl 60
	[63641] = 4, -- Great Mulgore Kodo, Lvl 60
	[63642] = 4, -- Silvermoon Hawkstrider, Lvl 60
	[63643] = 4, -- Forsaken Warhorse, Lvl 60
	[64656] = 4, -- Blue Skeletal Warhorse, Lvl 60
	[64659] = 4, -- Whistle of the Venomhide Ravasaur, Lvl 40
	[65637] = 4, -- Great Red Elekk, Lvl 60
	[65638] = 4, -- Swift Moonsaber, Lvl 60
	[65639] = 4, -- Swift Red Hawkstrider, Lvl 60
	[65640] = 4, -- Swift Gray Steed, Lvl 40
	[65641] = 4, -- Great Golden Kodo, Lvl 60
	[65642] = 4, -- Turbostrider, Lvl 60
	[65643] = 4, -- Swift Violet Ram, Lvl 60
	[65644] = 4, -- Swift Purple Raptor, Lvl 60
	[65645] = 4, -- White Skeletal Warhorse, Lvl 60
	[65646] = 4, -- Swift Burgundy Wolf, Lvl 60
	[65917] = 4, -- Magic Rooster Egg, Lvl 40
	[66090] = 4, -- Quel'dorei Steed, Lvl 40
	[66091] = 4, -- Sunreaver Hawkstrider, Lvl 40
	[66846] = 4, -- Ochre Skeletal Warhorse, Lvl 40
	[66906] = 4, -- Argent Charger, Lvl 40
	[67466] = 4, -- Argent Warhorse, Lvl 40
	[68056] = 4, -- Swift Horde Wolf, Lvl 40
	[68057] = 4, -- Swift Alliance Steed, Lvl 40
	[68187] = 4, -- Crusader's White warhorse, Lvl 40
	[68188] = 4, -- Crusader's Black Warhorse, Lvl 40
	[72286] = 4, -- Invincible, Lvl 40
	-- 5 = Riding Skill 225 / Speed +60%/+60%
	[32235] = 5, -- Golden Gryphon, Lvl 60
	[32239] = 5, -- Ebon Gryphon, Lvl 60
	[32240] = 5, -- Snowy Gryphon, Lvl 60
	[32243] = 5, -- Tawny Wind Rider, Lvl 70
	[32244] = 5, -- Blue Wind Rider, Lvl 70
	[32245] = 5, -- Green Wind Rider, Lvl 70
	[42667] = 5, -- Flying Broom, Lvl 70
	[44153] = 5, -- Flying Machine Control, Lvl 70
	[46197] = 5, -- X-51 Nether-Rocket, Lvl 60
	[54197] = 5, -- Tome of Cold Weather Flight, Lvl 68
	[61451] = 5, -- Flying Carpet, Lvl 70
	[74856] = 5, -- Blazing Hippogryph, Lvl 60
	-- 6 = Riding Skill 300 / Speed +100%/+280%
	[32242] = 6, -- Swift Blue Gryphon, Lvl 70
	[32246] = 6, -- Swift Red Wind Rider, Lvl 70
	[32289] = 6, -- Swift Red Gryphon, Lvl 70
	[32290] = 6, -- Swift Green Gryphon, Lvl 70
	[32292] = 6, -- Swift Purple Gryphon, Lvl 70
	[32295] = 6, -- Swift Green Wind Rider, Lvl 70
	[32296] = 6, -- Swift Yellow Wind Rider, Lvl 70
	[32297] = 6, -- Swift Purple Wind Rider, Lvl 70
	[39798] = 6, -- Green Riding Nether Ray, Lvl 70
	[39800] = 6, -- Red Riding Nether Ray, Lvl 70
	[39801] = 6, -- Purple Riding Nether Ray, Lvl 70
	[39802] = 6, -- Silver Riding Nether Ray, Lvl 70
	[39803] = 6, -- Blue Riding Nether Ray, Lvl 70
	[41513] = 6, -- Reins of the Onyx Netherwing Drake, Lvl 70
	[41514] = 6, -- Reins of the Azure Netherwing Drake, Lvl 70
	[41515] = 6, -- Reins of the Cobalt Netherwing Drake, Lvl 70
	[41516] = 6, -- Reins of the Purple Netherwing Drake, Lvl 70
	[41517] = 6, -- Reins of the Veridian Netherwing Drake, Lvl 70
	[41518] = 6, -- Reins of the Violet Netherwing Drake, Lvl 70
	[42668] = 6, -- Swift Flying Broom, Lvl 70
	[43927] = 6, -- Cenarion War Hippogryph, Lvl 70
	[44151] = 6, -- Turbo-Charged Flying Machine Control, Lvl 70
	[44744] = 6, -- Merciless Nether Drake, Lvl 70
	[46199] = 6, -- X-51 Nether-Rocket X-TREME, Lvl 70
	[52649] = 6, -- Swift Ebonweave Carpet, Lvl 70
	[58615] = 6, -- Brutal Nether Drake, Lvl 70
	[59567] = 6, -- Reins of the Azure Drake, Lvl 70
	[59568] = 6, -- Reins of the Blue Drake, Lvl 70
	[59569] = 6, -- Reins of the Bronze Drake, Lvl 70
	[59570] = 6, -- Reins of the Red Drake, Lvl 70
	[59571] = 6, -- Reins of the Twilight Drake, Lvl 70
	[59650] = 6, -- Reins of the Black Drake, Lvl 70
	[59961] = 6, -- Reins of the Red Proto-Drake, Lvl 70
	[59996] = 6, -- Reins of the Blue Proto-Drake, Lvl 80
	[60002] = 6, -- Reins of the Time-Lost Proto-Drake, Lvl 80
	[60025] = 6, -- Reins of the Albino Drake, Lvl 70
	[61229] = 6, -- Armored Snowy Gryphon, Lvl 70
	[61230] = 6, -- Armored Blue Wind Rider, Lvl 70
	[61294] = 6, -- Reins of the Green Proto-Drake, Lvl 80
	[61309] = 6, -- Magnificent Flying Carpet, Lvl 70
	[61996] = 6, -- Blue Dragonhawk Mount, Lvl 70
	[61997] = 6, -- Red Dragonhawk Mount, Lvl 70
	[63844] = 6, -- Argent Hippogryph, Lvl 70
	[65439] = 6, -- Furious Gladiator's Frost Wyrm, Lvl 70
	[66087] = 6, -- Silver Covenant Hippogryph, Lvl 70
	[66088] = 6, -- Sunreaver Dragonhawk, Lvl 70
	[72808] = 6, -- Reins of the Bloodbathed Frostbrood Vanquisher, Lvl 70
	[75596] = 6, -- Frosty Flying Carpet, Lvl 70
	-- 7 = Riding Skill 310 / Speed +100%/+310%
	[37015] = 7, -- Swift Nether Drake, Lvl 70
	[40192] = 7, -- Ashes of Al'ar, Lvl 70
	[49193] = 7, -- Vengeful Nether Drake, Lvl 70
	[59976] = 7, -- Reins of the Black Proto-Drake, Lvl 70
	[60021] = 7, -- Reins of the Plagued Proto-Drake, Lvl 70
	[60024] = 7, -- Reins of the Violet Proto-Drake, Lvl 70
	[63796] = 7, -- Mimiron's Head, Lvl 70
	[63956] = 7, -- Reins of the Ironbound Proto-Drake, Lvl 70
	[63963] = 7, -- Reins of the Rusted Proto-Drake, Lvl 70
	[65439] = 7, -- Furious Gladiator's Frost Wyrm, Lvl 70
	[67336] = 7, -- Relentless Gladiator's Frost Wyrm, Lvl 70
	[69395] = 7, -- Reins of the Onyxian Drake, Lvl 70
	[71342] = 7, -- Big Love Rocket, Lvl 70
	[71810] = 7, -- Wrathful Gladiator's Frost Wyrm, Lvl 70
	[72807] = 7, -- Icebound Frostbrood Vanquisher, Lvl 70
	[72808] = 7, -- Bloodbathed Frostbrood Vanquisher, Lvl 70
	-- 17 = AQ ONLY: Riding Skill 150 / Speed +100%
	[25953] = 17, -- Blue Qiraji Resonating Crystal, Lvl 60
	[26054] = 17, -- Red Qiraji Resonating Crystal, Lvl 60
	[26055] = 17, -- Yellow Qiraji Resonating Crystal, Lvl 60
	[26056] = 17, -- Green Qiraji Resonating Crystal, Lvl 60
	-- Dynamic Riding Skill / Max Ground Speed
	[58983] = 18, -- Big Blizzard Bear, Lvl 30
	-- Dynamic Riding Skill / Max Speed
	[48025] = 19, -- The Horseman's Reins, Lvl 40
	[75614] = 19, -- Celestial Steed, Lvl 20
	-- Dynamic Riding Skill / Max Flying Speed
	[54729] = 20, -- Winged Steed of the Ebon Blade, Lvl 60
	[75973] = 20, -- X-53 Touring Rocket, Lvl 60
}

-- Paladin, Warlock & Deathknight
SmartMount.Mounts[13819] = 3 -- Warhorse (Alliance)
SmartMount.Mounts[23214] = 4 -- Charger (Alliance)
SmartMount.Mounts[34769] = 3 -- Summon Warhorse (Horde)
SmartMount.Mounts[34767] = 4 -- Summon Charger (Horde) 
SmartMount.Mounts[1710] = 3 -- Felsteed
SmartMount.Mounts[5784] = 3 -- Felsteed
SmartMount.Mounts[23161] = 4 -- Dreadsteed
SmartMount.Mounts[48778] = 4 -- Acherus Deathcharger, Lvl 55 

SmartMount.Groups = {
	[458] = 458, -- Brown Horse Bridle, Lvl 30
	[470] = 458, -- Black Stallion Bridle, Lvl 30
	[472] = 458, -- Pinto Bridle, Lvl 30
	[6648] = 458, -- Chestnut Mare Bridle, Lvl 30
	[580] = 580, -- Horn of the Timber Wolf
	[6653] = 580, -- Horn of the Dire Wolf
	[6654] = 580, -- Horn of the Brown Wolf
	[6777] = 6777, -- Gray Ram
	[6898] = 6777, -- White Ram
	[6899] = 6777, -- Brown Ram
	[6896] = 6896, -- Harness: Black Ram
	[6897] = 6896, -- Harness: Blue Ram
	[8394] = 8394, -- Reins of the Striped Frostsaber
	[10789] = 8394, -- Reins of the Spotted Frostsaber
	[10793] = 8394, -- Reins of the Striped Nightsaber
	[8395] = 8395, -- Whistle of the Emerald Raptor
	[10796] = 8395, -- Whistle of the Turquoise Raptor
	[10799] = 8395, -- Whistle of the Violet Raptor
	[10873] = 10873, -- Red Mechanostrider
	[10969] = 10873, -- Blue Mechanostrider
	[17453] = 10873, -- Green Mechanostrider
	[17454] = 10873, -- Unpainted Mechanostrider
	[16080] = 16080, -- Horn of the Red Wolf
	[16081] = 16080, -- Horn of the Arctic Wolf
	[17460] = 17460, -- Frost Ram
	[17461] = 17460, -- Black Ram
	[17462] = 17462, -- Red Skeletal Horse
	[17463] = 17462, -- Blue Skeletal Horse
	[17464] = 17462, -- Brown Skeletal Horse
	[17465] = 17465, -- Green Skeletal Warhorse
	[23246] = 17465, -- Purple Skeletal Warhorse
	[18989] = 18989, -- Gray Kodo
	[18990] = 18989, -- Brown Kodo
	[18991] = 18991, -- Green Kodo
	[18992] = 18991, -- Teal Kodo
	[23219] = 23219, -- Reins of the Swift Mistsaber
	[23221] = 23219, -- Reins of the Swift Frostsaber
	[23338] = 23219, -- Reins of the Swift Stormsaber
	[23222] = 23222, -- Swift Yellow Mechanostrider
	[23223] = 23222, -- Swift White Mechanostrider
	[23225] = 23222, -- Swift Green Mechanostrider
	[23227] = 23227, -- Swift Palomino, Lvl 60
	[23228] = 23227, -- Swift White Steed
	[23229] = 23227, -- Swift Brown Steed
	[23238] = 23238, -- Swift Brown Ram
	[23239] = 23238, -- Swift Gray Ram
	[23240] = 23238, -- Swift White Ram
	[43900] = 23238, -- Swift Brewfest Ram
	[23241] = 23241, -- Swift Blue Raptor
	[23242] = 23241, -- Swift Olive Raptor
	[23243] = 23241, -- Swift Orange Raptor
	[24242] = 23241, -- Swift Razzashi Raptor
	[23247] = 23247, -- Great White Kodo
	[23248] = 23247, -- Great Gray Kodo
	[23249] = 23247, -- Great Brown Kodo
	[49379] = 23247, -- Great Brewfest Kodo
	[23250] = 23250, -- Horn of the Swift Brown Wolf
	[23251] = 23250, -- Horn of the Swift Timber Wolf
	[23252] = 23250, -- Horn of the Swift Gray Wolf
	[25953] = 25953, -- Blue Qiraji Resonating Crystal
	[26054] = 25953, -- Red Qiraji Resonating Crystal
	[26055] = 25953, -- Yellow Qiraji Resonating Crystal
	[26056] = 25953, -- Green Qiraji Resonating Crystal
	[32235] = 32235, -- Golden Gryphon
	[32239] = 32235, -- Ebon Gryphon
	[32240] = 32235, -- Snowy Gryphon
	[32242] = 32242, -- Swift Blue Gryphon
	[32289] = 32242, -- Swift Red Gryphon
	[32290] = 32242, -- Swift Green Gryphon
	[32292] = 32242, -- Swift Purple Gryphon
	[32243] = 32243, -- Tawny Wind Rider
	[32244] = 32243, -- Blue Wind Rider
	[32245] = 32243, -- Green Wind Rider
	[32246] = 32246, -- Swift Red Wind Rider
	[32295] = 32246, -- Swift Green Wind Rider
	[32296] = 32246, -- Swift Yellow Wind Rider
	[32297] = 32246, -- Swift Purple Wind Rider
	[33660] = 33660, -- Swift Pink Hawkstrider
	[35025] = 33660, -- Swift Green Hawkstrider
	[35027] = 33660, -- Swift Purple Hawkstrider
	[46628] = 33660, -- Swift White Hawkstrider
	[34406] = 34406, -- Brown Elekk
	[35710] = 34406, -- Gray Elekk
	[35711] = 34406, -- Purple Elekk
	[34790] = 34790, -- Reins of the Dark War Talbuk
	[34896] = 34790, -- Reins of the Cobalt War Talbuk
	[34897] = 34790, -- Reins of the White War Talbuk
	[34898] = 34790, -- Reins of the Silver War Talbuk
	[34899] = 34790, -- Reins of the Tan War Talbuk
	[39315] = 39315, -- Reins of the Cobalt Riding Talbuk
	[39316] = 39315, -- Reins of the Dark Riding Talbuk
	[39317] = 39315, -- Reins of the Silver Riding Talbuk
	[39318] = 39315, -- Reins of the Tan Riding Talbuk
	[39319] = 39315, -- Reins of the White Riding Talbuk
	[34795] = 34795, -- Red Hawkstrider
	[35018] = 34795, -- Purple Hawkstrider
	[35020] = 34795, -- Blue Hawkstrider
	[35022] = 34795, -- Black Hawkstrider
	[35712] = 35712, -- Great Green Elekk
	[35713] = 35712, -- Great Blue Elekk
	[35714] = 35712, -- Great Purple Elekk
	[39798] = 39798, -- Green Riding Nether Ray
	[39800] = 39798, -- Red Riding Nether Ray
	[39801] = 39798, -- Purple Riding Nether Ray
	[39802] = 39798, -- Silver Riding Nether Ray
	[39803] = 39798, -- Blue Riding Nether Ray
	[41513] = 41513, -- Reins of the Onyx Netherwing Drake
	[41514] = 41513, -- Reins of the Azure Netherwing Drake
	[41515] = 41513, -- Reins of the Cobalt Netherwing Drake
	[41516] = 41513, -- Reins of the Purple Netherwing Drake
	[41517] = 41513, -- Reins of the Veridian Netherwing Drake
	[41518] = 41513, -- Reins of the Violet Netherwing Drake
	[59567] = 59567, -- Reins of the Azure Drake
	[59568] = 59567, -- Reins of the Blue Drake
	[59569] = 59567, -- Reins of the Bronze Drake
	[59570] = 59567, -- Reins of the Red Drake
	[59571] = 59567, -- Reins of the Twilight Drake
	[59650] = 59567, -- Reins of the Black Drake
	[60025] = 59567, -- Reins of the Albino Drake
	[59961] = 59961, -- Reins of the Red Proto-Drake
	[59996] = 59961, -- Reins of the Blue Proto-Drake
	[60002] = 59961, -- Reins of the Time-Lost Proto-Drake
	[61294] = 59961, -- Reins of the Green Proto-Drake
}
