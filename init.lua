-- init.lua -- main hammerspoon initialization file

-- Hyper Key
-- See Karabiner-Elements configuration
hyper = {'shift', 'ctrl', 'alt', 'cmd'}

-- Core functionality
require("core/spoons")

-- Modules
require("modules/windows")
require("modules/toggle-application")
require("modules/switch-browser")
