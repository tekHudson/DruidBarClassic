-- DruidBarClassic Localization
-- Default: enUS

DRUIDBAR_L = {
	-- Addon
	ADDON_NAME             = "DruidBarClassic",

	-- Minimap
	MINIMAP_TOOLTIP_TITLE  = "DruidBarClassic",
	MINIMAP_TOOLTIP_HINT   = "Click to open options",

	-- General group
	GROUP_GENERAL          = "General",
	OPT_ENABLE             = "Enable Addon",
	OPT_LOCK               = "Lock Bar",
	OPT_MINIMAP            = "Minimap Icon",

	-- Display group
	GROUP_DISPLAY          = "Display",
	OPT_SHOW_BAR           = "Show Bar",
	OPT_SHOW_FRAME         = "Show Frame",
	OPT_HIDE_IN_CASTER     = "Hide in Caster",
	OPT_HIDE_WHEN_FULL     = "Hide When Full",
	OPT_BAR_COLOR          = "Bar Color",

	-- Text group
	GROUP_TEXT             = "Text",
	OPT_SHOW_TEXT          = "Show Text",
	OPT_TEXT_FORMAT        = "Text Format",
	OPT_TEXT_FORMAT_CURRENT  = "Current / Max",
	OPT_TEXT_FORMAT_PERCENT  = "Percent",
	OPT_TEXT_FORMAT_BOTH     = "Current / Max (Percent)",
	OPT_TEXT_POSITION      = "Text Position",
	OPT_TEXT_LEFT          = "Left",
	OPT_TEXT_CENTER        = "Center",
	OPT_TEXT_RIGHT         = "Right",
	OPT_TEXT_OFFSET_X      = "Text Offset X",
	OPT_TEXT_OFFSET_Y      = "Text Offset Y",

	-- Size group
	GROUP_SIZE             = "Size",
	OPT_WIDTH              = "Width",
	OPT_HEIGHT             = "Height",
}

-- frFR
if GetLocale() == "frFR" then
	DRUIDBAR_L.MINIMAP_TOOLTIP_HINT  = "Cliquez pour ouvrir les options"
	DRUIDBAR_L.GROUP_GENERAL         = "Général"
	DRUIDBAR_L.OPT_ENABLE            = "Activer l'addon"
	DRUIDBAR_L.OPT_LOCK              = "Verrouiller la barre"
	DRUIDBAR_L.OPT_MINIMAP           = "Icône de minicarte"
	DRUIDBAR_L.GROUP_DISPLAY         = "Affichage"
	DRUIDBAR_L.OPT_SHOW_BAR          = "Afficher la barre"
	DRUIDBAR_L.OPT_SHOW_FRAME        = "Afficher le cadre"
	DRUIDBAR_L.OPT_HIDE_IN_CASTER    = "Masquer en forme humaine"
	DRUIDBAR_L.OPT_HIDE_WHEN_FULL    = "Masquer quand plein"
	DRUIDBAR_L.OPT_BAR_COLOR         = "Couleur de la barre"
	DRUIDBAR_L.GROUP_TEXT            = "Texte"
	DRUIDBAR_L.OPT_SHOW_TEXT         = "Afficher le texte"
	DRUIDBAR_L.OPT_TEXT_FORMAT       = "Format du texte"
	DRUIDBAR_L.OPT_TEXT_FORMAT_CURRENT = "Actuel / Max"
	DRUIDBAR_L.OPT_TEXT_FORMAT_PERCENT = "Pourcentage"
	DRUIDBAR_L.OPT_TEXT_FORMAT_BOTH  = "Actuel / Max (Pourcentage)"
	DRUIDBAR_L.OPT_TEXT_POSITION     = "Position du texte"
	DRUIDBAR_L.OPT_TEXT_LEFT         = "Gauche"
	DRUIDBAR_L.OPT_TEXT_CENTER       = "Centre"
	DRUIDBAR_L.OPT_TEXT_RIGHT        = "Droite"
	DRUIDBAR_L.OPT_TEXT_OFFSET_X     = "Décalage X"
	DRUIDBAR_L.OPT_TEXT_OFFSET_Y     = "Décalage Y"
	DRUIDBAR_L.GROUP_SIZE            = "Taille"
	DRUIDBAR_L.OPT_WIDTH             = "Largeur"
	DRUIDBAR_L.OPT_HEIGHT            = "Hauteur"

