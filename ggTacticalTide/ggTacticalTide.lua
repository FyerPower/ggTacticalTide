TT = {}
TT.name = "ggTacticalTide"
TT.version = "0.3.0"
TT.author = "gamegenius86"
TT.shouldShowFrames = true
TT.init = false

TT.defaultSettings = {
	["cyrodiilFrameEnabled"]     = true,
	["groupFrameEnabled"]        = true,
	["cyrodiilFrameLocked"]      = true,
	["cyrodiilFrameAnchor"]      = {TOPLEFT, TOPLEFT, 0, 0},
	["cyrodiilFrameMaxColumns"]  = 2,
	["cyrodiilFrameMaxHeight"]   = 700,
	["cyrodiilFrameLeftToRight"] = true
}

function TT.Initialize(eventCode, addOnName)
	if addOnName ~= TT.name then return end
	
	TT.savedVars = ZO_SavedVars:NewAccountWide("TT_SavedVars", 1, nil, TT.defaultSettings, nil)
	
	TT.InitSettings()
	
	TT.Cyrodiil:Initialize()
	
	TT.RegisterEvents()
	
	-- Mark Initialized (Thus OnUpdate and start firing)
	TT.init = true

  -- Once we've loaded ours, lets unregister the event listener
  EVENT_MANAGER:UnregisterForEvent('GGF', EVENT_ADD_ON_LOADED)
end

function TT.RegisterEvents()
  EVENT_MANAGER:RegisterForEvent('GGTT', EVENT_PLAYER_ACTIVATED , TT.OnPlayerActivated )
	EVENT_MANAGER:RegisterForEvent('GGTT', EVENT_ACTION_LAYER_POPPED, TT.ToggleVisibility)
	EVENT_MANAGER:RegisterForEvent('GGTT', EVENT_ACTION_LAYER_PUSHED, TT.ToggleVisibility)
end

function TT.OnPlayerActivated()
  d( '|cFFD700'..TT.name..' v'..TT.version..'|r |cFFFFFFLoaded|r')
  EVENT_MANAGER:UnregisterForEvent('GGTT', EVENT_PLAYER_ACTIVATED)
end

function TT.OnUpdate()
	if not TT.init then return end
	if not TT.BufferReached("OnUpdate", 1000) then return end
	TT.CheckMap()
	TT.Cyrodiil:OnUpdate()
end

function TT.ToggleVisibility(eventCode, layerIndex, activeLayerIndex)
	TT.shouldShowFrames = activeLayerIndex < 3
end

local BufferTable = {}
function TT.BufferReached(key, time)
	if key == nil then return end
	local current = GetFrameTimeMilliseconds()
	if (current - (BufferTable[key] or 0)) >= (time or 300) then
		BufferTable[key] = current
		return true
	end
	return false
end

EVENT_MANAGER:RegisterForEvent(TT.name, EVENT_ADD_ON_LOADED, TT.Initialize)




-- what the hell is this ?!?!?!?! :P

local monitorMapOpen = false
local monitorLocation
function TT.CheckMap()
	-- If Compass is hidden
	if ZO_CompassContainer:IsHidden() then
		-- if ______ and World Map is now Shown
		if monitorMapOpen and not ZO_WorldMap:IsHidden() then
			monitorMapOpen = false		
			ZO_WorldMap_UpdateMap() -- Expensive
		end
	else
		local oldMapLocation = GetMapName()
		SetMapToPlayerLocation()
		local newMapLocation = GetMapName()
		
		if (oldMapLocation ~= newMapLocation) then
			if (monitorMapOpen) then
				if (monitorLocation == newMapLocation) then
					monitorMapOpen = false
				end
			else
				monitorMapOpen = true
				monitorLocation = oldMapLocation
			end
		end
	end
end