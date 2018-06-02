-- Toggle applications

-- hs.application.enableSpotlightForNameSearches(false)

-- TODO: the following cannot deal with minimised applications

function toggleApplication(name)
    local app = hs.application.find(name)
    if app and app:isFrontmost() then
        app:hide()
    else
        hs.application.launchOrFocus(name) -- twice to unminimise app
    end
end

hs.hotkey.bind(hyper, "return", function() toggleApplication("iTerm") end)
