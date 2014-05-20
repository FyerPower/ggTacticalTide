TT.Cyrodiil = {}

TT.Cyrodiil.Images = {
	["NpcAD"] = "ggTacticalTide/Images/npc_aldmeri.dds",
	["NpcDC"] = "ggTacticalTide/Images/npc_daggerfall.dds",
	["NpcEP"] = "ggTacticalTide/Images/npc_ebonheart.dds",
	["SiegeAD"] = "ggTacticalTide/Images/siege_aldmeri.dds",
	["SiegeDC"] = "ggTacticalTide/Images/siege_daggerfall.dds",
	["SiegeEP"] = "ggTacticalTide/Images/siege_ebonheart.dds",
	
	["KeepNeutral"] = "esoui/art/mappins/ava_largekeep_neutral.dds",
	["KeepNeutralUnderAttack"] = "esoui/art/mappins/ava_largekeep_neutral_underattack.dds",
	["KeepAD"] = "esoui/art/mappins/ava_largekeep_aldmeri.dds",
	["KeepADUnderAttack"] = "esoui/art/mappins/ava_largekeep_aldmeri_underattack.dds",
	["KeepDC"] = "esoui/art/mappins/ava_largekeep_daggerfall.dds",
	["KeepDCUnderAttack"] = "esoui/art/mappins/ava_largekeep_daggerfall_underattack.dds",
	["KeepEP"] = "esoui/art/mappins/ava_largekeep_ebonheart.dds",
	["KeepEPUnderAttack"] = "esoui/art/mappins/ava_largekeep_ebonheart_underattack.dds",
	
	["TempleAD"] = "esoui/art/mappins/ava_artifacttemple_aldmeri.dds",
	["TempleADUnderAttack"] = "esoui/art/mappins/ava_artifacttemple_aldmeri_underattack.dds",
	["TempleDC"] = "esoui/art/mappins/ava_artifacttemple_daggerfall.dds",
	["TempleDCUnderAttack"] = "esoui/art/mappins/ava_artifacttemple_daggerfall_underattack.dds",
	["TempleEP"] = "esoui/art/mappins/ava_artifacttemple_ebonheart.dds",
	["TempleEPUnderAttack"] = "esoui/art/mappins/ava_artifacttemple_ebonheart_underattack.dds",
	
	["OutpostNeutral"] = "esoui/art/mappins/ava_outpost_neutral.dds",
	["OutpostNeutralUnderAttack"] = "ggTacticalTide/Images/ava_outpost_neutral_underattack.dds",
	["OutpostAD"] = "esoui/art/mappins/ava_outpost_aldmeri.dds",
	["OutpostADUnderAttack"] = "ggTacticalTide/Images/ava_outpost_aldmeri_underattack.dds",
	["OutpostDC"] = "esoui/art/mappins/ava_outpost_daggerfall.dds",
	["OutpostDCUnderAttack"] = "ggTacticalTide/Images/ava_outpost_daggerfall_underattack.dds",
	["OutpostEP"] = "esoui/art/mappins/ava_outpost_ebonheart.dds",
	["OutpostEPUnderAttack"] = "ggTacticalTide/Images/ava_outpost_ebonheart_underattack.dds",
	
	["MillNeutral"] = "esoui/art/mappins/ava_lumbermill_neutral.dds",
	["MillNeutralUnderAttack"] = "ggTacticalTide/Images/ava_lumbermill_neutral_underattack.dds",
	["MillAD"] = "esoui/art/mappins/ava_lumbermill_aldmeri.dds",
	["MillADUnderAttack"] = "ggTacticalTide/Images/ava_lumbermill_aldmeri_underattack.dds",
	["MillDC"] = "esoui/art/mappins/ava_lumbermill_daggerfall.dds",
	["MillDCUnderAttack"] = "ggTacticalTide/Images/ava_lumbermill_daggerfall_underattack.dds",
	["MillEP"] = "esoui/art/mappins/ava_lumbermill_ebonheart.dds",
	["MillEPUnderAttack"] = "ggTacticalTide/Images/ava_lumbermill_ebonheart_underattack.dds",

	["FarmNeutral"] = "esoui/art/mappins/ava_farm_neutral.dds",
	["FarmNeutralUnderAttack"] = "ggTacticalTide/Images/ava_farm_neutral_underattack.dds",
	["FarmAD"] = "esoui/art/mappins/ava_farm_aldmeri.dds",
	["FarmADUnderAttack"] = "ggTacticalTide/Images/ava_farm_aldmeri_underattack.dds",
	["FarmDC"] = "esoui/art/mappins/ava_farm_daggerfall.dds",
	["FarmDCUnderAttack"] = "ggTacticalTide/Images/ava_farm_daggerfall_underattack.dds",
	["FarmEP"] = "esoui/art/mappins/ava_farm_ebonheart.dds",
	["FarmEPUnderAttack"] = "ggTacticalTide/Images/ava_farm_ebonheart_underattack.dds",
	
	["MineNeutral"] = "esoui/art/mappins/ava_mine_neutral.dds",
	["MineNeutralUnderAttack"] = "ggTacticalTide/Images/ava_mine_neutral_underattack.dds",
	["MineAD"] = "esoui/art/mappins/ava_mine_aldmeri.dds",
	["MineADUnderAttack"] = "ggTacticalTide/Images/ava_mine_aldmeri_underattack.dds",
	["MineDC"] = "esoui/art/mappins/ava_mine_daggerfall.dds",
	["MineDCUnderAttack"] = "ggTacticalTide/Images/ava_mine_daggerfall_underattack.dds",
	["MineEP"] = "esoui/art/mappins/ava_mine_ebonheart.dds",
	["MineEPUnderAttack"] = "ggTacticalTide/Images/ava_mine_ebonheart_underattack.dds"
}

