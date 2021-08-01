local update_icons = function(widget, tag)
    if awful.widget.taglist.filter.noempty(tag) then 
        widget.text = ' '
    else
        widget.text = ' '
    end
    if tag.selected then
        widget.text = ' '
    end
end


return function(s)
    local taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        layout   = {
          spacing = beautiful.big_gap,
          layout  = wibox.layout.grid.horizontal
        },
        widget_template = {
            widget = wibox.widget.textbox,
            text = ' ',
            font = 'Roboto Mono NerdFont 9',
            update_callback = update_icons,
            create_callback = update_icons,
        }
    }
    return {
        widget = wibox.container.margin,
        top = 3,
        left = 5,
        taglist
    }
end