-- deDE
elseif GetLocale() == "deDE" then
	DRUIDBAR_L.MINIMAP_TOOLTIP_HINT  = "Klicken um Optionen zu öffnen"
	DRUIDBAR_L.GROUP_GENERAL         = "Allgemein"
	DRUIDBAR_L.OPT_ENABLE            = "Addon aktivieren"
	DRUIDBAR_L.OPT_LOCK              = "Leiste sperren"
	DRUIDBAR_L.OPT_MINIMAP           = "Minimap-Symbol"
	DRUIDBAR_L.GROUP_DISPLAY         = "Anzeige"
	DRUIDBAR_L.OPT_SHOW_BAR          = "Leiste anzeigen"
	DRUIDBAR_L.OPT_SHOW_FRAME        = "Rahmen anzeigen"
	DRUIDBAR_L.OPT_HIDE_IN_CASTER    = "In Zauberform verstecken"
	DRUIDBAR_L.OPT_HIDE_WHEN_FULL    = "Bei vollem Mana verstecken"
	DRUIDBAR_L.OPT_BAR_COLOR         = "Leistenfarbe"
	DRUIDBAR_L.GROUP_TEXT            = "Text"
	DRUIDBAR_L.OPT_SHOW_TEXT         = "Text anzeigen"
	DRUIDBAR_L.OPT_TEXT_FORMAT       = "Textformat"
	DRUIDBAR_L.OPT_TEXT_FORMAT_CURRENT = "Aktuell / Max"
	DRUIDBAR_L.OPT_TEXT_FORMAT_PERCENT = "Prozent"
	DRUIDBAR_L.OPT_TEXT_FORMAT_BOTH  = "Aktuell / Max (Prozent)"
	DRUIDBAR_L.OPT_TEXT_POSITION     = "Textposition"
	DRUIDBAR_L.OPT_TEXT_LEFT         = "Links"
	DRUIDBAR_L.OPT_TEXT_CENTER       = "Mitte"
	DRUIDBAR_L.OPT_TEXT_RIGHT        = "Rechts"
	DRUIDBAR_L.OPT_TEXT_OFFSET_X     = "Versatz X"
	DRUIDBAR_L.OPT_TEXT_OFFSET_Y     = "Versatz Y"
	DRUIDBAR_L.GROUP_SIZE            = "Größe"
	DRUIDBAR_L.OPT_WIDTH             = "Breite"
	DRUIDBAR_L.OPT_HEIGHT            = "Höhe"

-- zhTW
elseif GetLocale() == "zhTW" then
	DRUIDBAR_L.MINIMAP_TOOLTIP_HINT  = "點擊開啟設定"
	DRUIDBAR_L.GROUP_GENERAL         = "一般"
	DRUIDBAR_L.OPT_ENABLE            = "啟用插件"
	DRUIDBAR_L.OPT_LOCK              = "鎖定狀態條"
	DRUIDBAR_L.OPT_MINIMAP           = "小地圖圖示"
	DRUIDBAR_L.GROUP_DISPLAY         = "顯示"
	DRUIDBAR_L.OPT_SHOW_BAR          = "顯示狀態條"
	DRUIDBAR_L.OPT_SHOW_FRAME        = "顯示框架"
	DRUIDBAR_L.OPT_HIDE_IN_CASTER    = "人型時隱藏"
	DRUIDBAR_L.OPT_HIDE_WHEN_FULL    = "法力全滿時隱藏"
	DRUIDBAR_L.OPT_BAR_COLOR         = "狀態條顏色"
	DRUIDBAR_L.GROUP_TEXT            = "文字"
	DRUIDBAR_L.OPT_SHOW_TEXT         = "顯示文字"
	DRUIDBAR_L.OPT_TEXT_FORMAT       = "文字格式"
	DRUIDBAR_L.OPT_TEXT_FORMAT_CURRENT = "目前 / 最大"
	DRUIDBAR_L.OPT_TEXT_FORMAT_PERCENT = "百分比"
	DRUIDBAR_L.OPT_TEXT_FORMAT_BOTH  = "目前 / 最大 (百分比)"
	DRUIDBAR_L.OPT_TEXT_POSITION     = "文字位置"
	DRUIDBAR_L.OPT_TEXT_LEFT         = "左"
	DRUIDBAR_L.OPT_TEXT_CENTER       = "中"
	DRUIDBAR_L.OPT_TEXT_RIGHT        = "右"
	DRUIDBAR_L.OPT_TEXT_OFFSET_X     = "X 偏移"
	DRUIDBAR_L.OPT_TEXT_OFFSET_Y     = "Y 偏移"
	DRUIDBAR_L.GROUP_SIZE            = "大小"
	DRUIDBAR_L.OPT_WIDTH             = "寬度"
	DRUIDBAR_L.OPT_HEIGHT            = "高度"

