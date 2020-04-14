-- Register addon
raid_browser = LibStub("AceAddon-3.0"):NewAddon("RaidBrowser", "AceConsole-3.0")

local function table_copy(t)
	local copy = {};
	
	for k, v in pairs(t) do
		copy[k] = v;
	end
	
	return copy;
end

local sep = '[%s-_,.]';

-- Raid patterns template for a raid with 2 difficulties and 2 sizes
local raid_patterns_template = {
	hc = {
		'<raid>' .. sep .. '*<size>' .. sep .. '*m?a?n?' .. sep .. '*%(?hc?%)?',
		sep..'+%(?hc?%)?' .. sep .. '*<raid>' .. sep .. '*<size>',
		'<raid>' .. sep .. '*%(?hc?%)?' .. sep .. '*<size>',
		--'<size>'..sep..'+m?a?n?'..sep..'*<raid>[%s-_,.]*%(?hc?%)?',
	},
	
	nm = {
		'<raid>' .. sep .. '*<size>' .. sep .. '*m?a?n?' .. sep .. '*%(?nm?%)?',
		sep..'+%(?nm?%)?' .. sep .. '*<raid>' .. sep .. '*<size>',
		'<raid>' .. sep .. '*%(?nm?%)?' .. sep .. '*<size>',
		--'<size>'..sep..'+m?a?n?'..sep..'*<raid>[%s-_,.]*%(?nm?%)?',
		'<raid>' .. sep .. '*<size>',
	}
};

local function create_raid_patterns(raid_name_pattern, size, difficulty, instance_name)
	if not raid_name_pattern or not size or not difficulty then
		return;
	end
	
	local patterns = table_copy(raid_patterns_template[difficulty]);
	
	if size == 10 then
		size = '1[0o]';
	elseif size == 40 then
		size = '4[0p]';
	end
	
	local i = 1;
	-- Replace placeholders with the specified raid info
	for _, pattern in ipairs(patterns) do
		pattern = string.gsub(pattern, '<raid>', raid_name_pattern);
		pattern = string.gsub(pattern, '<size>', size);
		patterns[i] = pattern;
		i = i + 1;
	end
	
	if instance_name then
		patterns[i] = string.gsub(instance_name, 'The ', '');
	end
	return patterns;
end
			
