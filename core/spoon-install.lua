-- spoon-install.lua - Spoons Manager 

-- "SpoonInstall" is downloaded using the tool/install script
-- then other Spoons can be downloaded and loaded using "SpoonInstall"
hs.loadSpoon("SpoonInstall")

-- add official github Spoons repos
spoon.SpoonInstall.repos = {
  default = {
    url = "https://github.com/Hammerspoon/Spoons",
    desc = "Main Hammerspoon Spoon Repository",
  }
}

-- :andUse() will update repos and install packages synchronously
spoon.SpoonInstall.use_syncinstall = true

-- spoon-install.lua ends here
