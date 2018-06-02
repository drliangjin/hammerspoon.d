-- ------------------------------------------------------------------
-- Caffeine Replacement - Keep display awake when caffeine is active.
-- ------------------------------------------------------------------
local caffeine = hs.menubar.new()
 
function setCaffeineDisplay(state)
    if state then
        caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/assets/caffeine-menu/active.png")
    else
        caffeine:setIcon(os.getenv("HOME") .. "/.hammerspoon/assets/caffeine-menu/inactive.png")
    end
end
 
function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end
 
if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end
