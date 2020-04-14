--
-- defaults for config version 'CV1'
--

--
-- only this file is allowed to use self.db.profile directly
-- all others MUST use GetPref / SetPref !!
--

SmartMount.ConfigVersion = 'CV2'

SmartMount.ConfigDefaults = {
	[SmartMount.ConfigVersion] = {
			['key1'] = false,
			['key2'] = false,
			['key3'] = false,
			['ShowActionButton'] = false,
			['Debug'] = false,
			['ExitVehicle'] = false,
			['LibDataBroker'] = true,

			['ListOfMountsCache'] = {},

			['c1-combat-mnt-try1'] = 'spell:Travel Form',
			['c1-combat-mnt-try2'] = 'spell:Ghost Wolf',
			['c1-combat-mnt-try3'] = 'off',
			['c1-combat-dis-do'] = true,
			['c1-combat-dis-try1'] = 'off',
			['c1-combat-dis-try2'] = 'off',
			['c1-combat-dis-try3'] = 'off',

			['c1-swim-mnt-try1'] = 'spell:Aquatic Form',
			['c1-swim-mnt-try2'] = 'special:Hook of the Master Angler',
			['c1-swim-mnt-try3'] = 'spell:Ghost Wolf',
			['c1-swim-dis-do'] = true,
			['c1-swim-dis-try1'] = 'off',
			['c1-swim-dis-try2'] = 'off',
			['c1-swim-dis-try3'] = 'off',

			['c1-fly-mnt-try1'] = 'spell:Flight Form',
			['c1-fly-mnt-try2'] = 'spell:Levitate',
			['c1-fly-mnt-try3'] = 'spell:Slow Fall',
			['c1-fly-dis-do'] = true,
			['c1-fly-dis-do-groundonly'] = true,
			['c1-fly-dis-try1'] = 'off',
			['c1-fly-dis-try2'] = 'off',
			['c1-fly-dis-try3'] = 'off',

			['c1-land-mnt-try1'] = 'spell:Flight Form',
			['c1-land-mnt-try2'] = 'rnd_fast',
			['c1-land-mnt-try3'] = 'rnd_pet',
			['c1-land-dis-do'] = true,
			['c1-land-dis-try1'] = 'rnd_pet',
			['c1-land-dis-try2'] = 'off',
			['c1-land-dis-try3'] = 'off',



			['c2-combat-mnt-try1'] = 'spell:Cat Form',
			['c2-combat-mnt-try2'] = 'off',
			['c2-combat-mnt-try3'] = 'off',
			['c2-combat-dis-do'] = true,
			['c2-combat-dis-try1'] = 'off',
			['c2-combat-dis-try2'] = 'off',
			['c2-combat-dis-try3'] = 'off',

			['c2-swim-mnt-try1'] = 'off',
			['c2-swim-mnt-try2'] = 'off',
			['c2-swim-mnt-try3'] = 'off',
			['c2-swim-dis-do'] = true,
			['c2-swim-dis-try1'] = 'off',
			['c2-swim-dis-try2'] = 'off',
			['c2-swim-dis-try3'] = 'off',

			['c2-fly-mnt-try1'] = 'off',
			['c2-fly-mnt-try2'] = 'off',
			['c2-fly-mnt-try3'] = 'off',
			['c2-fly-dis-do'] = true,
			['c2-fly-dis-do-groundonly'] = true,
			['c2-fly-dis-try1'] = 'off',
			['c2-fly-dis-try2'] = 'off',
			['c2-fly-dis-try3'] = 'off',

			['c2-land-mnt-try1'] = 'special:instantform',
			['c2-land-mnt-try2'] = 'rnd_all',
			['c2-land-mnt-try3'] = 'off',
			['c2-land-dis-do'] = true,
			['c2-land-dis-try1'] = 'off',
			['c2-land-dis-try2'] = 'off',
			['c2-land-dis-try3'] = 'off',



			['c3-combat-mnt-try1'] = 'off',
			['c3-combat-mnt-try2'] = 'off',
			['c3-combat-mnt-try3'] = 'off',
			['c3-combat-dis-do'] = false,
			['c3-combat-dis-try1'] = 'off',
			['c3-combat-dis-try2'] = 'off',
			['c3-combat-dis-try3'] = 'off',

			['c3-swim-mnt-try1'] = 'off',
			['c3-swim-mnt-try2'] = 'off',
			['c3-swim-mnt-try3'] = 'off',
			['c3-swim-dis-do'] = false,
			['c3-swim-dis-try1'] = 'off',
			['c3-swim-dis-try2'] = 'off',
			['c3-swim-dis-try3'] = 'off',

			['c3-fly-mnt-try1'] = 'off',
			['c3-fly-mnt-try2'] = 'off',
			['c3-fly-mnt-try3'] = 'off',
			['c3-fly-dis-do'] = false,
			['c3-fly-dis-do-groundonly'] = false,
			['c3-fly-dis-try1'] = 'off',
			['c3-fly-dis-try2'] = 'off',
			['c3-fly-dis-try3'] = 'off',

			['c3-land-mnt-try1'] = 'off',
			['c3-land-mnt-try2'] = 'off',
			['c3-land-mnt-try3'] = 'off',
			['c3-land-dis-do'] = false,
			['c3-land-dis-try1'] = 'off',
			['c3-land-dis-try2'] = 'off',
			['c3-land-dis-try3'] = 'off',
		}
	}

