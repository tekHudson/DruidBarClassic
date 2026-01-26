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

local frame = CreateFrame("Frame", "DruidBarFrame", UIParent, "BackdropTemplate")
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")

local bar = CreateFrame("StatusBar", nil, frame)
bar:SetMinMaxValues(0, 1)
bar:SetValue(0)
bar:SetPoint("CENTER", frame, "CENTER", 0, 0)

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

local function UpdateBar()
	db.maxmana = UnitPowerMax("player", 0)
	db.currentmana = UnitPower("player", 0)

	local texture = db.manatexture or defaults.manatexture
	bar:SetStatusBarTexture(texture)

	local c = db.color or defaults.color
	bar:SetStatusBarColor(c[1] or 0, c[2] or 0, c[3] or 1, c[4] or 1)

	bar:SetMinMaxValues(0, db.maxmana or 0)
	bar:SetValue(db.currentmana or 0)

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
	name = "DruidBarClassic",
	args = {
		general = {
			type = "group",
			name = "General",
			inline = true,
			order = 1,
			args = {
				enabled = {
					name = "Enable Addon",
					type = "toggle",
					order = 1,
					get = function() return db.enabled end,
					set = function(_, val) db.enabled = val UpdateBar() end,
				},
				lock = {
					name = "Lock Bar",
					type = "toggle",
					order = 2,
					get = function() return db.lock end,
					set = function(_, val) db.lock = val end,
				},
			},
		},
		display = {
			type = "group",
			name = "Display",
			inline = true,
			order = 2,
			args = {
				graphics = {
					name = "Show Bar",
					type = "toggle",
					order = 1,
					get = function() return db.graphics end,
					set = function(_, val) db.graphics = val UpdateBar() end,
				},
				show_frame = {
					name = "Show Frame",
					type = "toggle",
					order = 2,
					get = function() return db.show_frame end,
					set = function(_, val) db.show_frame = val ApplyFrameStyle() end,
				},
				hide_in_caster = {
					name = "Hide in Caster",
					type = "toggle",
					order = 3,
					get = function() return db.hide_in_caster end,
					set = function(_, val) db.hide_in_caster = val UpdateBar() end,
				},
				hide_when_full = {
					name = "Hide When Full",
					type = "toggle",
					order = 4,
					get = function() return db.hide_when_full end,
					set = function(_, val) db.hide_when_full = val UpdateBar() end,
				},
				color = {
					name = "Bar Color",
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
		size = {
			type = "group",
			name = "Size",
			inline = true,
			order = 3,
			args = {
				width = {
					name = "Width",
					type = "range",
					min = 50, max = 500, step = 1,
					order = 1,
					get = function() return db.width end,
					set = function(_, val) db.width = val ApplySize() ApplyFrameStyle() end,
				},
				height = {
					name = "Height",
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

local function Initialize()
	ApplyDefaults()
	SetupOptions()
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
