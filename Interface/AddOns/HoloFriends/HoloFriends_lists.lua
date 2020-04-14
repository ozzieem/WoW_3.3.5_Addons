--[[
HoloFriends addon created by Holo, continued by Zappster, followed by Andymon

Get the latest version at wow.curse.com

See HoloFriends_change.log for more informations  
]]

--[[

This file defines getters/setters of lists ( i.e. friends list, ignore list)

]]

local HF_Anonym = false;

local HF_Class_Colors = {
	["WARRIOR"]     = {RAID_CLASS_COLORS.WARRIOR.r, RAID_CLASS_COLORS.WARRIOR.g, RAID_CLASS_COLORS.WARRIOR.b},
	["MAGE"]        = {RAID_CLASS_COLORS.MAGE.r, RAID_CLASS_COLORS.MAGE.g, RAID_CLASS_COLORS.MAGE.b},
	["ROGUE"]       = {RAID_CLASS_COLORS.ROGUE.r, RAID_CLASS_COLORS.ROGUE.g, RAID_CLASS_COLORS.ROGUE.b},
	["DRUID"]       = {RAID_CLASS_COLORS.DRUID.r, RAID_CLASS_COLORS.DRUID.g, RAID_CLASS_COLORS.DRUID.b},
	["HUNTER"]      = {RAID_CLASS_COLORS.HUNTER.r, RAID_CLASS_COLORS.HUNTER.g, RAID_CLASS_COLORS.HUNTER.b},
	["SHAMAN"]      = {RAID_CLASS_COLORS.SHAMAN.r, RAID_CLASS_COLORS.SHAMAN.g, RAID_CLASS_COLORS.SHAMAN.b},
	["PRIEST"]      = {RAID_CLASS_COLORS.PRIEST.r, RAID_CLASS_COLORS.PRIEST.g, RAID_CLASS_COLORS.PRIEST.b},
	["WARLOCK"]     = {RAID_CLASS_COLORS.WARLOCK.r, RAID_CLASS_COLORS.WARLOCK.g, RAID_CLASS_COLORS.WARLOCK.b},
	["PALADIN"]     = {RAID_CLASS_COLORS.PALADIN.r, RAID_CLASS_COLORS.PALADIN.g, RAID_CLASS_COLORS.PALADIN.b},
	["DEATHKNIGHT"] = {RAID_CLASS_COLORS.DEATHKNIGHT.r, RAID_CLASS_COLORS.DEATHKNIGHT.g, RAID_CLASS_COLORS.DEATHKNIGHT.b}
};


