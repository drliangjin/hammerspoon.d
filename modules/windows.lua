
-- basic windows sizing
function ohmyhs_sizeWindow(direction)
    return function()
    	local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        if direction == "left" then
            f.x = max.x
            f.y = max.y
            f.w = max.w / 2
            f.h = max.h
        elseif direction == "right" then
            f.x = max.x + (max.w / 2)
            f.y = max.y
            f.w = max.w / 2
            f.h = max.h
        elseif direction == "up" then
            f.x = max.x
            f.y = max.y
            f.w = max.w
            f.h = max.h / 2
        elseif direction == "down" then
            f.x = max.x
            f.y = max.y + (max.h / 2)
            f.w = max.w
            f.h = max.h / 2
	elseif direction == "max" then
            f.x = max.x
            f.y = max.y
            f.w = max.w
            f.h = max.h	
        else
            hs.alert.show("Invalid Input")
	end
        win:setFrame(f)
    end
end

hs.hotkey.bindSpec({hyper, "h"}, ohmyhs_sizeWindow("left"))
hs.hotkey.bindSpec({hyper, "l"}, ohmyhs_sizeWindow("right"))
hs.hotkey.bindSpec({hyper, "k"}, ohmyhs_sizeWindow("up"))
hs.hotkey.bindSpec({hyper, "j"}, ohmyhs_sizeWindow("down"))
hs.hotkey.bindSpec({hyper, "m"}, ohmyhs_sizeWindow("max"))
