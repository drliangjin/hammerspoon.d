-- Launch/Hide applications

function toggleApplication(name)
    local app = hs.application.find(name)
    if not app or app:isHidden() then
        hs.application.launchOrFocus(name)
    elseif hs.application.frontmostApplication() ~= app then
        app:activate()
    else
        app:hide()
    end
end

hs.hotkey.bindSpec({hyper, "return"}, toggleApplication("iTerm"))
hs.hotkey.bindSpec({hyper, "b"}, toggleApplication("Google Chrome"))
