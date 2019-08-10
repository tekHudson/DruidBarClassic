[1;33mdiff --git a/DruidBar.lua b/DruidBar.lua[m
[1;33mindex 0273090..1407649 100644[m
[1;33m--- a/DruidBar.lua[m
[1;33m+++ b/DruidBar.lua[m
[1;35m@@ -5,7 +5,7 @@[m [mfunction DruidBar_OnLoad()[m
 	DruidBarUpdateFrame:RegisterEvent("UNIT_AURA");[m
 	DruidBarUpdateFrame:RegisterEvent("UNIT_MAXPOWER");[m
 	DruidBarUpdateFrame:RegisterEvent("COMBAT_LOG_EVENT");[m
[1;31m-	DruidBarUpdateFrame:RegisterEvent("ADDON_LOADED");[m
[1;32m+[m	[1;32mDruidBarUpdateFrame:RegisterEvent("VARIABLES_LOADED");[m[41m[m
 	DruidBarUpdateFrame:RegisterEvent("UNIT_POWER_UPDATE");[m
 	DruidBarUpdateFrame:RegisterEvent("INSTANCE_BOOT_STOP");[m
 	DruidBarUpdateFrame:RegisterEvent("INSTANCE_BOOT_START");[m
[1;35m@@ -53,7 +53,7 @@[m [mfunction DruidBar_OnEvent(self, event,...)[m
 		return;[m
 	end[m
 [m
[1;31m-	if event == "ADDON_LOADED" then[m
[1;32m+[m	[1;32mif event == "VARIABLES_LOADED" then[m[41m[m
 		Load_Variables(className);[m
 	elseif className and className == "DRUID" and DruidBarKey.Enabled then[m
 		-- Show DruidBarUpdateFrame if hidden[m
[1;33mdiff --git a/Options.lua b/Options.lua[m
[1;33mindex 1655d32..09bbb6e 100644[m
[1;33m--- a/Options.lua[m
[1;33m+++ b/Options.lua[m
[1;35m@@ -13,7 +13,7 @@[m [mend[m
 [m
 function DRUIDBAROptions_CheckWidth(self)[m
 	if ( DRUIDBAROptionsWidthEditBox:GetText() < "1" ) then[m
[1;31m-		DRUIDBAROptionsWidthEditBox:SetText("1");[m
[1;32m+[m		[1;32mDRUIDBAROptionsWidthEditBox:SetText("150");[m[41m[m
 		DruidBarKey.xvar = self:GetNumber();[m
 		DruidBarKey.tempW = DruidBarKey.xvar;[m
 	elseif( DRUIDBAROptionsWidthEditBox:GetText() > "9999" ) then[m
[1;35m@@ -28,7 +28,7 @@[m [mend[m
 [m
 function DRUIDBAROptions_CheckHeight(self)[m
 	if ( DRUIDBAROptionsHeightEditBox:GetText() < "1" ) then[m
[1;31m-		DRUIDBAROptionsHeightEditBox:SetText("1");[m
[1;32m+[m		[1;32mDRUIDBAROptionsHeightEditBox:SetText("18");[m[41m[m
 		DruidBarKey.yvar = self:GetNumber();[m
 		DruidBarKey.tempH = DruidBarKey.yvar;[m
 	elseif( DRUIDBAROptionsHeightEditBox:GetText() > "999" ) then[m
