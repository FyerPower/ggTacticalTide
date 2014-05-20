TT.UI = {}

----------------------
-- Util
----------------------
function TT.Chain(object)
	local T = {}
	setmetatable(T, {__index = function(self, func)
		if func == "__END" then	return object end

		return function(self, ...)
			assert(object[func], func .. " missing in object")
			object[func](object, ...)
			return self
		end
	end})

	return T
end

----------------------
-- Colors
----------------------
TT.Color = {
	["Default"] = {0.77255, 0.76078, 0.61961, 1},
	["Highlight"] = {0.93725, 0.92156, 0.74509, 1},
	["White"] = {1, 1, 1, 1},
	["Gray"] = {0.5, 0.5, 0.5, 1},
	["Black"] = {0, 0, 0, 1},
	["None"] = {0, 0, 0, 0},
	
	["GameRed"] = {222 / 255, 91 / 255, 78 / 255, 1},
	["GameBlue"] = {105 / 255, 143 / 255, 178 / 255, 1},
	["GameYellow"] = {248 / 255, 245 / 255, 154 / 255, 1},
	["GameGreen"] = {110 / 255, 179 / 255, 105 / 255, 1},
	["GameOrange"] = {1, 0.73725, 0.32549, 1},
	
	["DefaultBackdrop"] = {0, 0, 0, 0.25},
	["DefaultBackdropEdge"] = {0, 0, 0, 0.4},
	
	["ButtonBackdrop"] = {0, 0, 0, 0.25},
	["ButtonBackdropEdge"] = {0, 0, 0, 0.4},
	["ButtonBackdropPressed"] = {0, 0, 0, 0.4},
	["ButtonBackdropEdgePressed"] = {0, 0, 0, 0.55},
	
	["EditBoxBackdrop"] = {0.5, 0.5, 0.5, 0.3},
	["EditBoxBackdropEdge"] = {0, 0, 0, 0.4},
	["EditBoxBackdropFocused"] = {0.5, 0.5, 0.5, 0.5},
	["EditBoxBackdropEdgeFocused"] = {0, 0, 0, 0.55},
	
	["CheckBoxCheck"] = {0.5, 1, 0.5, 0.75},
	["CheckBoxCheckedBackdrop"] = {0.5, 1, 0.5, 0.25},
	["CheckBoxCheckedBackdropEdge"] = {0.5, 1, 0.5, 0.4},
	["CheckBoxUncheckedBackdrop"] = {1, 0.5, 0.5, 0.25},
	["CheckBoxUncheckedBackdropEdge"] = {1, 0.5, 0.5, 0.4},
}

function TT.Color.NormalizeRGB(rgb)
	return {rgb[1] / 255, rgb[2] / 255, rgb[3] / 255}
end

----------------------
-- Fonts
----------------------
TT.Font = {
	["Default"] = "ZoFontGameShadow",
	["Large"] = "ZoFontGameLargeBoldShadow",
	["Input"] = "ZoFontGame"
}

----------------------
-- TopLevelWindow
----------------------
function TT.UI:TopLevelWindow(obj, name, parent, size, anchor, addBackdrop)
	if (parent == nil) then parent = GuiRoot end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end

	local window = TT.Chain(WINDOW_MANAGER:CreateTopLevelWindow(name))
		:SetHidden(false)
		:SetDimensions(size[1], size[2])
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		.__END
	
	if (addBackdrop) then
		window.backdrop = self:Backdrop(nil, name .. "Backdrop", window)
	end
	
	return window
end

----------------------
-- Control
----------------------
function TT.UI:Control(obj, name, parent, size, anchor)
	if (parent == nil) then parent = GuiRoot end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end

	local control = TT.Chain(WINDOW_MANAGER:CreateControl(name, parent, CT_CONTROL))
		:SetHidden(false)
		:SetDimensions(size[1], size[2])
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		.__END
	
	return control
end

----------------------
-- Backdrop
----------------------
function TT.UI:Backdrop(obj, name, parent, size, anchor, centerColor, edgeColor, edgeThickness)
	if (parent == nil) then parent = GuiRoot end
	if (size == nil) then size = {parent:GetWidth(), parent:GetHeight()} end
	if (size[1] == nil) then size[1] = parent:GetWidth() end
	if (size[2] == nil) then size[2] = parent:GetHeight() end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end
	if (centerColor == nil) then centerColor = TT.Color.DefaultBackdrop end
	if (edgeColor == nil) then edgeColor = TT.Color.DefaultBackdropEdge end
	if (edgeThickness == nil) then edgeThickness = 1
	elseif (edgeThickness == 0) then edgeColor = TT.Color.None
	end

	local backdrop = TT.Chain(WINDOW_MANAGER:CreateControl(name, parent, CT_BACKDROP))
		:SetHidden(false)
		:SetDimensions(size[1], size[2])
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		:SetEdgeTexture("", 1, 1, edgeThickness)
		:SetCenterColor(unpack(centerColor))
		:SetEdgeColor(unpack(edgeColor))
		.__END
	
	return backdrop
