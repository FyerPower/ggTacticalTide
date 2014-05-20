-- SCENE_MANAGER:Show("worldMap")

--------------------
-- Cyrodiil
--------------------
-- Castle = AD, Fort = DC, Keep = EP
TT.keepIdOrder = {
	122, 123, 121, 120, 118, 119, -- Scroll temples
	8, 3, 11, 4, 5, 7, 134, 9, 10, 12, 6, 13, 132, 133, 18, 17, 15, 14, 16, 19, 20 -- Keeps
}

TT.keepPositions = {
	{1761, 1692}, {1197, 2716}, {8125, 1804}, {8799, 2830}, {4291, 8409}, {5684, 8379}, -- Scroll temples
	-- Keeps (mill, farm, mine)
	{{4938, 1078}, {4731, 940}, {4771, 1320}, {5321, 1255}}, 
	{{2334, 1755}, {2617, 1663}, {2514, 2084}, {2055, 1765}},
	{{7273, 1785}, {7098, 1701}, {7094, 2108}, {7645, 1948}}, 
	{{1727, 3226}, {1650, 3456}, {1985, 3396}, {1960, 2897}},
	{{2744, 2744}, {3108, 2795}, {2840, 3181}, {2537, 2766}},
	{{4114, 2753}, {3865, 3080}, {4353, 2765}, {3958, 2530}},
	{4955, 2681},
	{{5789, 2800}, {5827, 3199}, {6141, 2727}, {5559, 2689}},
	{{7024, 3225}, {6761, 3191}, {7108, 2897}, {7238, 3179}},
	{{8402, 3288}, {8294, 3519}, {8080, 3236}, {8570, 3086}},
	{{3333, 4213}, {3537, 3968}, {3082, 4046}, {3163, 4386}},
	{{6608, 4228}, {6532, 3963}, {6278, 4310}, {6852, 4324}},
	{3596, 5113},
	{6447, 5020},
	{{2252, 5713}, {2063, 5833}, {2528, 5801}, {2060, 5467}},
	{{4166, 5725}, {4385, 5800}, {4084, 5439}, {3996, 5891}},
	{{5675, 5653}, {5418, 5446}, {5554, 5897}, {5822, 5876}},
	{{7754, 5755}, {7876, 5577}, {7395, 5633}, {7667, 6094}},
	{{4922, 6822}, {5184, 6932}, {4714, 6615}, {5236, 6563}},
	{{4084, 7768}, {3839, 7751}, {4328, 7567}, {4403, 7905}},
	{{5741, 7746}, {6107, 7600}, {5686, 7287}, {5507, 7812}}
}

