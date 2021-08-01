local dpi = require("beautiful.xresources").apply_dpi

local icon_widget = helpers.widget.icon('', -6)

local level_widget = wibox.widget {
    widget = wibox.widget.textbox
}

local brightness_widget = helpers.widget.parallelogram_right {
    text = level_widget,
    icon = icon_widget,
    color = beautiful.widget_color
}

helpers.common.brightness.onChange(function(brightness)
	level_widget.markup = string.format("<span color=%q>%s</span>", beautiful.widget_text_color, brightness)
end)

return brightness_widget