local raid_list = {
	-- Note: The order of each raid is deliberate.
	-- Heroic raids are checked first, since NM raids will have the default 'icc10' pattern. 
	-- Be careful about changing the order of the raids below
	{
		name = 'icc25rep',
		instance_name = 'Icecrown Citadel',
		size = 25,
		patterns = {
			'icc[%s-_,.]*25[%s-_,.]*m?a?n?[%s-_,.]*repu?t?a?t?i?o?n?[%s-_,.]*',
			'icc[%s-_,.]*repu?t?a?t?i?o?n?[%s-_,.]*25[%s-_,.]*m?a?n?',
		}
	},
	
	{
		name = 'icc10rep',
		instance_name = 'Icecrown Citadel',
		size = 10,
		patterns = {
			'icc[%s-_,.]*10[%s-_,.]*m?a?n?[%s-_,.]*repu?t?a?t?i?o?n?[%s-_,.]*',
			'icc[%s-_,.]*repu?t?a?t?i?o?n?[%s-_,.]*10',
			 'icc[%s-_,.]*repu?t?a?t?i?o?n?',
		}
	},
	
	{
		name = 'icc10hc',
		instance_name = 'Icecrown Citadel',
		size = 10,
		patterns = create_raid_patterns('icc', 10, 'hc', instance_name);
	},

	{
		name = 'icc25hc',
		instance_name = 'Icecrown Citadel',
		size = 25,
		patterns = create_raid_patterns('icc', 25, 'hc', instance_name),
	},

	{
		name = 'icc10nm',
		instance_name = 'Icecrown Citadel',
		size = 10,
		patterns = create_raid_patterns('icc', 10, 'nm', instance_name),
	},

	{
		name = 'icc25nm',
		instance_name = 'Icecrown Citadel',
		size = 25,
		patterns = create_raid_patterns('icc', 25, 'nm', instance_name),
	},

	{
		name = 'toc10hc',
		instance_name = 'Trial of the Crusader',
		size = 10,
		patterns = create_raid_patterns('tog?c', 10, 'hc', instance_name),
	},

	{
		name = 'toc25hc',
		instance_name = 'Trial of the Crusader',
		size = 25,
		patterns = create_raid_patterns('tog?c', 25, 'hc', instance_name),
	},

	{
		name = 'toc10nm',
		instance_name = 'Trial of the Crusader',
		size = 10,
		patterns = create_raid_patterns('tog?c', 10, 'nm', instance_name),
	},

	{
		name = 'toc25nm',
		instance_name = 'Trial of the Crusader',
		size = 25,
		patterns = create_raid_patterns('tog?c', 25, 'nm', instance_name),
	},
	
	{
		name = 'rs10hc',
		instance_name = 'The Ruby Sanctum',
		size = 10,
		patterns = create_raid_patterns('rs', 10, 'hc', instance_name),
	},

	{
		name = 'rs25hc',
		instance_name = 'The Ruby Sanctum',
		size = 25,
		patterns = create_raid_patterns('rs', 25, 'hc', instance_name),
	},

	{
		name = 'rs10nm',
		instance_name = 'The Ruby Sanctum',
		size = 10,
		patterns = create_raid_patterns('rs', 10, 'nm', instance_name),
	},

	{
		name = 'rs25nm',
		instance_name = 'The Ruby Sanctum',
		size = 25,
		patterns = create_raid_patterns('rs', 25, 'nm', instance_name),
	},
	
	{
		name = 'voa10',
		instance_name = 'Vault of Archavon',
		size = 10,
		patterns = {"voa[%s-_,.]*10"},
	},
	
	{
		name = 'voa25',
		instance_name = 'Vault of Archavon',
		size = 25,
		patterns = {"voa[%s-_,.]*25"},
	},
		
	{
		name = 'ulduar10',
		instance_name = 'Ulduar',
		size = 10,
		patterns = {
			'uldu?a?r?[%s-_,.]*10',
		},
	},
	
	{
		name = 'ulduar25',
		instance_name = 'Ulduar',
		size = 25,
		patterns = {
			'uldu?a?r?[%s-_,.]*25',
		}
	},
	
	{
		name = 'os10',
		instance_name = 'The Obsidian Sanctum',
		size = 10,
		patterns = {
			'os[%s-_,.]*10',
			'sartharion must die!',
		},
	},
	
	{
		name = 'os25',
		instance_name = 'The Obsidian Sanctum',
		size = 25,
		patterns = {
			'os[%s-_,.]*25',
		},
	},
	
	{
		name = 'naxx10',
		instance_name = 'Naxxramas',
		size = 10,
		patterns = {
			'naxx?r?a?m?m?a?s?[%s-_,.]*10',
			'naxx'..sep..'weekly',
			'patchwerk'..sep..'must'..sep..'die!',
		},
	},
	
	{
		name = 'naxx25',
		instance_name = 'Naxxramas',
		size = 25,
		patterns = {
			'naxx?r?a?m?m?a?s?[%s-_,.]*25',
		},
	},
	
	{
		name = 'onyxia25',
		instance_name = 'Onyxia\'s Lair',
		size = 25,
		patterns = {
			'onyx?i?a?[%s-_,.]*25'
		},
	},
	
	{
		name = 'onyxia10',
		instance_name = 'Onyxia\'s Lair',
		size = 10,
		patterns = {
			'onyx?i?a?[%s-_,.]*10'
		},
	},
	
	{
		name = 'karazhan',
		instance_name = 'Karazhan',
		size = 10,
		patterns = {
			'karaz?h?a?n?[%s-_,.]*1?0?', -- karazhan 
		},
	},
	
	{
		name = 'molten core',
		instance_name = 'Molten Core',
		size = 40,
		patterns = {
			'molte?n[%s]*core?',
			'[%s-_,.%^]+mc'..sep..'*4?0?[%s-_,.$]+',
		},
	},
	
	{
		name = 'black temple',
		instance_name = 'The Black Temple',
		size = 25,
		patterns = {
			'black[%s]*temple',
			'[%s-_,.]+bt[%s-_,.]*25[%s-_,.]+',
		},
	},
	
	{
		name = 'aq40',
		instance_name = 'Ahn\'Qiraj Temple',
		size = 40,
		patterns = {
			'temple?'..sep..'*of?'..sep..'*ahn\'?'..sep..'*qiraj',
			sep..'*aq[%s-_,.]*40'..sep..'*',
		},
	},
	
	{
		name = 'aq20',
		instance_name = 'Ruins of Ahn\'Qiraj',
		size = 20,
		patterns = {
			'ruins?'..sep..'*of?'..sep..'*ahn\'?'..sep..'*qiraj',
			sep..'*aq[%s-_,.]*20'..sep..'*',
		},
	},
}

