local TT = TT

function TT.InitSettings()
  local LAM = LibStub("LibAddonMenu-1.0")
  local panelName = TT.name .. "SettingsPanel"
  local panelId = LAM:CreateControlPanel(panelName, TT.name)
  
  -- Components
  local headerName = panelName .. "ComponentsHeader"
  LAM:AddHeader(panelId, headerName, "Components")
  LAM:AddCheckbox(panelId, headerName .. "CyrodiilFrameCB", "Cyrodiil Frame", "Enable Cyrodiil frame?",
    function()
      return TT.savedVars.cyrodiilFrameEnabled
    end,
    function(isChecked)
      TT.savedVars.cyrodiilFrameEnabled = isChecked
      TT.Cyrodiil:SetEnabled(isChecked)
    end)
    
  -- Cyrodiil frame
  headerName = panelName .. "CyrodiilFrameHeader"
  LAM:AddHeader(panelId, headerName, "Cyrodiil Frame")
  LAM:AddCheckbox(panelId, headerName .. "LockCB", "Lock", "Lock Cyrodiil frame?",
    function()
      return TT.savedVars.cyrodiilFrameLocked
    end,
    function(isChecked)
      TT.savedVars.cyrodiilFrameLocked = isChecked
      TT.Cyrodiil:SetLocked(isChecked)
    end)
  LAM:AddSlider(panelId, headerName .. "MaxColumnsSlider", "Max Columns", "Maximum number of columns to display", 1, 10, 1,
    function()
      return TT.savedVars.cyrodiilFrameMaxColumns
    end,
    function(value)
      TT.savedVars.cyrodiilFrameMaxColumns = value
      TT.Cyrodiil:SetMaxColumns(value)
    end)
  LAM:AddSlider(panelId, headerName .. "MaxHeightSlider", "Max Height", "Maximum height of frame", 135, 2000, 10,
    function()
      return TT.savedVars.cyrodiilFrameMaxHeight
    end,
    function(value)
      TT.savedVars.cyrodiilFrameMaxHeight = value
      TT.Cyrodiil:SetMaxHeight(value)
    end)
  LAM:AddDropdown(panelId, headerName .. "LeftToRightDropdown", "Order", nil, {"Left To Right", "Right To Left"},
    function()
      return TT.savedVars.cyrodiilFrameLeftToRight and "Left To Right" or "Right To Left"
    end,
    function(value)
      local isLeftToRight = value == "Left To Right"
      TT.savedVars.cyrodiilFrameLeftToRight = isLeftToRight
      TT.Cyrodiil:SetLeftToRight(isLeftToRight)
    end)
    
  -- Restore
  headerName = panelName .. "RestoreHeader"
  LAM:AddHeader(panelId, headerName, "Restore Settings")
  LAM:AddButton(panelId, headerName .. "RestoreBtn", "Restore Defaults", nil,
    function()
      for k, v in pairs(TT.defaultSettings) do
        TT.savedVars[k] = v
      end
      ReloadUI("ingame")
    end,
    true, "Reloads UI")
end