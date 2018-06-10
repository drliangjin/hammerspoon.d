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
if not spoons_list then
  spoons_list = {
    "Caffeine",
    "WinWin",
    "KSheet"
  }
end

-- Install and load spoons
for _, _spoon in pairs(spoons_list) do
  if not hs.spoons.isInstalled(_spoon) then
    spoon.SpoonInstall:installSpoonFromRepo(_spoon)
  end
  hs.loadSpoon(_spoon)
end

-------------------------------
-- Hotkey Modal
-------------------------------

-------------------------------
-- Caffeine
-------------------------------
if spoon.Caffeine then
  spoon.Caffeine:bindHotkeys({toggle={hyper, "1"}})
  spoon.Caffeine:start()
end

-------------------------------
-- KSheet
-------------------------------
if spoon.KSheet then
	local csMode = hs.hotkey.modal.new(hyper, "s")
  function csMode:entered() spoon.KSheet:show() end
	csMode:bind("", "escape", function ()
		spoon.KSheet:hide()
		csMode:exit()
	end)
end

-------------------------------
-- WinWin
-------------------------------
if spoon.WinWin then
  local winMode = hs.hotkey.modal.new(hyper, "w")
  function winMode:entered() hs.alert'Entered WinWin' end
  function winMode:exited() hs.alert'Exited WinWin' end
  winMode:bind('', 'escape', function() winMode:exit() end)
  winMode:bind('', 'h', 'Move Leftward', function() spoon.WinWin:stepResize("left") end, nil, function() spoon.WinWin:stepResize("left") end)
  winMode:bind('', 'l', 'Move Rightward', function() spoon.WinWin:stepResize("right") end, nil, function() spoon.WinWin:stepResize("right") end)
  winMode:bind('', 'k', 'Move Upward', function() spoon.WinWin:stepResize("up") end, nil, function() spoon.WinWin:stepResize("up") end)
  winMode:bind('', 'j', 'Move Downward', function() spoon.WinWin:stepResize("down") end, nil, function() spoon.WinWin:stepResize("down") end)
  winMode:bind('shift', 'h', 'Lefthalf of Screen', function() spoon.WinWin:moveAndResize("halfleft") end)
  winMode:bind('shift', 'l', 'Righthalf of Screen', function() spoon.WinWin:moveAndResize("halfright") end)
  winMode:bind('shift', 'k', 'Uphalf of Screen', function() spoon.WinWin:moveAndResize("halfup") end)
  winMode:bind('shift', 'j', 'Downhalf of Screen', function() spoon.WinWin:moveAndResize("halfdown") end)
  winMode:bind('shift', 'f', 'Fullscreen', function() spoon.WinWin:moveAndResize("fullscreen") end)
  winMode:bind('shift', 'c', 'Center Window', function() spoon.WinWin:moveAndResize("center") end)
  winMode:bind('', '=', 'Stretch Outward', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
  winMode:bind('', '-', 'Shrink Inward', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)
end