-- zhCN
elseif GetLocale() == "zhCN" then
	DRUIDBAR_L.MINIMAP_TOOLTIP_HINT  = "点击打开设置"
	DRUIDBAR_L.GROUP_GENERAL         = "常规"
	DRUIDBAR_L.OPT_ENABLE            = "启用插件"
	DRUIDBAR_L.OPT_LOCK              = "锁定状态条"
	DRUIDBAR_L.OPT_MINIMAP           = "小地图图标"
	DRUIDBAR_L.GROUP_DISPLAY         = "显示"
	DRUIDBAR_L.OPT_SHOW_BAR          = "显示状态条"
	DRUIDBAR_L.OPT_SHOW_FRAME        = "显示框架"
	DRUIDBAR_L.OPT_HIDE_IN_CASTER    = "施法形态下隐藏"
	DRUIDBAR_L.OPT_HIDE_WHEN_FULL    = "法力值满时隐藏"
	DRUIDBAR_L.OPT_BAR_COLOR         = "状态条颜色"
	DRUIDBAR_L.GROUP_TEXT            = "文字"
	DRUIDBAR_L.OPT_SHOW_TEXT         = "显示文字"
	DRUIDBAR_L.OPT_TEXT_FORMAT       = "文字格式"
	DRUIDBAR_L.OPT_TEXT_FORMAT_CURRENT = "当前 / 最大"
	DRUIDBAR_L.OPT_TEXT_FORMAT_PERCENT = "百分比"
	DRUIDBAR_L.OPT_TEXT_FORMAT_BOTH  = "当前 / 最大 (百分比)"
	DRUIDBAR_L.OPT_TEXT_POSITION     = "文字位置"
	DRUIDBAR_L.OPT_TEXT_LEFT         = "左"
	DRUIDBAR_L.OPT_TEXT_CENTER       = "中"
	DRUIDBAR_L.OPT_TEXT_RIGHT        = "右"
	DRUIDBAR_L.OPT_TEXT_OFFSET_X     = "X 偏移"
	DRUIDBAR_L.OPT_TEXT_OFFSET_Y     = "Y 偏移"
	DRUIDBAR_L.GROUP_SIZE            = "大小"
	DRUIDBAR_L.OPT_WIDTH             = "宽度"
	DRUIDBAR_L.OPT_HEIGHT            = "高度"

-- koKR
elseif GetLocale() == "koKR" then
	DRUIDBAR_L.MINIMAP_TOOLTIP_HINT  = "클릭하여 옵션 열기"
	DRUIDBAR_L.GROUP_GENERAL         = "일반"
	DRUIDBAR_L.OPT_ENABLE            = "애드온 활성화"
	DRUIDBAR_L.OPT_LOCK              = "바 잠금"
	DRUIDBAR_L.OPT_MINIMAP           = "미니맵 아이콘"
	DRUIDBAR_L.GROUP_DISPLAY         = "표시"
	DRUIDBAR_L.OPT_SHOW_BAR          = "바 표시"
	DRUIDBAR_L.OPT_SHOW_FRAME        = "프레임 표시"
	DRUIDBAR_L.OPT_HIDE_IN_CASTER    = "시전 형태에서 숨기기"
	DRUIDBAR_L.OPT_HIDE_WHEN_FULL    = "마나 가득 찰 때 숨기기"
	DRUIDBAR_L.OPT_BAR_COLOR         = "바 색상"
	DRUIDBAR_L.GROUP_TEXT            = "텍스트"
	DRUIDBAR_L.OPT_SHOW_TEXT         = "텍스트 표시"
	DRUIDBAR_L.OPT_TEXT_FORMAT       = "텍스트 형식"
	DRUIDBAR_L.OPT_TEXT_FORMAT_CURRENT = "현재 / 최대"
	DRUIDBAR_L.OPT_TEXT_FORMAT_PERCENT = "퍼센트"
	DRUIDBAR_L.OPT_TEXT_FORMAT_BOTH  = "현재 / 최대 (퍼센트)"
	DRUIDBAR_L.OPT_TEXT_POSITION     = "텍스트 위치"
	DRUIDBAR_L.OPT_TEXT_LEFT         = "왼쪽"
	DRUIDBAR_L.OPT_TEXT_CENTER       = "가운데"
	DRUIDBAR_L.OPT_TEXT_RIGHT        = "오른쪽"
	DRUIDBAR_L.OPT_TEXT_OFFSET_X     = "X 오프셋"
	DRUIDBAR_L.OPT_TEXT_OFFSET_Y     = "Y 오프셋"
	DRUIDBAR_L.GROUP_SIZE            = "크기"
	DRUIDBAR_L.OPT_WIDTH             = "너비"
	DRUIDBAR_L.OPT_HEIGHT            = "높이"
end