SmartMount.PlayerConfigVersion = 'PCV1'

SmartMount.PlayerConfigDefaults = {
		[SmartMount.PlayerConfigVersion] = {
			['ExcludedMounts'] = {},
			['ExcludedMiniPets'] = {},
		}
	}

--
-- check the config: update & defaults
--

function SmartMount:CheckConfig()

	if not self.rock then
		-- no rock: only the defaults!
		self.db.profile = self.ConfigDefaults
		self.dbchar = self.PlayerConfigDefaults
		return
	end

	local showinfo = false;

	-- main config

	if type(self.db.profile) ~= 'table' then
		-- no config at all: have a fresh start
		self.db.profile = { ['ConfigVersion'] = self.ConfigVersion, [self.ConfigVersion] = {} }
		showinfo = true
	end -- if
	
	if type(self.db.profile[self.ConfigVersion]) ~= 'table' or self.db.profile['ConfigVersion'] ~= self.ConfigVersion then
		-- this is either no config at all, or an old version -> try to update, or clean
	
		-- update 0 to 1, if required
		if self.db.profile['ConfigVersion'] == nil and self.db.profile['NormalKey'] ~= nil then
			-- update config
			self:UpdateConfig0to1()
			showinfo = true
		end -- if
	
		-- update 1 to 2, if required
		if self.db.profile['ConfigVersion'] == 'CV1' and type(self.db.profile['CV1']) == 'table' then
			-- update config
			self:UpdateConfig1to2()
			-- showinfo = true -- no showinfo because only the defaults are changed
		end -- if
	
		-- not the current version found: clean up
		if self.db.profile['ConfigVersion'] ~= self.ConfigVersion then
			if type(self.db.profile[self.ConfigVersion]) ~= 'table' then
				self.db.profile[self.ConfigVersion] = {}
			end -- if
			-- unknown config version: clean!
			for k,_ in pairs(self.db.profile) do
				if k ~= self.ConfigVersion then
					self.db.profile[k] = nil
				end -- if
			end -- for
			for k,_ in pairs(self.db.profile[self.ConfigVersion]) do
				self.db.profile[self.ConfigVersion][k] = self.ConfigDefaults[self.ConfigVersion][k]
			end -- for
			self.db.profile['ConfigVersion'] = self.ConfigVersion
			showinfo = true
		end -- if
	end -- if

	-- clear unused config values
	for k,_ in pairs(self.db.profile) do
		if k ~= 'ConfigVersion' and k ~= self.ConfigVersion then
			self.db.profile[k] = nil
		end -- if
	end -- for

	-- per player config (own db!)

	if type(SmartMount_PlayerConfig) ~= 'table' then
		SmartMount_PlayerConfig = {}
	end -- if	

	self.dbchar = SmartMount_PlayerConfig

	if self.dbchar['PlayerConfigVersion'] ~= self.PlayerConfigVersion or type(self.dbchar[self.PlayerConfigVersion]) ~= 'table' then
		-- this is either no config at all, or an old version -> try to update, or clean
	end -- if

	-- not the current version found: clean up
	if self.dbchar['PlayerConfigVersion'] ~= self.PlayerConfigVersion or type(self.dbchar[self.PlayerConfigVersion]) ~= 'table' then
		-- unknown config version: clean!
		for k,_ in pairs(self.dbchar) do
			self.dbchar[k] = nil
		end -- for
		-- set up basics
		self.dbchar['PlayerConfigVersion'] = self.PlayerConfigVersion
		self.dbchar[self.PlayerConfigVersion] = {}
	end -- if

	-- setup defaults
	for k,v in pairs(self.PlayerConfigDefaults[self.PlayerConfigVersion]) do
		self.dbchar[self.PlayerConfigVersion][k] = self.dbchar[self.PlayerConfigVersion][k] or v
	end -- for
	
	if showinfo and not Rock("LibRockConfig-1.0"):IsConfigMenuOpen(self) then
		StaticPopupDialogs['SMARTMOUNT_SHOW_INFO'] = {
			text = format(SmartMount_Locale['welcome_info'], self.Version),
			button1 = SmartMount_Locale['welcome_now'],
			button2 = SmartMount_Locale['welcome_later'],
			OnAccept = function() self:OpenConfigMenu() end,
			timeout = 0,
			whileDead = 1,
			notClosableByLogout = 1,
		}
		StaticPopup_Show('SMARTMOUNT_SHOW_INFO');
	end -- if
