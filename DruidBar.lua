--[[
DruidBarClassic - 2026 TBC Anniversary Edition (2.5.5)
Standards: Ace3, event-driven UI, zero globals (except SavedVariables)
]]

local addonName = ...
local DB_NAME = "DruidBarKey"

local defaults = {
	enabled = true,
	graphics = true,
	lock = false,
	hide_when_full = false,
	hide_in_caster = false,
	width = 170,
	height = 18,
	show_frame = true,
	show_text = true,
	text_format = "BOTH",
	text_anchor = "CENTER",
	text_offset_x = 0,
	text_offset_y = 0,
	minimap = true,
	minimapPos = 225,
	color = {0, 0, 1, 1},
	manatexture = "Interface\\TargetingFrame\\UI-StatusBar",
	point = "CENTER",
	relativePoint = "CENTER",
	x = 0,
	y = 0,
}

local db
local className

local AceConfig = LibStub("AceConfig-3.0", true)
local AceConfigDialog = LibStub("AceConfigDialog-3.0", true)
local LDB = LibStub("LibDataBroker-1.1", true)
local LDBIcon = LibStub("LibDBIcon-1.0", true)

local frame = CreateFrame("Frame", "DruidBarFrame", UIParent, "BackdropTemplate")
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")

local bar = CreateFrame("StatusBar", nil, frame)
bar:SetMinMaxValues(0, 1)
bar:SetValue(0)
bar:SetPoint("CENTER", frame, "CENTER", 0, 0)
bar.text = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
bar.text:SetPoint("CENTER", bar, "CENTER", 0, 0)

local minimapDataObject

local function OpenOptions()
	if InterfaceOptionsFrame_OpenToCategory then
		InterfaceOptionsFrame_OpenToCategory("DruidBarClassic")
		InterfaceOptionsFrame_OpenToCategory("DruidBarClassic")
		if InterfaceOptionsFrame then
			InterfaceOptionsFrame:Show()
		end
	elseif AceConfigDialog then
		AceConfigDialog:Open("DruidBarClassicConfig")
	end
end

local function ApplyDefaults()
	_G[DB_NAME] = _G[DB_NAME] or {}
	db = _G[DB_NAME]
	for k, v in pairs(defaults) do
		if db[k] == nil then db[k] = v end
	end
end

local function SavePosition()
	local point, _, relativePoint, x, y = frame:GetPoint()
	db.point = point
	db.relativePoint = relativePoint
	db.x = x
	db.y = y
end

local function ApplyPosition()
	frame:ClearAllPoints()
	frame:SetPoint(db.point or "CENTER", UIParent, db.relativePoint or "CENTER", db.x or 0, db.y or 0)
end

local function ApplySize()
	local width = math.max(50, db.width or defaults.width)
	local height = math.max(5, db.height or defaults.height)
	frame:SetSize(width, height)
	bar:SetSize(math.max(1, width - 4), math.max(1, height - 4))
	if UpdateText then UpdateText() end
end

local function EnsureFrameArt()
	if frame._artReady then return end
	frame._artReady = true

	local backdrop = {
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = false,
		tileSize = 8,
		edgeSize = 8,
		insets = { left = 1, right = 1, top = 1, bottom = 1 },
	}

	if frame.SetBackdrop then
		frame._backdrop = backdrop
		frame:SetBackdrop(backdrop)
		-- frame:SetBackdropColor(1, 1, 1, 1)
		return
	end

	-- frame.bg = frame:CreateTexture(nil, "BACKGROUND")
	-- frame.bg:SetAllPoints(frame)
	-- frame.bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock")
end

local function ApplyFrameStyle()
	EnsureFrameArt()
	if db.show_frame then
		if frame.SetBackdrop and frame._backdrop then
			frame:SetBackdrop(frame._backdrop)
		end
		frame:Show()
		if frame.bg then frame.bg:Show() end
	else
		if frame.SetBackdrop then
			frame:SetBackdrop(nil)
		end
		if frame.bg then frame.bg:Hide() end
	end
end

local function ShouldShow()
	if not db.enabled or not db.graphics then return false end
	if className ~= "DRUID" then return false end
	if db.hide_in_caster and (GetShapeshiftForm() or 0) == 0 then return false end
	if db.hide_when_full and db.currentmana and db.maxmana and db.currentmana >= db.maxmana then return false end
	return true
end

local function GetTextAnchor()
	if db.text_anchor == "LEFT" then
		return "LEFT", 4, 0
	end
	if db.text_anchor == "RIGHT" then
		return "RIGHT", -4, 0
	end
	return "CENTER", 0, 0
end

