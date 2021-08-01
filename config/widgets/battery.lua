local icons = {
    charging = { '','','','','' },
    uncharging = { '','','','','' },
}

local get_icon = function(status)
    local stages
    if status.is_charging then
        stages = icons.charging
    else
        stages = icons.uncharging
    end
    if (status.charge >= 0 and status.charge < 20) then return stages[1]
    elseif (status.charge >= 20 and status.charge < 40) then return stages[2]
    elseif (status.charge >= 40 and status.charge < 60) then return stages[3]
    elseif (status.charge >= 60 and status.charge < 80) then return stages[4]
    else return stages[5]
    end
end

local icon_widget = helpers.widget.icon('O', -9)
local level_widget = wibox.widget {
    font = beautiful.font,
    widget = wibox.widget.textbox
}

local battery_widget = helpers.widget.parallelogram_right {
    text = level_widget,
    color = beautiful.widget_color,
    icon = icon_widget
}

helpers.common.battery.onChange(function(status)
    local icon = get_icon(status)
    icon_widget:set_icon(icon)
    level_widget.markup = string.format(
        '<span color=%q>%d%%</span>',
        beautiful.widget_text_color,
        status.charge
    )
end)

return battery_widget