end

--
-- update 0 to 1
--

function SmartMount:UpdateConfig0to1()

	self:dump('Updating Config', '0to1')

	local defaults = {
			['NormalKey'] = false,
			['AlternateKey'] = false,
			['ShowActionButton'] = false,
			['Debug'] = false,

			['ListOfMounts'] = {},

			['CombatNrmDisIfM'] = 'DM',
			['CombatNrmDisNot'] = '-M',
			['CombatNrmMount1'] = 'spell:Travel Form',
			['CombatNrmMount2'] = 'spell:Ghost Wolf',
			['CombatNrmMount3'] = 'off',
			['CombatAltDisIfM'] = 'DM',
			['CombatAltDisNot'] = '-M',
			['CombatAltMount1'] = 'spell:Cat Form',
			['CombatAltMount2'] = 'off',
			['CombatAltMount3'] = 'off',

			['SwimNrmDisIfM'] = 'D-',
			['SwimNrmDisNot'] = '-M',
			['SwimNrmMount1'] = 'spell:Aquatic Form',
			['SwimNrmMount2'] = 'special:Hook of the Master Angler',
			['SwimNrmMount3'] = 'spell:Ghost Wolf',
			['SwimAltDisIfM'] = 'DM',
			['SwimAltDisNot'] = '-M',
			['SwimAltMount2'] = 'off',
			['SwimAltMount1'] = 'off',
			['SwimAltMount3'] = 'off',

			['DisNrmDisIfM'] = 'DM',
			['DisNrmMount1'] = 'rnd_pet',
			['DisNrmMount2'] = 'off',
			['DisNrmMount3'] = 'off',
			['DisAltDisIfM'] = 'DM',
			['DisAltMount1'] = 'off',
			['DisAltMount2'] = 'off',
			['DisAltMount3'] = 'off',

			['LandNrmMount1'] = 'spell:Flight Form',
			['LandNrmMount2'] = 'rnd_fast',
			['LandNrmMount3'] = 'off',
			['LandAltMount1'] = 'special:instantform',
			['LandAltMount2'] = 'rnd_all',
			['LandAltMount3'] = 'off',
	}

	local oldcfg = {}

	for key, value in pairs(defaults) do
		oldcfg[key] = self.db.profile[key] or value
	end -- for

	local newcfg = {}
	-- we fill only all non defaults
	newcfg['key1'] = oldcfg['NormalKey']
	newcfg['key2'] = oldcfg['AlternateKey']
	newcfg['ShowActionButton'] = oldcfg['ShowActionButton']
	newcfg['Debug'] = oldcfg['Debug']

	newcfg['ListOfMountsCache'] = {}
	for _,v in pairs(oldcfg['ListOfMounts']) do
		self:dump('lom', v)
		local found, _, itemid = string.find(v['action'], 'item:(%d+):')
		self:dump('lom', itemid)
		if found and self.Mounts[tonumber(itemid)] ~= nil then
			newcfg['ListOfMountsCache'][v['action']] = self.Mounts[tonumber(itemid)] .. ':' .. v['name']
		end -- if
	end -- for
	
	for cfg_old, cfg_new in pairs({['Nrm'] = 'c1', ['Alt'] = 'c2'}) do
		local stddis = oldcfg['Dis'..cfg_old..'DisIfM']
		for name_old, name_new in pairs({['Combat'] = 'combat', ['Swim'] = 'swim', ['Land'] = 'land'}) do
			local mntopt = oldcfg[name_old..cfg_old..'DisNot'] or '-M' -- '-M' for land
			-- fill in the 'mount' options
			if string.sub(mntopt, 2, 2) == 'M' then
				for t = 1, 3 do
					newcfg[cfg_new..'-'..name_new..'-mnt-try'..t] = oldcfg[name_old..cfg_old..'Mount'..t]
				end
			else
				newcfg[cfg_new..'-'..name_new..'-mnt-try1'] = 'off'
				newcfg[cfg_new..'-'..name_new..'-mnt-try2'] = 'off'
				newcfg[cfg_new..'-'..name_new..'-mnt-try3'] = 'off'
			end -- if
			-- fill in the 'dismount' options
			-- dismount or not?
			local disopt = oldcfg[name_old..cfg_old..'DisIfM'] or stddis
			newcfg[cfg_new..'-'..name_new..'-dis-do'] = string.sub(disopt,2,2) == 'M'
			-- what do after the dismount
			if string.sub(disopt,2,2) == 'M' and name_old == 'Land' then
				-- we want to dismount on ground -> fill in 
				for t = 1, 3 do
					newcfg[cfg_new..'-'..name_new..'-dis-try'..t] = oldcfg['Dis'..cfg_old..'Mount'..t]
				end
			else
				newcfg[cfg_new..'-'..name_new..'-dis-try1'] = 'off'
				newcfg[cfg_new..'-'..name_new..'-dis-try2'] = 'off'
				newcfg[cfg_new..'-'..name_new..'-dis-try3'] = 'off'
			end -- if
		end -- for
		-- fill in defaults for the flying (except weather to dismount or not)
		newcfg[cfg_new..'-fly-dis-do'] = string.len(stddis) < 3 or string.sub(stddis, 3, 3) ~= 'f'
	end -- for

	-- fill in defaults for the complete 3rd config -> no need to do anything
	
	-- clean profile
	for k,_ in pairs(self.db.profile) do
		if k ~= self.ConfigVersion then
			-- don't delete the default config table...
			self.db.profile[k] = nil
		end -- if
	end -- for

	-- create config-table
	if type(self.db.profile['CV1']) ~= 'table' then
		self.db.profile['CV1'] = {}
	end -- if

	-- copy upgraded profile
	for k,v in pairs(newcfg) do
		self.db.profile['CV1'][k] = v
	end -- for

	-- set version correct
	self.db.profile['ConfigVersion'] = 'CV1'