function UpdateText()
	if not bar.text then return end
	if not db.show_text then
		bar.text:SetText("")
		bar.text:Hide()
		return
	end

	local anchor, defaultX, defaultY = GetTextAnchor()
	bar.text:ClearAllPoints()
	bar.text:SetPoint(anchor, bar, anchor, (db.text_offset_x or 0) + defaultX, (db.text_offset_y or 0) + defaultY)

	local current = db.currentmana or 0
	local max = db.maxmana or 0
	local percent = 0
	if max > 0 then
		percent = math.floor((current / max) * 100 + 0.5)
	end

	if db.text_format == "CURRENT" then
		bar.text:SetText(string.format("%d / %d", current, max))
	elseif db.text_format == "PERCENT" then
		bar.text:SetText(string.format("%d%%", percent))
	else
		bar.text:SetText(string.format("%d / %d (%d%%)", current, max, percent))
	end
	bar.text:Show()
end

local function UpdateBar()
	db.maxmana = UnitPowerMax("player", 0)
	db.currentmana = UnitPower("player", 0)

	local texture = db.manatexture or defaults.manatexture
	bar:SetStatusBarTexture(texture)

	local c = db.color or defaults.color
	bar:SetStatusBarColor(c[1] or 0, c[2] or 0, c[3] or 1, c[4] or 1)

	bar:SetMinMaxValues(0, db.maxmana or 0)
	bar:SetValue(db.currentmana or 0)
	UpdateText()

	if ShouldShow() then
		frame:Show()
	else
		frame:Hide()
	end
end

frame:SetScript("OnDragStart", function(self)
	if db and not db.lock then
		self:StartMoving()
	end
end)

frame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	if db then SavePosition() end
end)

local options = {
	type = "group",
	name = DRUIDBAR_L.ADDON_NAME,
	args = {
		general = {
			type = "group",
			name = DRUIDBAR_L.GROUP_GENERAL,
			inline = true,
			order = 1,
			args = {
				enabled = {
					name = DRUIDBAR_L.OPT_ENABLE,
					type = "toggle",
					order = 1,
					get = function() return db.enabled end,
					set = function(_, val) db.enabled = val UpdateBar() end,
				},
				lock = {
					name = DRUIDBAR_L.OPT_LOCK,
					type = "toggle",
					order = 2,
					get = function() return db.lock end,
					set = function(_, val) db.lock = val end,
				},
				minimap = {
					name = DRUIDBAR_L.OPT_MINIMAP,
					type = "toggle",
					order = 3,
					get = function() return db.minimap end,
					set = function(_, val)
						db.minimap = val
						if LDBIcon then
							if val then LDBIcon:Show("DruidBarClassic") else LDBIcon:Hide("DruidBarClassic") end
						end
					end,
				},
			},
		},
		display = {
			type = "group",
			name = DRUIDBAR_L.GROUP_DISPLAY,
			inline = true,
			order = 2,
			args = {
				graphics = {
					name = DRUIDBAR_L.OPT_SHOW_BAR,
					type = "toggle",
					order = 1,
					get = function() return db.graphics end,
					set = function(_, val) db.graphics = val UpdateBar() end,
				},
				show_frame = {
					name = DRUIDBAR_L.OPT_SHOW_FRAME,
					type = "toggle",
					order = 2,
					get = function() return db.show_frame end,
					set = function(_, val) db.show_frame = val ApplyFrameStyle() end,
				},
				hide_in_caster = {
					name = DRUIDBAR_L.OPT_HIDE_IN_CASTER,
					type = "toggle",
					order = 3,
					get = function() return db.hide_in_caster end,
					set = function(_, val) db.hide_in_caster = val UpdateBar() end,
				},
				hide_when_full = {
					name = DRUIDBAR_L.OPT_HIDE_WHEN_FULL,
					type = "toggle",
					order = 4,
					get = function() return db.hide_when_full end,
					set = function(_, val) db.hide_when_full = val UpdateBar() end,
				},
				color = {
					name = DRUIDBAR_L.OPT_BAR_COLOR,
					type = "color",
					hasAlpha = true,
					order = 5,
					get = function()
						local c = db.color or defaults.color
						return c[1], c[2], c[3], c[4]
					end,
					set = function(_, r, g, b, a)
						db.color = {r, g, b, a}
						UpdateBar()
					end,
				},
			},
		},
		text = {
			type = "group",
			name = DRUIDBAR_L.GROUP_TEXT,
			inline = true,
			order = 3,
			args = {
				show_text = {
					name = DRUIDBAR_L.OPT_SHOW_TEXT,
					type = "toggle",
					order = 6,
					get = function() return db.show_text end,
					set = function(_, val) db.show_text = val UpdateText() end,
				},
				text_format = {
					name = DRUIDBAR_L.OPT_TEXT_FORMAT,
					type = "select",
					order = 7,
					values = {
						CURRENT = DRUIDBAR_L.OPT_TEXT_FORMAT_CURRENT,
						PERCENT = DRUIDBAR_L.OPT_TEXT_FORMAT_PERCENT,
						BOTH    = DRUIDBAR_L.OPT_TEXT_FORMAT_BOTH,
					},
					get = function() return db.text_format end,
					set = function(_, val) db.text_format = val UpdateText() end,
				},
				text_anchor = {
					name = DRUIDBAR_L.OPT_TEXT_POSITION,
					type = "select",
					order = 8,
					values = {
						LEFT   = DRUIDBAR_L.OPT_TEXT_LEFT,
						CENTER = DRUIDBAR_L.OPT_TEXT_CENTER,
						RIGHT  = DRUIDBAR_L.OPT_TEXT_RIGHT,
					},
					get = function() return db.text_anchor end,
					set = function(_, val) db.text_anchor = val UpdateText() end,
				},
				text_offset_x = {
					name = DRUIDBAR_L.OPT_TEXT_OFFSET_X,
					type = "range",
					order = 9,
					min = -200, max = 200, step = 1,
					get = function() return db.text_offset_x end,
					set = function(_, val) db.text_offset_x = val UpdateText() end,
				},
				text_offset_y = {
					name = DRUIDBAR_L.OPT_TEXT_OFFSET_Y,
					type = "range",
					order = 10,
					min = -100, max = 100, step = 1,
					get = function() return db.text_offset_y end,
					set = function(_, val) db.text_offset_y = val UpdateText() end,
				},
			},
		},
		size = {
			type = "group",
			name = DRUIDBAR_L.GROUP_SIZE,
			inline = true,
			order = 4,
			args = {
				width = {
					name = DRUIDBAR_L.OPT_WIDTH,
					type = "range",
					min = 50, max = 500, step = 1,
					order = 1,
					get = function() return db.width end,
					set = function(_, val) db.width = val ApplySize() ApplyFrameStyle() end,
				},
				height = {
					name = DRUIDBAR_L.OPT_HEIGHT,
					type = "range",
					min = 5, max = 100, step = 1,
					order = 2,
					get = function() return db.height end,
					set = function(_, val) db.height = val ApplySize() ApplyFrameStyle() end,
				},
			},
		},
	},
}