--[[
TT.keeps = {
	["Fort Warden"] = 3,["Fort Rayles"] = 4,["Fort Glademist"] = 5,["Fort Ash"] = 6,["Fort Aleswell"] = 7,["Fort Dragonclaw"] = 8,
	["Chalman Keep"] = 9,["Arrius Keep"] = 10,["Kingscrest Keep"] = 11,["Farragut Keep"] = 12,["Blue Road Keep"] = 13,["Drakelowe Keep"] = 14,
	["Castle Alessia"] = 15,["Castle Faregyl"] = 16,["Castle Roebeck"] = 17,["Castle Brindle"] = 18,["Castle Black Boot"] = 19,["Castle Bloodmayne"] = 20,
	["Nikel Outpost"] = 132,["Sejanus Outpost"] = 133,["Bleaker's Outpost"] = 134,
	["Scroll Temple of Altadoon"] = 118,["Scroll Temple of Mnem"] = 119,["Scroll Temple of Ghartok"] = 120,["Scroll Temple of Chim"] = 121,["Scroll Temple of Ni-Mohk"] = 122,["Scroll Temple of Alma Ruma"] = 123,["Gate of Altadoon"] = 124,["Gate of Mnem"] = 125,["Gate of Ghartok"] = 126,["Gate of Chim"] = 127,["Gate of Ni-Mohk"] = 128,["Gate of Alma Ruma"] = 129
}

TT.resourceKeeps = {
	["Castle Bloodmayne Farm"] = 22,["Castle Bloodmayne Mine"] = 23,["Castle Bloodmayne Lumbermill"] = 24,["Castle Black Boot Lumbermill"] = 34,["Castle Black Boot Mine"] = 35,["Castle Black Boot Farm"] = 36,["Farragut Keep Lumbermill"] = 37,["Farragut Keep Mine"] = 38,["Farragut Keep Farm"] = 39,["Fort Warden Farm"] = 40,["Fort Warden Lumbermill"] = 41,["Fort Warden Mine"] = 42,["Castle Faregyl Farm"] = 43,["Castle Faregyl Lumbermill"] = 44,["Castle Faregyl Mine"] = 45,["Arrius Keep Farm"] = 46,["Arrius Keep Lumbermill"] = 47,["Arrius Keep Mine"] = 48,["Fort Glademist Farm"] = 49,["Fort Glademist Lumbermill"] = 50,["Fort Glademist Mine"] = 51,["Kingscrest Keep Farm"] = 52,["Kingscrest Keep Lumbermill"] = 53,["Kingscrest Keep Mine"] = 54,["Fort Rayles Farm"] = 55,["Fort Rayles Lumbermill"] = 56,["Fort Rayles Mine"] = 57,["Fort Ash Farm"] = 61,["Fort Ash Lumbermill"] = 62,["Fort Ash Mine"] = 63,["Fort Aleswell Mine"] = 64,["Fort Aleswell Lumbermill"] = 65,["Fort Aleswell Farm"] = 66,["Fort Dragonclaw Mine"] = 67,["Fort Dragonclaw Lumbermill"] = 68,["Fort Dragonclaw Farm"] = 69,["Chalman Keep Mine"] = 70,["Chalman Keep Lumbermill"] = 71,["Chalman Keep Farm"] = 72,["Blue Road Keep Mine"] = 73,["Blue Road Keep Lumbermill"] = 74,["Blue Road Keep Farm"] = 75,["Drakelowe Keep Mine"] = 76,["Drakelowe Keep Lumbermill"] = 77,["Drakelowe Keep Farm"] = 78,["Castle Alessia Mine"] = 79,["Castle Alessia Lumbermill"] = 80,["Castle Alessia Farm"] = 81,["Castle Roebeck Mine"] = 82,["Castle Roebeck Lumbermill"] = 83,["Castle Roebeck Farm"] = 84,["Castle Brindle Mine"] = 85,["Castle Brindle Lumbermill"] = 86,["Castle Brindle Farm"] = 87,["Nikel Outpost"] = 132,["Sejanus Outpost"] = 133,["Bleaker's Outpost"] = 134
}
]]--

function TT:GetKeepRange(xCoord, yCoord, keepIdOrderId, tableIndex)
	local x1 = math.floor(xCoord * 10000 + 0.5)
	local y1 = math.floor(yCoord * 10000 + 0.5)
	local pos
	if (tableIndex == nil) then
		pos = self.keepPositions[keepIdOrderId]
	else
		pos = self.keepPositions[keepIdOrderId][tableIndex]
	end
	local x2 = pos[1]
	local y2 = pos[2]
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2))
end

function TT:GetKeepNumSieges(keepId, allianceId)
	if (GetUnitAlliance("player") == allianceId or (GetKeepAlliance(keepId, 1) == GetUnitAlliance("player") and GetKeepUnderAttack(keepId, 1))) then
		return GetNumSieges(keepId, 1, allianceId)
	else
		return nil
	end
end