local role_patterns = {	
	dps = {
		'[0-9]*[%s-_,.]*dps',
		
		-- melee dps
		'[0-9]*[%s-_,.]*m[dp][dp]s',
		'[0-9]*[%s-_,.]*rogue',
		'[0-9]*[%s-_,.]*kitt?y?',
		'[0-9]*[%s-_,.]*feral',
		'[0-9]*[%s-_,.]*ret[%s-_,.]*pal[al]?[dy]?i?n?',
		
		-- ranged dps
		"[0-9]*[%s-_,.]*r[dp][dp]s",
		'[0-9]*[%s-_,.]*w?a?r?lock',
		'[0-9]*[%s-_,.]*spri?e?st',
		'[0-9]*[%s-_,.]*elem?e?n?t?a?l?',
		'[0-9]*[%s-_,.]*mage',
		'[0-9]*[%s-_,.]*boo?mm?y?k?i?n?',
		'[0-9]*[%s-_,.]*hunte?r?s?',
	},
	
	healer = {
		'[0-9]*[%s-_,.]*he[a]?l[er|ers]*', -- LF healer
		'[0-9]*[%s-_,.]*re?s?t?o?'..sep..'*d[ru][ud][iu]d?', -- LF rdruid/rdudu
		'[0-9]*[%s-_,.]*tree', 			   -- LF tree
		'[0-9]*[%s-_,.]*re?s?t?o?[%s-_,.]*shamm?y?', -- LF rsham
		'[0-9]*'..sep..'*di?s?c?o?'..sep..'*pri?e?st', -- disc priest
		'[0-9]*[%s-_,.]*ho?l?l?y?'..sep..'*pala',	   -- LF hpala
	},
	
	tank = {
		'[0-9]*[%s-_,.]*t[a]?nk[s]?',	-- NEED TANKS
		'[0-9]*[%s-_,.]*tn?[a]?k[s]?',  -- Need TNAK
		'[%s-_,.]+[mo]t[%s-_,.]+',				-- Need MT/OT
		'[0-9]*[%s-_,.]*bears?',
		'[0-9]*'..sep..'*prot'..sep..'*pal[al]?[dy]?i?n?',
	},
}

local gearscore_patterns = {
	'[1-6]'..sep..'*k[0-9]+',
	'[1-6][.,][0-9]',
	'[1-6][%s]*k[%s]*%+?',
	'%+?[%s]*[1-6][%s]*k',
	'[1-6][0-9][0-9][0-9]',
	'[1-6]%+',
}