local KEEP_PANEL_WIDTH = 180
local KEEP_CLOSE_RANGE = 500
local RESOURCE_CLOSE_RANGE = 100
local KEEP_CLOSE_BACKDROP_COLOR = {0, 0.5, 0, 0.25}
local RESOURCE_CLOSE_BACKDROP_COLOR = {0, 0.5, 0, 0.25}

local mainWin
local npcImg, siege1Img, siege2Img, siege3Img
local playerAlliance

TT.Cyrodiil.keepPanels = {}
local numActivePanels = 0

-- Settings
local isEnabled = true
local isLocked = true
local isLeftToRight = true
local maxColumns = 2
local maxHeight = 700
local position = {0, 0}
--

function TT.Cyrodiil:Initialize()
	playerAlliance = GetUnitAlliance("player")
	
	if (playerAlliance == ALLIANCE_ALDMERI_DOMINION) then
		npcImg = self.Images.NpcAD
		siege1Img = self.Images.SiegeAD
		siege2Img = self.Images.SiegeDC
		siege3Img = self.Images.SiegeEP
	elseif (playerAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
		npcImg = self.Images.NpcDC
		siege1Img = self.Images.SiegeDC
		siege2Img = self.Images.SiegeEP
		siege3Img = self.Images.SiegeAD
	elseif (playerAlliance == ALLIANCE_EBONHEART_PACT) then
		npcImg = self.Images.NpcEP
		siege1Img = self.Images.SiegeEP
		siege2Img = self.Images.SiegeAD
		siege3Img = self.Images.SiegeDC
	end
	
	mainWin = TT.UI:TopLevelWindow(nil, "TT_CyrodiilWin", GuiRoot, {maxColumns * KEEP_PANEL_WIDTH, maxHeight}, {TOPLEFT, TOPLEFT, position[1], position[2]}, true)
	
	mainWin.backdrop:SetHidden(true)
	mainWin:SetHandler("OnMouseUp", function() self:OnMouseUp() end)

	-- Load settings
	self:SetEnabled(TT.savedVars.cyrodiilFrameEnabled)
	self:SetLocked(TT.savedVars.cyrodiilFrameLocked)
	self:SetAnchor(TT.savedVars.cyrodiilFrameAnchor)
	self:SetMaxColumns(TT.savedVars.cyrodiilFrameMaxColumns)
	self:SetMaxHeight(TT.savedVars.cyrodiilFrameMaxHeight)
	self:SetLeftToRight(TT.savedVars.cyrodiilFrameLeftToRight)
end

------------------
-- Settings
------------------
function TT.Cyrodiil:SetEnabled(isEnabled2)
	isEnabled = isEnabled2
	mainWin:SetHidden(isEnabled == false)
end

function TT.Cyrodiil:SetLocked(isLocked2)
	isLocked = isLocked2
	mainWin.backdrop:SetHidden(isLocked)
	mainWin:SetMouseEnabled(isLocked == false)
	mainWin:SetMovable(isLocked == false)
end

function TT.Cyrodiil:SetMaxColumns(columns)
	maxColumns = columns
	local width = maxColumns * KEEP_PANEL_WIDTH
	mainWin:SetWidth(width)
	mainWin.backdrop:SetWidth(width)
end

function TT.Cyrodiil:SetMaxHeight(height)
	maxHeight = height
	mainWin:SetHeight(maxHeight)
	mainWin.backdrop:SetHeight(maxHeight)
end

function TT.Cyrodiil:SetLeftToRight(value)
	isLeftToRight = value
end

function TT.Cyrodiil:SetAnchor(anchor)
	mainWin:ClearAnchors()
	mainWin:SetAnchor(anchor[1], GuiRoot, anchor[2], anchor[3], anchor[4])
end

function TT.Cyrodiil:SaveAnchor(anchor)
	TT.savedVars.cyrodiilFrameAnchor = anchor
end

function TT.Cyrodiil:OnMouseUp()
	local needReset = false
	local left, top = mainWin:GetLeft(), mainWin:GetTop()
	
	if (left < 0) then
		left = 0
		needReset = true
	elseif (left + mainWin:GetWidth() > GuiRoot:GetWidth()) then
		left = GuiRoot:GetWidth() - mainWin:GetWidth()
		needReset = true
	end
	if (top < 0) then
		top = 0
		needReset = true
	elseif (top + mainWin:GetHeight() > GuiRoot:GetHeight()) then
		top = GuiRoot:GetHeight() - mainWin:GetHeight()
		needReset = true
	end
	
	if (needReset) then
		local anchor = {TOPLEFT, TOPLEFT, left, top}
		self:SetAnchor(anchor)
		self:SaveAnchor(anchor)
	else
		local _, a, b, c, x, y = mainWin:GetAnchor()
		local anchor = {a, c, x, y}
		self:SaveAnchor(anchor)
	end
end
------------------

function TT.Cyrodiil:OnUpdate()
	if (isEnabled == false) then return end
	if (TT.shouldShowFrames or isLocked == false) then
		mainWin:SetHidden(false)
	else
		mainWin:SetHidden(true)
		return
	end
	if (not IsInCampaign() and numActivePanels == 0) then return end
	
	local panelCount = 0
	
	if IsInCampaign() then
		local currentYCoord = 0
		local currentXCoord = isLeftToRight and 0 or (KEEP_PANEL_WIDTH) * (maxColumns - 1)
		local currentColumn = 1
		
		local checkKeepClose = true
		local playerXCoord, playerYCoord = GetMapPlayerPosition("player")
		
		if GetMapName() ~= "Cyrodiil" then checkKeepClose = false end
		
		for keepIdOrderId, keepId in pairs(TT.keepIdOrder) do
			local k = TT:GetKeepInfo(keepId)
			
			if (k.needAttention) then
				local panel
				if (panelCount + 1 <= #self.keepPanels) then
					panel = self.keepPanels[panelCount + 1]
				else
					panel = self:CreateKeepPanel()
					table.insert(self.keepPanels, panel)
				end
				panelCount = panelCount + 1
				panel:SetHidden(false)
				panel:ClearAnchors()
				panel:SetAnchor(TOPLEFT, mainWin, TOPLEFT, currentXCoord, currentYCoord)
				
				local height = 69
				
				panel.nameLbl:SetText(self:SimplifyKeepName(k.name))
				panel.keepTex:SetTexture(self:GetImage(k.type, k.alliance, k.isUnderAttack))
				
				self:PopulateLabelInfo(k, panel.npcLbl, panel.siege1Lbl, panel.siege2Lbl, panel.siege3Lbl, playerAlliance)
				
				panel.backdrop:SetCenterColor(unpack(TT.Color.DefaultBackdrop))
				
				local checkResourceClose = false
				
				if (checkKeepClose and TT:GetKeepRange(playerXCoord, playerYCoord, keepIdOrderId, k.type == KEEPTYPE_KEEP and 1 or nil) <= KEEP_CLOSE_RANGE) then
					checkKeepClose = false
					checkResourceClose = true
					panel.backdrop:SetCenterColor(unpack(KEEP_CLOSE_BACKDROP_COLOR))
				end
				
				panel.row1:SetHidden(true)
				panel.row2:SetHidden(true)
				panel.row3:SetHidden(true)

				if (k.type == KEEPTYPE_KEEP) then
					local resources = {k.mill, k.farm, k.mine}
					local currentRow = panel.row1
					for i = 1, #resources do
						local res = resources[i]
						if (res.needAttention or res.alliance ~= k.alliance) then
							currentRow.tex:SetTexture(self:GetImage(res.type, res.alliance, res.isUnderAttack, res.resourceType))
							self:PopulateLabelInfo(res, currentRow.npcLbl, currentRow.siege1Lbl, currentRow.siege2Lbl, currentRow.siege3Lbl, playerAlliance)
							currentRow:SetHidden(false)
							
							if (checkResourceClose and TT:GetKeepRange(playerXCoord, playerYCoord, keepIdOrderId, i + 1) <= RESOURCE_CLOSE_RANGE) then
								checkResourceClose = false
								currentRow.backdrop:SetHidden(false)
							else
								currentRow.backdrop:SetHidden(true)
							end
							
							height = height + 22
							
							if (currentRow == panel.row1) then currentRow = panel.row2
							elseif (currentRow == panel.row2) then currentRow = panel.row3
							end
						end
					end
				end
				
				panel.backdrop:SetHeight(height)
				
				if (currentYCoord + height > maxHeight) then
					currentColumn = currentColumn + 1
					if (currentColumn <= maxColumns and height <= maxHeight) then
						if (isLeftToRight) then currentXCoord = currentXCoord + KEEP_PANEL_WIDTH
						else currentXCoord = currentXCoord - KEEP_PANEL_WIDTH
						end
						currentYCoord = 0
						panel:ClearAnchors()
						panel:SetAnchor(TOPLEFT, mainWin, TOPLEFT, currentXCoord, currentYCoord)
					else
						panel:SetHidden(true)
						panelCount = panelCount - 1
						break
					end
				end
				currentYCoord = currentYCoord + height
			end
		end
	end
	
	for i = panelCount + 1, numActivePanels do
		self.keepPanels[i]:SetHidden(true)
	end
	numActivePanels = panelCount
end

function TT.Cyrodiil:PopulateLabelInfo(keepInfo, npcLbl, siege1Lbl, siege2Lbl, siege3Lbl, playerAlliance)
	local INACTIVE_ALPHA = 0.25
	
	siege1Lbl:SetText(keepInfo.numFriendlySieges)
	siege1Lbl:SetAlpha(keepInfo.numFriendlySieges == 0 and INACTIVE_ALPHA or 1)
	
	if (keepInfo.isFriendly) then
		npcLbl:SetText(keepInfo.numFriendlyNpcs)
		npcLbl:SetAlpha(keepInfo.numFriendlyNpcs == 0 and INACTIVE_ALPHA or 1)
	else
		npcLbl:SetText(nil)
	end
	
	if (playerAlliance == ALLIANCE_ALDMERI_DOMINION) then
		if (keepInfo.isFriendly and keepInfo.isUnderAttack) then
			siege2Lbl:SetText(keepInfo.numDCSieges)
			siege3Lbl:SetText(keepInfo.numEPSieges)
			siege2Lbl:SetAlpha(keepInfo.numDCSieges == 0 and INACTIVE_ALPHA or 1)
			siege3Lbl:SetAlpha(keepInfo.numEPSieges == 0 and INACTIVE_ALPHA or 1)
		else
			siege2Lbl:SetText(nil)
			siege3Lbl:SetText(nil)
		end
	elseif (playerAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
		if (keepInfo.isFriendly and keepInfo.isUnderAttack) then
			siege2Lbl:SetText(keepInfo.numEPSieges)
			siege3Lbl:SetText(keepInfo.numADSieges)
			siege2Lbl:SetAlpha(keepInfo.numEPSieges == 0 and INACTIVE_ALPHA or 1)
			siege3Lbl:SetAlpha(keepInfo.numADSieges == 0 and INACTIVE_ALPHA or 1)
		else
			siege2Lbl:SetText(nil)
			siege3Lbl:SetText(nil)
		end
	elseif (playerAlliance == ALLIANCE_EBONHEART_PACT) then
		if (keepInfo.isFriendly and keepInfo.isUnderAttack) then
			siege2Lbl:SetText(keepInfo.numADSieges)
			siege3Lbl:SetText(keepInfo.numDCSieges)
			siege2Lbl:SetAlpha(keepInfo.numADSieges == 0 and INACTIVE_ALPHA or 1)
			siege3Lbl:SetAlpha(keepInfo.numDCSieges == 0 and INACTIVE_ALPHA or 1)
		else
			siege2Lbl:SetText(nil)
			siege3Lbl:SetText(nil)
		end
	end

end

function TT.Cyrodiil:SimplifyKeepName(keepName)
	return keepName
		:gsub("Fort ", "")
		:gsub("Castle ", "")
		:gsub(" Keep", "")
		:gsub(" Outpost", "")
		:gsub("Scroll Temple of ", "")
end

function TT.Cyrodiil:CreateKeepPanel()
	local panelName = mainWin:GetName() .. "KeepPanel" .. #self.keepPanels + 1

	local keepPanel = TT.UI:Control(nil, panelName, mainWin, {KEEP_PANEL_WIDTH, 64}, {TOPLEFT, TOPLEFT, 0, 0})
	keepPanel.backdrop = TT.UI:Backdrop(nil, panelName .. "Backdrop", keepPanel, nil, {TOPLEFT, TOPLEFT, 0, 0})
	
	keepPanel.keepTex = TT.UI:Texture(nil, panelName .. "KeepTex", keepPanel, {64, 64}, {TOPLEFT, TOPLEFT, 0, 0}, nil)
	keepPanel.nameLbl = TT.UI:Label(nil, panelName .. "KeepNameLbl", keepPanel, {200, nil}, {TOPLEFT, TOPLEFT, 69, 2}, nil, nil)
	
	keepPanel.npcTex = TT.UI:Texture(nil, panelName .. "NpcTex", keepPanel, {32, 32}, {CENTER, TOPLEFT, 76, 35}, npcImg)
	keepPanel.siege1Tex = TT.UI:Texture(nil, panelName .. "Siege1Tex", keepPanel, {32, 32}, {CENTER, TOPLEFT, 104, 35}, siege1Img)
	keepPanel.siege2Tex = TT.UI:Texture(nil, panelName .. "Siege2Tex", keepPanel, {32, 32}, {CENTER, TOPLEFT, 132, 35}, siege2Img)
	keepPanel.siege3Tex = TT.UI:Texture(nil, panelName .. "Siege3Tex", keepPanel, {32, 32}, {CENTER, TOPLEFT, 160, 35}, siege3Img)
	
	keepPanel.npcLbl = TT.UI:Label(nil, panelName .. "NpcLbl", keepPanel, {25, nil}, {CENTER, TOPLEFT, 76, 54}, TEXT_ALIGN_CENTER, nil)
	keepPanel.siege1Lbl = TT.UI:Label(nil, panelName .. "Siege1Lbl", keepPanel, {25, nil}, {CENTER, TOPLEFT, 104, 54}, TEXT_ALIGN_CENTER, nil)
	keepPanel.siege2Lbl = TT.UI:Label(nil, panelName .. "Siege2Lbl", keepPanel, {25, nil}, {CENTER, TOPLEFT, 132, 54}, TEXT_ALIGN_CENTER, nil)
	keepPanel.siege3Lbl = TT.UI:Label(nil, panelName .. "Siege3Lbl", keepPanel, {25, nil}, {CENTER, TOPLEFT, 160, 54}, TEXT_ALIGN_CENTER, nil)
	
	keepPanel.row1 = TT.UI:Control(nil, panelName .. "Row1", keepPanel, {KEEP_PANEL_WIDTH, 22}, {TOPLEFT, TOPLEFT, 0, 64})
	keepPanel.row2 = TT.UI:Control(nil, panelName .. "Row2", keepPanel, {KEEP_PANEL_WIDTH, 22}, {TOPLEFT, TOPLEFT, 0, 86})
	keepPanel.row3 = TT.UI:Control(nil, panelName .. "Row3", keepPanel, {KEEP_PANEL_WIDTH, 22}, {TOPLEFT, TOPLEFT, 0, 108})
	
	local rows = {keepPanel.row1, keepPanel.row2, keepPanel.row3}
	for i = 1, #rows do
		local row = rows[i]
		row.backdrop = TT.UI:Backdrop(nil, row:GetName() .. "Backdrop", row, {row:GetWidth() - 2, row:GetHeight() + 2}, nil, RESOURCE_CLOSE_BACKDROP_COLOR, RESOURCE_CLOSE_BACKDROP_COLOR)
		row.tex = TT.UI:Texture(nil, row:GetName() .. "Tex", row, {32, 32}, {CENTER, TOPLEFT, 48, 11}, nil)
		row.npcLbl = TT.UI:Label(nil, row:GetName() .. "NpcLbl", row, {25, nil}, {CENTER, TOPLEFT, 76, 11}, TEXT_ALIGN_CENTER, nil)
		row.siege1Lbl = TT.UI:Label(nil, row:GetName() .. "Siege1Lbl", row, {25, nil}, {CENTER, TOPLEFT, 104, 11}, TEXT_ALIGN_CENTER, nil)
		row.siege2Lbl = TT.UI:Label(nil, row:GetName() .. "Siege2Lbl", row, {25, nil}, {CENTER, TOPLEFT, 132, 11}, TEXT_ALIGN_CENTER, nil)
		row.siege3Lbl = TT.UI:Label(nil, row:GetName() .. "Siege3Lbl", row, {25, nil}, {CENTER, TOPLEFT, 160, 11}, TEXT_ALIGN_CENTER, nil)
	end

	return keepPanel
end

function TT.Cyrodiil:GetImage(keepType, keepAlliance, keepIsUnderAttack, resourceType)
	local image
	
	if (keepType == KEEPTYPE_KEEP) then -- Keep
		if (keepAlliance == ALLIANCE_NONE) then
			if (keepIsUnderAttack == false) then
				image = self.Images.KeepNeutral
			else
				image = self.Images.KeepNeutralUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_ALDMERI_DOMINION) then
			if (keepIsUnderAttack == false) then
				image = self.Images.KeepAD
			else
				image = self.Images.KeepADUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
			if (keepIsUnderAttack == false) then
				image = self.Images.KeepDC
			else
				image = self.Images.KeepDCUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_EBONHEART_PACT) then
			if (keepIsUnderAttack == false) then
				image = self.Images.KeepEP
			else
				image = self.Images.KeepEPUnderAttack
			end
		end
	elseif (keepType == KEEPTYPE_ARTIFACT_KEEP) then -- Temple
		if (keepAlliance == ALLIANCE_NONE) then
			if (keepIsUnderAttack == false) then
				image = self.Images.TempleNeutral
			else
				image = self.Images.TempleNeutralUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_ALDMERI_DOMINION) then
			if (keepIsUnderAttack == false) then
				image = self.Images.TempleAD
			else
				image = self.Images.TempleADUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
			if (keepIsUnderAttack == false) then
				image = self.Images.TempleDC
			else
				image = self.Images.TempleDCUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_EBONHEART_PACT) then
			if (keepIsUnderAttack == false) then
				image = self.Images.TempleEP
			else
				image = self.Images.TempleEPUnderAttack
			end
		end
	elseif (keepType == KEEPTYPE_OUTPOST) then
		if (keepAlliance == ALLIANCE_NONE) then
			if (keepIsUnderAttack == false) then
				image = self.Images.OutpostNeutral
			else
				image = self.Images.OutpostNeutralUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_ALDMERI_DOMINION) then
			if (keepIsUnderAttack == false) then
				image = self.Images.OutpostAD
			else
				image = self.Images.OutpostADUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
			if (keepIsUnderAttack == false) then
				image = self.Images.OutpostDC
			else
				image = self.Images.OutpostDCUnderAttack
			end
		elseif (keepAlliance == ALLIANCE_EBONHEART_PACT) then
			if (keepIsUnderAttack == false) then
				image = self.Images.OutpostEP
			else
				image = self.Images.OutpostEPUnderAttack
			end
		end
	elseif (keepType == KEEPTYPE_RESOURCE) then
		if (resourceType == RESOURCETYPE_WOOD) then
			if (keepAlliance == ALLIANCE_NONE) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MillNeutral
				else
					image = self.Images.MillNeutralUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_ALDMERI_DOMINION) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MillAD
				else
					image = self.Images.MillADUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MillDC
				else
					image = self.Images.MillDCUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_EBONHEART_PACT) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MillEP
				else
					image = self.Images.MillEPUnderAttack
				end
			end
		elseif (resourceType == RESOURCETYPE_FOOD) then
			if (keepAlliance == ALLIANCE_NONE) then
				if (keepIsUnderAttack == false) then
					image = self.Images.FarmNeutral
				else
					image = self.Images.FarmNeutralUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_ALDMERI_DOMINION) then
				if (keepIsUnderAttack == false) then
					image = self.Images.FarmAD
				else
					image = self.Images.FarmADUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
				if (keepIsUnderAttack == false) then
					image = self.Images.FarmDC
				else
					image = self.Images.FarmDCUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_EBONHEART_PACT) then
				if (keepIsUnderAttack == false) then
					image = self.Images.FarmEP
				else
					image = self.Images.FarmEPUnderAttack
				end
			end
		elseif (resourceType == RESOURCETYPE_ORE) then
			if (keepAlliance == ALLIANCE_NONE) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MineNeutral
				else
					image = self.Images.MineNeutralUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_ALDMERI_DOMINION) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MineAD
				else
					image = self.Images.MineADUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_DAGGERFALL_COVENANT) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MineDC
				else
					image = self.Images.MineDCUnderAttack
				end
			elseif (keepAlliance == ALLIANCE_EBONHEART_PACT) then
				if (keepIsUnderAttack == false) then
					image = self.Images.MineEP
				else
					image = self.Images.MineEPUnderAttack
				end
			end
		end
	end
	
	return image
end
