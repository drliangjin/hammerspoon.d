-- spoons.lua - Spoons Installation and Management

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

spoon.SpoonInstall:andUse("KSheet",
               {
                 hotkeys = {
                   toggle = { hyper, "k" }
}})
