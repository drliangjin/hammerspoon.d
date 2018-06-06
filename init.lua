-- init.lua -- main hammerspoon initialization file

-- Hyper Key
-- See Karabiner-Elements configuration
hyper = {'shift', 'ctrl', 'alt', 'cmd'}

-- Core functionality
require("core/spoon-install")

-- Modules
require("modules/windows")
require("modules/toggle-application")
require("modules/switch-browser")
