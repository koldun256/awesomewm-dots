local create_taglist = require('config.widgets.taglist')

return function(s)
    local topbar = awful.wibar {
        position = 'top',
        screen = s,
        height = beautiful.wibar_height,
        bg = beautiful.bg3
    }
    topbar:setup {
        layout = wibox.layout.align.horizontal,
        {
            create_taglist(s),
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = beautiful.negative_gap,
            fill_space = true,
            require('config.widgets.volume'),
            require('config.widgets.brightness'),
            require('config.widgets.battery'),
            require('config.widgets.clock')
        }
    }
end