function TT:GetKeepInfo(keepId)
	local keep = {}
	
	keep.needAttention = false
	keep.id = keepId
	keep.name = GetKeepName(keep.id)
	keep.type = GetKeepType(keep.id)
	keep.isFriendly = GetKeepAlliance(keep.id, 1) == GetUnitAlliance("player")
	keep.isUnderAttack = GetKeepUnderAttack(keep.id, 1)
	keep.numFriendlySieges = GetNumSieges(keep.id, 1, GetUnitAlliance("player"))
	keep.alliance = GetKeepAlliance(keep.id, 1)
	keep.resourceType = GetKeepResourceType(keep.id)
	
	if (keep.isUnderAttack) then
		keep.needAttention = true

		if (keep.isFriendly) then
			keep.numADSieges = self:GetKeepNumSieges(keep.id, 1)
			keep.numDCSieges = self:GetKeepNumSieges(keep.id, 2)
			keep.numEPSieges = self:GetKeepNumSieges(keep.id, 3)
		end
	end

	if (keep.numFriendlySieges ~= 0) then keep.needAttention = true end
	
	if (keep.isFriendly) then
		keep.numFriendlyNpcs = GetNumFriendlyKeepNPCs(keep.id, 1)
		if (keep.numFriendlyNpcs ~= 0) then keep.needAttention = true end
	end
	
	if (keep.type == KEEPTYPE_KEEP) then
		keep.mill = self:GetKeepInfo(GetResourceKeepForKeep(keep.id, RESOURCETYPE_WOOD))
		keep.farm = self:GetKeepInfo(GetResourceKeepForKeep(keep.id, RESOURCETYPE_FOOD))
		keep.mine = self:GetKeepInfo(GetResourceKeepForKeep(keep.id, RESOURCETYPE_ORE))
		
		if (keep.alliance ~= keep.mill.alliance or keep.alliance ~= keep.farm.alliance or keep.alliance ~= keep.mine.alliance) then keep.needAttention = true end
		
		keep.needAttention = keep.needAttention or keep.mill.needAttention or keep.farm.needAttention or keep.mine.needAttention
	end

	return keep
end



--------------
-- Guild
--------------
-- function TT:GetNumGuilds()
-- 	return GetNumGuilds()
-- end

-- function TT:GetGuildNameFromId(guildId)
-- 	return GetGuildName(guildId)
-- end

-- function TT:GetGuildIdFromName(guildName)
-- 	local numGuild = TT:GetNumGuilds()
-- 	for i = 1, numGuild do
-- 		if (GetGuildName(i) == guildName) then
-- 			return i
-- 		end
-- 	end
-- 	return nil
-- end

-- function TT:GetOnlineGuildMembers(guildId, inCyrodiilOnly)
-- 	local numMem = GetNumGuildMembers()
-- 	local list = {}
-- 	for i = 1, numMem do
-- 		local name, _, _, status, _ = GetGuildMemberInfo(guildId, i) -- Returns string name, string note, luaindex rankIndex, integer playerStatus, integer secsSinceLogoff
-- 		if (status ~= PLAYER_STATUS_OFFLINE) then
-- 			if (inCyrodiilOnly) then
-- 				local _, _, zone, _, _, _, _ = GetGuildMemberCharacterInfo(guildId, i) -- Returns: bool hasCharacter, string characterName, string zoneName, integer classType, integer alliance, integer level, integer veteranRank
-- 				if (zone == "Cyrodiil") then list[#list + 1] = name end
-- 			else
-- 				list[#list + 1] = name
-- 			end
-- 		end
-- 	end
-- 	return list
-- end

-- function TT:GetOnlineGuildMembersInCyrodiil(guildId)
-- 	local numMem = GetNumGuildMembers()
-- 	local list = {}
-- 	for i = 1, numMem do
-- 		local x = GetGuildMemberCharacterInfo(guildId, i) -- Returns: bool hasCharacter, string characterName, string zoneName, integer classType, integer alliance, integer level, integer veteranRank
-- 		local name, _, _, status, _ = GetGuildMemberInfo(guildId, i) -- Returns string name, string note, luaindex rankIndex, integer playerStatus, integer secsSinceLogoff
-- 		if (status ~= PLAYER_STATUS_OFFLINE) then
-- 			list[#list + 1] = name
-- 		end
-- 	end
-- 	return list
-- end




