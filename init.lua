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

-- Create a list of essential Spoons
if not spoonsToInstall then
  spoonsToInstall = {
    "Caffeine",
    "WinWin",
  }
end

-- Download and install spoons
for _, _spoon in pairs(spoonsToInstall) do
  spoon.SpoonInstall:installSpoonFromRepo(_spoon)
end

-------------------------------
-- Hotkey Modal
-------------------------------
hsMode = hs.hotkey.modal.new(hyper, 'h')

hsMode:bind('', 'escape', function() hsMode:exit() end)

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
