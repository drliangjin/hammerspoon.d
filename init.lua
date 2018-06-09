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
-- SpoonInstall
-------------------------------
-- "SpoonInstall" is downloaded using the tool/install script
hs.loadSpoon("SpoonInstall")

-- Add official github Spoons repos
spoon.SpoonInstall.repos = {
  default = {
    url = "https://github.com/Hammerspoon/Spoons",
    desc = "Main Hammerspoon Spoon Repository",
  }
}

-- Update default Spoons repos
spoon.SpoonInstall:updateRepo()

-- Download and install spoons
spoon.SpoonInstall:installSpoonFromRepo("Caffeine")

-------------------------------
-- Hotkey Modal
-------------------------------
hsMode = hs.hotkey.modal.new(hyper, 'h')

function hsMode:entered()
  hs.alert'Entered Hammerspoon mode' 
end

function hsMode:exited()
  hs.alert'Exited Hammerspoon mode'
end

-------------------------------
-- Caffeine
-------------------------------
hs.loadSpoon("Caffeine")
spoon.Caffeine:bindHotkeys({toggle={hyper, "1"}})
spoon.Caffeine:start()