end

----------------------
-- DropdownList
---------------------- 
function TT.UI:DropdownList(obj, name, parent, size, anchor, data, selected, callback)
	if (parent == nil) then parent = GuiRoot end
	if (size == nil) then size = {150, 24} end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end

    local dropdownList = TT.Chain(WINDOW_MANAGER:CreateControlFromVirtual(name, parent, "ZO_StatsDropdownRow"))
		:SetHidden(false)
		:SetDimensions(size[1], size[2])
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		:SetAlpha(0.6)
		.__END

	dropdownList:GetNamedChild("Dropdown"):SetDimensions(size[1], size[2])
    dropdownList.dropdown:SetFont(TT.Font.Default)
	dropdownList.dropdown:Clear() -- ```
	
    dropdownList.dropdown.OnSelect = function(self, value)
        self:SetSelectedItem(value)
		if (callback) then callback(value) end
    end
 
    for i = 1, #data do
        local entry = dropdownList.dropdown:CreateItemEntry(data[i], dropdownList.dropdown.OnSelect)
        dropdownList.dropdown:AddItem(entry)
    end
	
    dropdownList.dropdown:SetSelectedItem(selected)
	
    return dropdownList
end
 
----------------------
-- Button
---------------------- 
function TT.UI:Button(obj, name, parent, size, anchor, text, hasBackdrop)
	if (parent == nil) then parent = GuiRoot end
	if (size == nil) then size = {75, 22} end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end

	local button = TT.Chain(WINDOW_MANAGER:CreateControl(name, parent, CT_BUTTON))
		:SetHidden(false)
		:SetDimensions(size[1], size[2])
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		:SetFont(TT.Font.Default)
		:SetNormalFontColor(unpack(TT.Color.Default))
		:SetMouseOverFontColor(unpack(TT.Color.Highlight))
		:SetPressedFontColor(unpack(TT.Color.White))
		:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
		:SetVerticalAlignment(TEXT_ALIGN_CENTER)
		:SetText(text)
		.__END
		
	if (hasBackdrop) then
		button.backdrop = self:Backdrop(nil, name .. "Backdrop", button)
	end
	
	button.isDown = false
	button:SetHandler("OnMouseDown",
		function(self)
			if (not self.isDown) then
				local _, a, b, c, x, y = self:GetAnchor()
				self:ClearAnchors()
				self:SetAnchor(a, b, c, x + 1, y + 1)
				
				if (hasBackdrop) then
					local _, a, b, c, x, y = self.backdrop:GetAnchor()
					self.backdrop:ClearAnchors()
					self.backdrop:SetAnchor(a, b, c, x - 1, y - 1)
					self.backdrop:SetCenterColor(unpack(TT.Color.ButtonBackdropPressed))
					self.backdrop:SetEdgeColor(unpack(TT.Color.ButtonBackdropEdgePressed))
				end
			end
			self.isDown = true
		end) 
	button:SetHandler("OnMouseUp",
		function(self)
			if (self.isDown) then
			local _, a, b, c, x, y = self:GetAnchor()
				self:ClearAnchors()
				self:SetAnchor(a, b, c, x - 1, y - 1)
			
				if (hasBackdrop) then
					local _, a, b, c, x, y = self.backdrop:GetAnchor()
					self.backdrop:ClearAnchors()
					self.backdrop:SetAnchor(a, b, c, x + 1, y + 1)
					self.backdrop:SetCenterColor(unpack(TT.Color.ButtonBackdrop))
					self.backdrop:SetEdgeColor(unpack(TT.Color.ButtonBackdropEdge))
				end
			end
			self.isDown = false
		end)

	return button
end

----------------------
-- Label
----------------------
function TT.UI:Label(obj, name, parent, size, anchor, alignment, text)
	if (parent == nil) then parent = GuiRoot end
	if (size == nil) then size = {parent:GetWidth(), 22} end
	if (size[1] == nil) then size[1] = parent:GetWidth() end
	if (size[2] == nil) then size[2] = 22 end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end
	if (alignment == nil) then alignment = TEXT_ALIGN_LEFT end
	
	-- Create the label
	local label = TT.Chain(WINDOW_MANAGER:CreateControl(name, parent, CT_LABEL))
		:SetHidden(false)
		:SetDimensions(size[1], size[2])
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		:SetFont(TT.Font.Default)
		:SetColor(unpack(TT.Color.Default))
		:SetHorizontalAlignment(alignment)
		:SetVerticalAlignment(TEXT_ALIGN_CENTER)
		:SetWrapMode(TEXT_WRAP_MODE_ELLIPSIS)
		:SetText(text)
		.__END
	
	return label
end

----------------------
-- Texture
----------------------
function TT.UI:Texture(obj, name, parent, size, anchor, textureName)
	if (parent == nil) then parent = GuiRoot end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end
	-- if (textureName == nil) then textureName = "esoui/art/icons/icon_missing.dds" end
	
	local texture = TT.Chain(WINDOW_MANAGER:CreateControl(name, parent, CT_TEXTURE))
		:SetHidden(false)
		:SetAnchor(anchor[1], anchor[5], anchor[2], anchor[3], anchor[4])
		:SetTexture(textureName)
		.__END

	if (size == nil) then
		texture:SetDimensions(texture:GetTextureFileDimensions())
	else
		texture:SetDimensions(size[1], size[2])
	end
	
	return texture
end

----------------------
-- CheckBox
----------------------
function TT.UI:CheckBox(obj, name, parent, size, anchor, text, isChecked)
	if (parent == nil) then parent = GuiRoot end
	if (size == nil) then size = {parent:GetWidth(), 22} end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end

	local checkBox = self:Control(nil, name, parent, size, anchor)
	
	checkBox:SetHidden(false)
	
	checkBox.indicator = self:Label(nil, name .. "Indicator", checkBox, {20, 20}, {LEFT, LEFT, 0, 0})
	checkBox.indicator.backdrop = self:Backdrop(nil, name .. "Indicator" .. "Backdrop", indicator)
	checkBox.indicator:SetHorizontalAlignment(TEXT_ALIGN_CENTER)
	checkBox.indicator:SetVerticalAlignment(TEXT_ALIGN_CENTER)
	checkBox.indicator:SetColor(unpack(TT.Color.CheckBoxCheck))
	
	checkBox.checkBtn = self:Button(nil, name .. "Button", checkBox, {size[1], size[2]}, {LEFT, LEFT, 0, 0}, "       " .. text, false)
	checkBox.checkBtn:SetHorizontalAlignment(TEXT_ALIGN_LEFT)
	checkBox.checkBtn.isChecked = isChecked

	local RefreshIndicator = function(indicator, isChecked)
		if (isChecked) then
			indicator:SetText("X")
			indicator.backdrop:SetCenterColor(unpack(TT.Color.CheckBoxCheckedBackdrop))
			indicator.backdrop:SetEdgeColor(unpack(TT.Color.CheckBoxCheckedBackdropEdge))
		else
			indicator:SetText()
			indicator.backdrop:SetCenterColor(unpack(TT.Color.CheckBoxUncheckedBackdrop))
			indicator.backdrop:SetEdgeColor(unpack(TT.Color.CheckBoxUncheckedBackdropEdge))
		end
	end
	
	RefreshIndicator(indicator, isChecked)
	
	checkBox.checkBtn:SetHandler("OnClicked",
		function(self)
			self.isChecked = not self.isChecked
			RefreshIndicator(self.indicator, self.isChecked)
		end)

	return checkBox
end

----------------------
-- EditBox
----------------------
function TT.UI:EditBox(obj, name, parent, size, anchor, text)
	local widthPadding = 10
	local heightPadding = 6

	if (parent == nil) then parent = GuiRoot end
	if (size == nil) then size = {parent:GetWidth(), 22 + heightPadding} end
	if (anchor == nil) then
		anchor = {CENTER, CENTER, 0, 0, parent}
	elseif (#anchor == 4) then
		anchor[5] = parent
	end

	local editBox = self:Control(nil, name, parent, size, anchor)
	
	editBox:SetHidden(false)
	editBox.backdrop = self:Backdrop(nil, name .. "Backdrop", editBox)
	editBox.backdrop:SetCenterColor(unpack(TT.Color.EditBoxBackdrop))
	editBox.backdrop:SetEdgeColor(unpack(TT.Color.EditBoxBackdropEdge))
	
	local color = TT.Color.White
	
	local inputBox = TT.Chain(WINDOW_MANAGER:CreateControl(name .. "InputBox", editBox, CT_EDITBOX))
		:SetMouseEnabled(true)
		:SetDimensions(size[1] - widthPadding, size[2] - heightPadding)
		:SetAnchor(CENTER, editBox, CENTER, 0, 0)
		:SetFont(TT.Font.Input)
		:SetColor(color[1], color[2], color[3], color[4])
		:SetText(text)
		:SetHandler("OnMouseDown", function(self) self:TakeFocus() end) 
		:SetHandler("OnEnter", function(self) self:LoseFocus() end) 
		:SetHandler("OnEscape", function(self) self:LoseFocus() end) 
		.__END
	
	editBox.inputBox = inputBox
	inputBox.editBox = editBox
	
	inputBox:SetHandler("OnFocusGained",
		function(self)
			self.editBox.backdrop:SetCenterColor(unpack(TT.Color.EditBoxBackdropFocused))
			self.editBox.backdrop:SetEdgeColor(unpack(TT.Color.EditBoxBackdropEdgeFocused))
		end) 
	inputBox:SetHandler("OnFocusLost",
		function(self)
			self.editBox.backdrop:SetCenterColor(unpack(TT.Color.EditBoxBackdrop))
			self.editBox.backdrop:SetEdgeColor(unpack(TT.Color.EditBoxBackdropEdge))
		end)
		
	return editBox
end
