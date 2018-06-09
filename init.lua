-- init.lua -- main hammerspoon initialization file

-- Hyper Key
-- See Karabiner-Elements configuration: hyper is mapped to left control
hyper = { 'shift', 'ctrl', 'alt', 'cmd' }

-------------------------------
-- General Preferences
-------------------------------
-- Launch Hammerspoon when login
hs.autoLaunch(true)

-- Check for Hammerspoon updates
hs.automaticallyCheckForUpdates(false)

-- Show Hammerspoon menu icon
hs.menuIcon(true)

-- Hide Hammerspoon dock icon
hs.dockIcon(false)

-- Keep Console window on top
hs.consoleOnTop(true)

-- Send crash data to Hammerspoon
hs.uploadCrashData(true)

-------------------------------
-- Advanced Settings
-------------------------------
-- 
hs.hotkey.alertDuration = 0
--
hs.hints.showTitleThresh = 0
--
hs.window.animationDuration = 0

-------------------------------
-- Spoons
-------------------------------
-- Core functionality
require("core/spoon-install")

-------------------------------
-- Caffeine
-------------------------------
hs.loadSpoon("Caffeine")
spoon.Caffeine:bindHotkeys({toggle={hyper, "1"}})
spoon.Caffeine:start()
