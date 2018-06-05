-- spoons.lua - Spoons Installation and Management

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.repos = {
  default = {
    url = "https://github.com/Hammerspoon/Spoons",
    desc = "Main Hammerspoon Spoon Repository",
  }
}

-- :andUse() will update repos and install packages synchronously
spoon.SpoonInstall.use_syncinstall = true
