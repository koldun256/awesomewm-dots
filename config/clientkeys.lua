return helpers.keys {
    Mod4_f = function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end,
    Mod4_Shift_c = function(c) c:kill() end,
    Mod4_Control_space = awful.client.floating.toggle,
    Mod4_Control_Return = function(c) c:swap(awful.client.getmaster()) end,
    Mod4_o = function(c) c:move_to_screen() end,
    Mod4_t = function(c) c.ontop = not c.ontop end,
    Mod4_n = function(c) c.minimized = true end,
    Mod4_m = function(c)
        c.maximized = not c.maximized
        c:raise()
    end,
    Mod4_Control_m = function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
    end,
    Mod4_Shift_m = function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
    end,
	Mod4_Control_j = function(c) awful.client.incwfact(0.01) end,
	Mod4_Control_k = function(c) awful.client.incwfact(-0.01) end,
}
