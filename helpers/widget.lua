local shapes = require('helpers.shapes')

local widget = {}

function widget.compose(args)
  local widgets = {
    spacing = beautiful.big_negative_gap,
    layout = wibox.layout.fixed.horizontal
  }

  for _, w in ipairs(args) do
    table.insert(widgets, {
        {
            w,
            top = w.margin or nil,
            bottom = w.margin or nil,
            left = w.shape == shapes.rightangled.left and beautiful.gap or beautiful.big_gap,
            right = w.shape == shapes.rightangled.right and beautiful.gap or beautiful.big_gap,
            widget = wibox.container.margin
        },
        shape = w.shape,
        bg = w.color,
        widget = wibox.container.background
    })
  end

  return #widgets == 1 and widgets[1] or widgets
end

function widget.color(text, color)
    local color = beautiful.fg0
	return string.format("<span color=%q>%s</span>", color, text)
end

function widget.rightangled_right(args)
	return wibox.widget {
        wibox.widget {
            wibox.widget {
                args.text,
                right = beautiful.big_gap,
                left = beautiful.big_gap,
                widget = wibox.container.margin
            },
            bg = beautiful.bg4,
            shape = shapes.parallelogram.right,
            shape_border_width = 2,
            shape_border_color = beautiful.bg0,
            widget = wibox.container.background
        },
        wibox.widget {
            wibox.widget {
                args.icon,
                left = beautiful.big_gap,
                right = beautiful.gap,
                widget = wibox.container.margin
            },
            bg = beautiful.bg0,
            shape = shapes.rightangled.right,
            widget = wibox.container.background
        },
        spacing = beautiful.big_negative_gap,
        layout = wibox.layout.fixed.horizontal
    }
end

function widget.parallelogram_right(args)
	return wibox.widget {
        wibox.widget {
            wibox.widget {
                args.text,
                right = beautiful.big_gap,
                left = beautiful.big_gap,
                widget = wibox.container.margin
            },
            bg = beautiful.bg4,
            shape = shapes.parallelogram.right,
            shape_border_width = 2,
            shape_border_color = beautiful.bg0,
            widget = wibox.container.background
        },
        wibox.widget {
            wibox.widget {
                args.icon,
                left = beautiful.big_gap,
                right = beautiful.big_gap,
                widget = wibox.container.margin
            },
            bg = beautiful.bg0,
            shape = shapes.parallelogram.right,
            widget = wibox.container.background
        },
        spacing = beautiful.big_negative_gap,
        layout = wibox.layout.fixed.horizontal
    }
end

function widget.icon(icon, offset)
    local icon_widget = wibox.widget {
        widget = wibox.widget.textbox,
        font = beautiful.font
    }

    local result = wibox.widget {
        icon_widget,
        widget = wibox.container.margin,
        right = offset
    }


    function result:set_icon(new_icon)
        icon_widget.markup = widget.color(new_icon .. ' ', beautiful.fg0)
    end

    result:set_icon(icon)

    return result
end

return widget