local function SetupOptions()
	if not (AceConfig and AceConfigDialog) then return end
	AceConfig:RegisterOptionsTable("DruidBarClassicConfig", options, {"dbc", "dbar"})
	AceConfigDialog:AddToBlizOptions("DruidBarClassicConfig", "DruidBarClassic")
end

local function SetupMinimap()
	if not (LDB and LDBIcon) then return end
	local minimapDB = setmetatable({}, {
		__index = function(_, key)
			if key == "hide" then
				return not db.minimap
			end
			if key == "minimapPos" then
				return db.minimapPos
			end
			return nil
		end,
		__newindex = function(_, key, value)
			if key == "hide" then
				db.minimap = not value
				return
			end
			if key == "minimapPos" then
				db.minimapPos = value
				return
			end
			rawset(_, key, value)
		end,
	})

	minimapDataObject = LDB:NewDataObject("DruidBarClassic", {
		type = "data source",
		text = "DruidBarClassic",
		icon = "Interface\\Icons\\Ability_Druid_Maul",
		OnClick = function()
			OpenOptions()
		end,
		OnTooltipShow = function(tooltip)
			tooltip:AddLine(DRUIDBAR_L.MINIMAP_TOOLTIP_TITLE)
			tooltip:AddLine(DRUIDBAR_L.MINIMAP_TOOLTIP_HINT, 1, 1, 1)
		end,
	})
	LDBIcon:Register("DruidBarClassic", minimapDataObject, minimapDB)
	if not db.minimap then
		LDBIcon:Hide("DruidBarClassic")
	end
end

local function Initialize()
	ApplyDefaults()
	SetupOptions()
	SetupMinimap()
	ApplyPosition()
	ApplySize()
	ApplyFrameStyle()
	UpdateBar()
end

frame:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" and ... == addonName then
		Initialize()
		return
	end

	if event == "PLAYER_LOGIN" then
		_, className = UnitClass("player")
		return
	end

	if event == "UNIT_POWER_UPDATE" then
		local unit, powerType = ...
		if unit ~= "player" then return end
		if powerType and powerType ~= "MANA" then return end
	end

	if event == "UNIT_AURA" then
		local unit = ...
		if unit ~= "player" then return end
	end

	if not db or not db.enabled then
		frame:Hide()
		return
	end

	UpdateBar()
end)

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("UNIT_POWER_UPDATE")
frame:RegisterEvent("UPDATE_SHAPESHIFT_FORMS")
frame:RegisterEvent("UNIT_AURA")
