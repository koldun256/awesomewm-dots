local icon_widget = helpers.widget.icon('墳', -8)

local text_widget = wibox.widget {
    font = beautiful.font,
    widget = wibox.widget.textbox,
    text = "??%"
}

local volume_widget = helpers.widget.parallelogram_right {
    text = text_widget,
    icon = icon_widget,
    color = beautiful.widget_color
}

helpers.common.volume.onChange(function(volume)
	text_widget.markup = string.format("<span color=%q>%s</span>", beautiful.widget_text_color, volume)
end)

local buttons = gears.table.join (
	awful.button({}, 5, helpers.common.volume.dec),
	awful.button({}, 4, helpers.common.volume.inc)
)

icon_widget:buttons(buttons)
text_widget:buttons(buttons)

return volume_widget