local lfm_patterns = {
	'lf[0-9]*m',
	'lf'..sep..'*all',
	'need',
	'need'..sep..'*all',
	'seek'..sep..'*[0-9]*'..sep..'*he[a]?l[er|ers]*',		-- seek healer
	'seek'..sep..'*[0-9]*'..sep..'*t[a]?nk[s]?',			-- seek 5 tanks
	'seek'..sep..'*[0-9]*'..sep..'*[mr]?dps',				-- seek 9 DPS
	'looking'..sep..'*for[%s]*all',
	'looking'..sep..'*for'..sep..'*an?'..sep,
	'looking'..sep..'*for'..sep..'*[0-9]*'..sep..'*more',		-- looking for 9 more
	'lf'..sep..'*.*for',								-- LF <any characters> for 
	'looking'..sep..'*for'..sep..'*.*'..sep..'for',		-- LF <any characters> for 
	'lf'..sep..'*[0-9]*'..sep..'*he[a]?l[er|ers]*',		-- LF healer
	'lf'..sep..'*[0-9]*'..sep..'*t[a]?nk[s]?',			-- LF 5 tanks
	'lf'..sep..'*[0-9]*'..sep..'*[mr]?dps',				-- LF 9 DPS
	'whispe?r?'..sep..'*me',
	--'[%s]/w[%s]*[%a]+', -- Too greedy
}

local lfm_channel_listeners = {
	["CHAT_MSG_CHANNEL"] = {},
	["CHAT_MSG_YELL"] = {},
};

local channel_listeners = {};

local guild_recruitment_patterns = {
	'recrui?ti?ng',
	'recrui?t',
	'we[%s]*raid',
	'[<({-][%a%s]+[-})>][%s]*is[%s]*a?', -- (<GuildName> is a) pve guild looking for
	'[0-9][0-9][pa]m[%s]*st', -- we raid (12pm set)
	'autorecruit',
	'raid[%s]*time',
	'active[%s]*raiders?',
	'is[%s]*a[%s]*[%a]*[%s]*[pvep][pvep][pvep][%s]*guild',
	'lf'..sep..'members',
};

local wts_message_patterns = {
	'wts ',
	'selling ',
};

local function refresh_lfm_messages()
	for name, info in pairs(raid_browser.lfm_messages) do
		-- If the last message from the sender was too long ago, then
		-- remove his raid from lfm_messages.
		if time() - info.time > raid_browser.expiry_time then
			raid_browser.lfm_messages[name] = nil;
		end
	end
end

local function remove_achievement_text(message)
	return string.gsub(message, '|c.*|r', '');
end

local function format_gs_string(gs)
	local formatted = string.gsub(gs, sep..'*%+?', ''); -- Trim whitespace
	formatted  = string.gsub(formatted , 'k', '')
	formatted  = string.gsub(formatted , sep, '.');
	formatted  = tonumber(formatted);

	-- Convert ex: 5800 into 5.8 for display
	if formatted  > 1000 then
		formatted  = formatted /1000;
		
	-- Convert 57.0 into 5.7
	elseif formatted > 100 then
		formatted = formatted / 100;
		
	-- Convert 57.0 into 5.7
	elseif formatted > 10 then
		formatted = formatted / 10;
	end

	return string.format('%.1f', formatted );
end

local function is_in_patterns(message, patterns)
	for _, pattern in ipairs(patterns) do
		if string.find(message, pattern) then
			return true;
		end
	end
	
	return false;
end

local function is_guild_recruitment(message)
	return is_in_patterns(message, guild_recruitment_patterns);
end

local function is_wts_message(message)
	return is_in_patterns(message, wts_message_patterns);
end

-- Basic http pattern matching for streaming sites and etc.
local function remove_http_links(message)
	local http_pattern = 'https?://*[%a]*.[%a]*.[%a]*/?[%a%-%%0-9_]*/?';
	return string.gsub(message, http_pattern, '');
end
	
