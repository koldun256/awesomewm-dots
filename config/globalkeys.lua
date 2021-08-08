local keys = {
    XF86AudioRaiseVolume = helpers.common.volume.inc,
    XF86AudioLowerVolume = helpers.common.volume.dec,
    XF86MonBrightnessUp = helpers.common.brightness.inc,
    XF86MonBrightnessDown = helpers.common.brightness.dec,
    Mod4_s = function() awful.spawn('rofi -show tabi -modi "tabi:tabi"') end,
    Mod4_Left = awful.tag.viewprev,
    Mod4_Right = awful.tag.viewnext,
    Lock_a = function() naughty.notify {text = 'asdfbjk:'} end,
    Mod4_Escape = awful.tag.history.restore,
    Mod4_j = function() awful.client.focus.byidx(1) end,
    Mod4_a = require('config.powermenu'),
    Mod4_k = function() awful.client.focus.byidx(-1) end,
    Mod4_Shift_j = function() awful.client.swap.byidx(1) end,
    Mod4_Shift_k = function() awful.client.swap.byidx(-1) end,
    Mod4_u = awful.client.urgent.jumpto,
    Mod4_Tab = function()
        if client.focus then
            awful.client.focus.history.previous()
            client.focus:raise()
        end
    end,
    Mod4_Return = function() awful.spawn(terminal) end,
    Mod4_Control_r = awesome.restart,
    Mod4_l = function() awful.tag.incmwfact(0.01) end,
    Mod4_h = function() awful.tag.incmwfact(-0.01) end,
    Mod4_Shift_h = function() awful.tag.incnmaster(1, nil, true) end,
    Mod4_Shift_l = function() awful.tag.incnmaster(-1, nil, true) end,
    Mod4_Control_h = function() awful.tag.incncol(1, nil, true) end,
    Mod4_Control_l = function () awful.tag.incncol(-1, nil, true) end,
    Mod4_space = function() awful.layout.inc(1) end,
    Mod4_Shift_space = function() awful.layout.inc(-1) end,
    Mod4_Shift_n = function()
        local c = awful.client.restore()
        if c then
            c:emit_signal(
                'request::activate', 'key.unminimize', {raise = true}
            )
        end
    end,
    Mod4_r = function() awful.spawn('rofi -show drun') end,
    Mod4_w = function() awful.spawn('rofi -show window') end,
    Mod4_f = function() awful.spawn('rofi -show file-browser') end,
    Mod4_p = function() awful.spawn.with_shell('flameshot gui &') end
}

for i = 1, #tags do
    keys['Mod4_'..i] = function()
	    local screen = awful.screen.focused()
	    local tag = screen.tags[i]
	    if tag then
	        tag:view_only()
	    end
    end

    keys['Mod4_Control_'..i] = function()
	    local screen = awful.screen.focused()
	    local tag = screen.tags[i]
	    if tag then
	        awful.tag.viewtoggle(tag)
	    end
    end

    keys['Mod4_Shift_'..i] = function()
        if client.focus then
            local tag = client.focus.screen.tags[i]
            if tag then
                client.focus:move_to_tag(tag)
            end
        end
    end

    keys['Mod4_Control_Shift_'..i] = function()
	    if client.focus then
	        local tag = client.focus.screen.tags[i]
	        if tag then
	            client.focus:toggle_tag(tag)
	        end
	    end
    end
end

return helpers.keys(keys)