--[[
  check if index is valid
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_IsListIndexValid(list, index)
	return ( list and index and (index > 0) and (index <= table.getn(list)));
end


--[[
  returns true if RealID flag is set
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_IsRealID(list, index)
	return ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].realid );
end


--[[
  returns true if BNet friend is same faction as char
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_SameFaction(list, index)
	return ( HoloFriendsLists_IsListIndexValid(list, index) and
		 (PLAYER_FACTION_GROUP[list[index].faction] == UnitFactionGroup("player")) );
end


--[[
  returns true if BNet friend is same realm as char
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_SameRealm(list, index)
	return ( HoloFriendsLists_IsListIndexValid(list, index) and (list[index].realm == GetCVar("realmName")) );
end


--[[
  returns the toon name of the entry
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetToon(list, index, long)
	if ( HoloFriendsLists_IsRealID(list, index) ) then
		if ( long ) then
			local tname = list[index].toon;
			if ( tname ) then tname = tname.." "; end
			local realm = list[index].realm;
			if ( realm ) then realm = "("..realm..") "; end
			local client = list[index].client;
			local faction = list[index].faction;
			-- see constant PLAYER_FACTION_GROUP in interface\constants.lua
			if ( client and faction and (faction == 0) ) then client = "|cffff0000"..client.."|r"; end -- Horde
			if ( client and faction and (faction == 1) ) then client = "|cff3333ff"..client.."|r"; end -- Alliance
			if ( tname or realm or client ) then return (tname or "")..(realm or "")..(client or ""); end 
		else
			local tname = list[index].toon;
			if ( tname ) then return tname; end
		end
	end
	return;
end


--[[
  returns true if connected flag is set
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_IsConnected(list, index)
	return ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].connected );
end


--[[
  returns the level of the entry, or HOLOFRIENDS_TOOLTIPUNKNOWN if no data is available
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetLevel(list, index)
	if ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].level ) then
		return list[index].level;
	else
		return HOLOFRIENDS_TOOLTIPUNKNOWN;
	end
end


--[[
  returns the class of the entry, or UNKNOWN if no data is available
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetLCClass(list, index)
	if ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].lc_class ) then
		return list[index].lc_class;
	else
		return UNKNOWN;
	end
end


--[[
  returns the area of the entry, or UNKNOWN if no data is available
  @param list - Table
  @param index - int
  @param setcolor - bolean
]]
function HoloFriendsLists_GetArea(list, index, setcolor)
	if ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].area ) then
		local area = list[index].area
		if ( setcolor ) then
			if ( GetRealZoneText() == area ) then
				area = "|cff55bb00"..area.."|r"
			end
			if ( list[index].realid ) then
				realm = list[index].realm;
				if ( realm and (realm ~= GetCVar("realmName")) ) then
					area = area.." ("..realm..")";
				end
			end
			if ( list[index].onstate and list[index].connected ) then
				area = area.." "..list[index].onstate;
			end
			if ( list[index].bcast and (list[index].bcast ~= "") and list[index].connected ) then
				area = area.." <B>";
			end
		end
		return area;
	else
		return UNKNOWN;
	end
end


--[[
  returns the lastSeen value of the entry, or UNKNOWN if no data is available
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetLastSeen(list, index)
	if ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].lastSeen ) then
		return list[index].lastSeen;
	end
	return UNKNOWN;
end


--[[
  returns the lastOnline value of the entry, or UNKNOWN if no data is available
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetLastOnline(list, index)
	if ( HoloFriendsLists_IsRealID(list, index) ) then
		if ( not list[index].connected and list[index].onstate ) then
			return list[index].onstate;
		else
			return 0;
		end
	end
	return UNKNOWN;
end


--[[
  get the notify flag of a player (player in server friends list)
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetNotify(list, index)
	if ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].notify ) then
		return list[index].notify;
	end
	return nil;
end


--[[
  returns the comment of the entry
  @param list - Table (list or ignoreList)
  @param index - int
]]
function HoloFriendsLists_GetComment(list, index)
	if ( HoloFriendsLists_IsListIndexValid(list, index) and list[index].comment ) then
		return list[index].comment;
	end
	return "";
end


--[[
  returns the broadcast message of the entry
  @param list - Table (list or ignoreList)
  @param index - int
]]
function HoloFriendsLists_GetBCast(list, index)
	if ( HoloFriendsLists_IsRealID(list, index) and list[index].bcast ) then
		return list[index].bcast;
	end
	return "";
end


--[[
  set the notify flag of a player
  @param list - Table
  @param index - int
  @param notify - bol
  @param silent - bol
]]
function HoloFriendsLists_SetNotify(list, index, notify, quiet, runwhat, flags)
	if ( not HoloFriendsLists_IsPlayer(list, index) ) then return false; end

	list[index].notify = notify;
	local name = list[index].name;

	flags.Name = name;
	flags.RunListUpdate = runwhat;
	flags.Quiet = quiet;
	local done = true;
	if ( notify ) then
		done = HoloFriendsFuncs_AddToServerList(flags);
	else
		done = HoloFriendsFuncs_RemoveFromServerList(flags);
	end
	if ( done ) then
		HoloFriends_chat("Server list changed for "..name, HF_DEBUG_OUTPUT);
		return true;
	else
		HoloFriends_chat("Server list NOT changed", HF_DEBUG_OUTPUT);
	end

	HoloFriendsFuncs_CheckRunListUpdate(flags);
	return false;
end


--[[
  set the comment of a player (set always both, in-game note and HoloFriends comment)
  @param list - Table (friends or ignore list)
  @param index - int
  @param comment - str
  @param FL - bolean
  @param share - bolean
]]
function HoloFriendsLists_SetComment(list, index, comment, FL, share)
	if ( (not HoloFriendsLists_IsListIndexValid(list, index)) or (not comment) ) then
		return;
	end

	if ( comment == "" ) then list[index].comment = nil;
			     else list[index].comment = comment; end

	if ( FL and not share ) then list[index].mergecnt = nil; end
	if ( FL and list[index].notify ) then
		local name = list[index].name;
		if ( list[index].realid ) then
			local numNotifyFriends = BNGetNumFriends();
			for inum = 1, numNotifyFriends do
				local pID, gname, sname = BNGetFriendInfo(inum);
				local iname = string.format(BATTLENET_NAME_FORMAT, gname, sname);
				if ( iname == name ) then
					BNSetFriendNote(pID, comment);
					return;
				end
			end
		else
			local numNotifyFriends = GetNumFriends();
			for inum = 1, numNotifyFriends do
				local iname = GetFriendInfo(inum);
				if ( iname == name ) then
					HoloFriends_EventFlags.SetFriendNotes = true;
					SetFriendNotes(inum, comment);
					return;
				end
			end
		end
	end
end


-- **********************************************
-- *** list functions for                NAME ***
-- **********************************************

--[[
  returns the name of the entry if it is a player, or group name if it is a group
  @param list - Table
  @param index - int
  @param display - bolean (name is shown)
  @param setcolor - bolean (name in class color)
  @param showtoon - bolean (show char name behind BNet-name)
]]
function HoloFriendsLists_GetName(list, index, display, setcolor, showtoon)
	if ( not HoloFriendsLists_IsListIndexValid(list, index) ) then
		return UNKNOWN;
	end;

	if ( HoloFriendsLists_IsGroup(list, index) ) then
		if ( HF_Anonym and display and (list[index].group ~= FRIENDS) and (list[index].group ~= IGNORE) ) then
			return GROUP;
		else
			return list[index].group;
		end
	else
		local class = list[index].class;
		local colors;
		if ( class and setcolor ) then
			colors = HF_Class_Colors[class];
		end

		local name = list[index].name;
		local toon = list[index].toon;
		local BNname = "";
		if ( showtoon and list[index].realid and toon and (toon ~= "") ) then
			BNname = name;
			name = toon;
			local faction = list[index].faction;
			local c1 = "";
			if ( faction and (faction == 0) ) then c1 = "|cffff0000"; end  -- Horde
			if ( faction and (faction == 1) ) then c1 = "|cff3333ff"; end  -- Alliance
			local c2 = ""; if ( c1 ~= "" ) then c2 = "|r"; end
			BNname = c1..BNname..c2;
			name = " ("..name..")";
		end

		if ( colors ) then
			local red = string.format("%x",math.floor(colors[1]*255));
			if strlen(red) == 1 then red = "0"..red; end
			local green = string.format("%x",math.floor(colors[2]*255));
			if strlen(green) == 1 then green = "0"..green; end
			local blue = string.format("%x",math.floor(colors[3]*255));
			if strlen(blue) == 1 then blue = "0"..blue; end
			if ( HF_Anonym and display ) then
				return "|cff"..red..green..blue..PLAYER.."|r";
			else
				name = "|cff"..red..green..blue..name.."|r";
				return BNname..name;
			end
		else
			if ( HF_Anonym and display ) then
				if ( string.sub(name,1,1) == "(" ) then
					return "("..PLAYER..")";
				else
					return PLAYER;
				end
			else
				return name;
			end
		end
	end
end


--[[
  returns nil or the index of name on the list
  @param list - Table
  @param name - String
]]
function HoloFriendsLists_ContainsPlayer(list, name)
	if ( not name or name == "" ) then
		return nil;
	end

	-- check the name in lowercase letters, because in our list the lettercase could be different
	-- (WoW change the first letter always to uppercase and the others to lowercase)
	lname = string.lower(name);

	local maxi = table.getn(list);
	for index = 1, maxi do
		local iname = HoloFriendsLists_GetName(list, index);
		if ( HoloFriendsLists_IsPlayer(list, index) and
		     string.lower(iname) == lname )
		then
			-- set the list name to the WoW name if different
			if ( iname ~= name ) then list[index].name = name; end
			return index;
		end
	end
	return nil;
end


--[[
  returns true if entry is a player
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_IsPlayer(list, index)
	return ( HoloFriendsLists_IsListIndexValid(list, index) and 
		 not (list[index].name == "0" or list[index].name == "1")
	);
end


-- **********************************************
-- *** list functions for               GROUP ***
-- **********************************************

--[[
  add a group to the list
  @param list - Table
  @param group - String
]]
function HoloFriendsLists_AddGroup(list, group)
	if (not group or (group == "") ) then return; end

	local groupIndex = HoloFriendsLists_ContainsGroup(list, group);
	if ( not groupIndex ) then
		local temp = {};
		temp.name = "1";
		temp.group = group;

		table.insert(list, temp);

		table.sort(list, HoloFriendsFuncs_CompareEntry);
	end
end


--[[
  returns the group of the entry or UNKNOWN
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_GetGroup(list, index)
	if ( not HoloFriendsLists_IsListIndexValid(list, index) ) then
		return UNKNOWN;
	end;

	return list[index].group;
end


--[[
  returns the index of given group name, nil if we do not have name in our list
  @param list - Table
  @param group - String
]]
function HoloFriendsLists_ContainsGroup(list, group)
	if (not list or not group or (group == "") ) then return nil; end

	local maxi = table.getn(list);
	for index = 1, maxi do
		if ( HoloFriendsLists_IsGroup(list, index) and
		     HoloFriendsLists_GetGroup(list, index) == group)
		then
			return index;
		end
	end
	return nil;
end


--[[
  returns true if entry is a group
  @param list - Table
  @param index - int
]]
function HoloFriendsLists_IsGroup(list, index)
	return ( HoloFriendsLists_IsListIndexValid(list, index) and 
		 (list[index].name == "0" or list[index].name == "1")
	);
end


--[[
  renames the given group from the list
  @param list - Table
  @param index - int
  @param name - String
]]
function HoloFriendsLists_RenameGroup(list, index, name)
	if ( not name or (name == "") ) then return; end;

	local group = HoloFriendsLists_GetGroup(list, index);
	-- who want's a group 'friends' on his igno-list? It's a cleaner API without any extra-argument
	if ( group == FRIENDS or group == IGNORE or group == UNKNOWN ) then
		return;
	end

	-- move all players belonging to this group
	for idx, entry in pairs(list) do
		if ( entry.group == group ) then
			entry.group = name;
		end
	end
end


--[[
  remove a group from the list
  @param list - Table
  @param index - int
  @param moveToGroup - String
]]
function HoloFriendsLists_RemoveGroup(list, index, moveToGroup)
	local group = HoloFriendsLists_GetGroup(list, index);
	if ( group == moveToGroup or group == FRIENDS or group == IGNORE or group == UNKNOWN ) then
		return;
	end

	table.remove(list, index);

	-- move all players belonging to this group
	for idx, entry in pairs(list) do
		if ( entry.group == group ) then
			entry.group = moveToGroup;
		end
	end

	table.sort(list, HoloFriendsFuncs_CompareEntry);
end