local function find_roles(roles, message, pattern_table, role)
	local found = false;
	for _, pattern in ipairs(pattern_table[role]) do
		local result = string.find(message, pattern)

		-- If a raid was found then save it to our list of roles and continue.
		if result then
			found = true;
			
			-- Remove the substring from the message
			message = string.gsub(message, pattern, '')
		end
	end
	
	if not found then
		return roles, message;
	end
	
	table.insert(roles, role);
	return roles, message;
end

function raid_browser.raid_info(message)
	message = string.lower(message)
	message = remove_http_links(message);
	
	-- Stop if it's a guild recruit message
	if is_guild_recruitment(message) or is_wts_message(message) then
		return;
	end
		
	-- Search for LFM announcement in the message
	local found_lfm = false;
	for _, pattern in ipairs(lfm_patterns) do
		if string.find(message, pattern) then
			found_lfm = true
		end
	end

	if not found_lfm then
		return;
	end
	
	-- Get the raid_info from the message
	local raid_info = nil;
	for _, r in ipairs(raid_list) do
		for _, pattern in ipairs(r.patterns) do
			local result = string.find(message, pattern);

			-- If a raid was found then save it and continue.
			if result then
				raid_info = r;

				-- Remove the substring from the message
				message = string.gsub(message, pattern, '')
				break
			end
		end
		
		if raid_info then 
			break;
		end
	end
	
	message = remove_achievement_text(message);
	
	-- Get any roles that are needed
	local roles = {};
	
	roles, message  = find_roles(roles, message, role_patterns, 'dps');
	roles, message  = find_roles(roles, message, role_patterns, 'tank');
	roles, message = find_roles(roles, message, role_patterns, 'healer');

	-- If there is only an LFM message, then it is assumed that all roles are needed
	if #roles == 0 then
		roles = {'dps', 'tank', 'healer'}
	end

	local gs = ' ';

	-- Search for a gearscore requirement.
	for _, pattern in pairs(gearscore_patterns) do
		local gs_start, gs_end = string.find(message, pattern)

		-- If a gs requirement was found, then save it and continue.
		if gs_start and gs_end then
			gs = format_gs_string(string.sub(message, gs_start, gs_end))
			break
		end
	end

	return raid_info, roles, gs
end

local function is_lfm_channel(channel)
	return channel == "CHAT_MSG_CHANNEL" or channel == "CHAT_MSG_YELL";
end

local function event_handler(self, event, message, sender)
	if is_lfm_channel(event) then
		local raid_info, roles, gs = raid_browser.raid_info(message)
		if raid_info and roles and gs then
			
			-- Put the sender in the table of active raids
			raid_browser.lfm_messages[sender] = { 
				raid_info = raid_info, 
				roles = roles, 
				gs = gs, 
				time = time(), 
				message = message
			};
			
			raid_browser.gui.update_list();
		end
	end
end

function raid_browser:OnEnable()
	raid_browser:Print("loaded. Type /rb to toggle the raid browser.")
	
	if not raid_browser_character_current_raidset then
		raid_browser_character_current_raidset = 'Active';
	end
	
	if not raid_browser_character_raidsets then
		raid_browser_character_raidsets = {
			primary = {},
			secondary = {},
		};
	end

	-- LFM messages expire after 60 seconds
	raid_browser.expiry_time = 60;

	raid_browser.lfm_messages = {}
	raid_browser.timer = raid_browser.set_timer(10, refresh_lfm_messages, true)
	for channel, listener in pairs(lfm_channel_listeners) do
		channel_listeners[channel] = raid_browser.add_event_listener(channel, event_handler)	
	end
	
	raid_browser.gui.raidset.initialize();
end

function raid_browser:OnDisable()
	for channel, listener in pairs(lfm_channel_listeners) do
		raid_browser.remove_event_listener(channel, listener)
	end
	
	raid_browser.kill_timer(raid_browser.timer)
end