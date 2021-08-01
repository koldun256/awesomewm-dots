local dpi = require("beautiful.xresources").apply_dpi

local text_widget = wibox.widget.textclock(
    helpers.widget.color("%H:%M", beautiful.bg_normal),
    60
)
local icon_widget = helpers.widget.icon('', -6)

local month_calendar = awful.widget.calendar_popup.month {
    long_weekdays = true,
    margin = beautiful.gap
}

text_widget:connect_signal("mouse::enter", function()
    month_calendar:call_calendar(0, "tr", awful.screen.focused())
    month_calendar.visible = true
end)
text_widget:connect_signal("mouse::leave", function()
    month_calendar.visible = false
end)
text_widget:buttons(gears.table.join(
    awful.button({ }, 1, function() month_calendar:call_calendar(-1) end),
    awful.button({ }, 3, function() month_calendar:call_calendar( 1) end)
))
return helpers.widget.rightangled_right {
    icon = icon_widget,
    text = text_widget,
    color = beautiful.widget_color
}