end

function SmartMount:UpdateConfig1to2()

	self:dump('Updating Config', '1to2')

	local defaults = {
			['key1'] = false,
			['key2'] = false,
			['key3'] = false,
			['ShowActionButton'] = false,
			['Debug'] = false,

			['ListOfMountsCache'] = {},

			['c1-combat-mnt-try1'] = 'spell:Travel Form',
			['c1-combat-mnt-try2'] = 'spell:Ghost Wolf',
			['c1-combat-mnt-try3'] = 'off',
			['c1-combat-dis-do'] = true,
			['c1-combat-dis-try1'] = 'off',
			['c1-combat-dis-try2'] = 'off',
			['c1-combat-dis-try3'] = 'off',

			['c1-swim-mnt-try1'] = 'spell:Aquatic Form',
			['c1-swim-mnt-try2'] = 'special:Hook of the Master Angler',
			['c1-swim-mnt-try3'] = 'spell:Ghost Wolf',
			['c1-swim-dis-do'] = true,
			['c1-swim-dis-try1'] = 'off',
			['c1-swim-dis-try2'] = 'off',
			['c1-swim-dis-try3'] = 'off',

			['c1-fly-mnt-try1'] = 'spell:Flight Form',
			['c1-fly-mnt-try2'] = 'spell:Levitate',
			['c1-fly-mnt-try3'] = 'spell:Slow Fall',
			['c1-fly-dis-do'] = false,
			['c1-fly-dis-do-groundonly'] = false,
			['c1-fly-dis-try1'] = 'spell:Levitate',
			['c1-fly-dis-try2'] = 'spell:Slow Fall',
			['c1-fly-dis-try3'] = 'off',

			['c1-land-mnt-try1'] = 'spell:Flight Form',
			['c1-land-mnt-try2'] = 'rnd_fast',
			['c1-land-mnt-try3'] = 'rnd_pet',
			['c1-land-dis-do'] = true,
			['c1-land-dis-try1'] = 'rnd_pet',
			['c1-land-dis-try2'] = 'off',
			['c1-land-dis-try3'] = 'off',



			['c2-combat-mnt-try1'] = 'spell:Cat Form',
			['c2-combat-mnt-try2'] = 'off',
			['c2-combat-mnt-try3'] = 'off',
			['c2-combat-dis-do'] = true,
			['c2-combat-dis-try1'] = 'off',
			['c2-combat-dis-try2'] = 'off',
			['c2-combat-dis-try3'] = 'off',

			['c2-swim-mnt-try1'] = 'off',
			['c2-swim-mnt-try2'] = 'off',
			['c2-swim-mnt-try3'] = 'off',
			['c2-swim-dis-do'] = true,
			['c2-swim-dis-try1'] = 'off',
			['c2-swim-dis-try2'] = 'off',
			['c2-swim-dis-try3'] = 'off',

			['c2-fly-mnt-try1'] = 'off',
			['c2-fly-mnt-try2'] = 'off',
			['c2-fly-mnt-try3'] = 'off',
			['c2-fly-dis-do'] = false,
			['c2-fly-dis-do-groundonly'] = false,
			['c2-fly-dis-try1'] = 'off',
			['c2-fly-dis-try2'] = 'off',
			['c2-fly-dis-try3'] = 'off',

			['c2-land-mnt-try1'] = 'special:instantform',
			['c2-land-mnt-try2'] = 'rnd_all',
			['c2-land-mnt-try3'] = 'off',
			['c2-land-dis-do'] = true,
			['c2-land-dis-try1'] = 'off',
			['c2-land-dis-try2'] = 'off',
			['c2-land-dis-try3'] = 'off',



			['c3-combat-mnt-try1'] = 'off',
			['c3-combat-mnt-try2'] = 'off',
			['c3-combat-mnt-try3'] = 'off',
			['c3-combat-dis-do'] = false,
			['c3-combat-dis-try1'] = 'off',
			['c3-combat-dis-try2'] = 'off',
			['c3-combat-dis-try3'] = 'off',

			['c3-swim-mnt-try1'] = 'off',
			['c3-swim-mnt-try2'] = 'off',
			['c3-swim-mnt-try3'] = 'off',
			['c3-swim-dis-do'] = false,
			['c3-swim-dis-try1'] = 'off',
			['c3-swim-dis-try2'] = 'off',
			['c3-swim-dis-try3'] = 'off',

			['c3-fly-mnt-try1'] = 'off',
			['c3-fly-mnt-try2'] = 'off',
			['c3-fly-mnt-try3'] = 'off',
			['c3-fly-dis-do'] = false,
			['c3-fly-dis-do-groundonly'] = false,
			['c3-fly-dis-try1'] = 'off',
			['c3-fly-dis-try2'] = 'off',
			['c3-fly-dis-try3'] = 'off',

			['c3-land-mnt-try1'] = 'off',
			['c3-land-mnt-try2'] = 'off',
			['c3-land-mnt-try3'] = 'off',
			['c3-land-dis-do'] = false,
			['c3-land-dis-try1'] = 'off',
			['c3-land-dis-try2'] = 'off',
			['c3-land-dis-try3'] = 'off',
	}
	
	-- aquire old config
	local oldcfg = {}

	for key, value in pairs(defaults) do
		oldcfg[key] = self.db.profile['CV1'][key] or value
	end -- for

	-- newconfig is identical to oldconif, because only the defaults are changed
	local newcfg = oldcfg

	-- clean profile
	for k,_ in pairs(self.db.profile) do
		if k ~= self.ConfigVersion then
			-- don't delete the default config table...
			self.db.profile[k] = nil
		end -- if
	end -- for

	-- create config-table
	if type(self.db.profile['CV2']) ~= 'table' then
		self.db.profile['CV2'] = {}
	end -- if

	-- copy upgraded profile
	for k,v in pairs(newcfg) do
		self.db.profile['CV2'][k] = v
	end -- for

	-- set version correct
	self.db.profile['ConfigVersion'] = 'CV2'

end
