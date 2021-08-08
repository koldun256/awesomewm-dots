local actions = {
    function() awful.spawn('poweroff') end,
    function() awful.spawn('dm-tool lock') end,
    function() awful.spawn('reboot') end,
    awesome.quit
}

return function()
    local w = wibox {
        bg = beautiful.bg3,
        ontop = true,
        height = 250,
        width = 500,
        -- border_width = 1,
        -- border_color = beautiful.bg1,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 8)
        end,
        visible = false
    }

    local createButton = function(a)
        local selected = false

        local background_widget = wibox.widget {
            widget = wibox.container.background,
            forced_width = 70,
            opacity = 1,
            forced_height = 70,
            shape_border_width = 1,
            shape_border_color = beautiful.bg0,
            shape = function(cr, width, height)
                gears.shape.rounded_rect(cr, width, height, 5)
            end,
            {
                widget = wibox.widget.textbox,
                text = a,
                font = 'RobotoMono Nerd Font 20',
                align = 'center',
            }
        }

        local function update()
            if selected then
                background_widget.bg = beautiful.bg2    
            else
                background_widget.bg = beautiful.bg3    
            end
        end

        return {
            widget = wibox.container.place,
            background_widget,
            select = function() 
                selected = true
                update()
            end,
            deselect = function() 
                selected = false
                update()
            end
        }
    end
    local buttons = {
        createButton(''),
        createButton(''),
        createButton('ﰇ'),
        createButton('')
    }
    w:setup {
        layout = wibox.layout.align.vertical,
        {
            {
                text = 'Goodbye!',
                align = 'center',
                font = 'Roboto Mono NerdFont 20',
                widget = wibox.widget.textbox
            },
            top = 45,
            widget = wibox.container.margin
        },
        {
            layout = wibox.layout.flex.horizontal,
            table.unpack(buttons)
        }
    }

    awful.placement.centered(w)

    local focusedIndex = 1
    local function update()
        for _, button in pairs(buttons) do
            button.deselect()
        end
        buttons[focusedIndex].select()
    end
    update()
    local function next()
        focusedIndex = focusedIndex + 1
        if focusedIndex > #buttons then
            focusedIndex = 1
        end
        update()
    end
    local function prev()
        focusedIndex = focusedIndex - 1
        if focusedIndex < 1 then
            focusedIndex = #buttons
        end
        update()
    end
    local function select()
        actions[focusedIndex]()
    end
    w.visible = true
    local keygrabber = awful.keygrabber {
        keybindings = {
            {{}, 'h', prev},
            {{}, 'l', next},
            {{}, 'Return', select}
        },
        stop_key = 'q',
        export_keybindings = false,
        stop_callback = function() 
            w.visible = false
        end
    }
    keygrabber:start()
end
