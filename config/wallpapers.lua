return function(s)
    local img = cairo.ImageSurface(cairo.Format.RGB24, 1900, 1060)
    local cr = cairo.Context(img)
    math.randomseed(os.time())
    cr:set_source(gears.color(beautiful.bg3))
    cr:paint()
    local colors = {
        beautiful.red,
        beautiful.orange,
        beautiful.yellow,
        beautiful.green,
        beautiful.aqua,
        beautiful.blue,
        beautiful.purple
    }
    local draw_rect = function(coords)
        local color = colors[math.random(#colors)]
        cr:set_source(gears.color(color))
        cr:rectangle(coords[1],coords[2],30,30)
        cr:fill()
    end
    for i = 0, 21 do
        for j = 0, 10 do
            draw_rect({i * 100,j * 100})
        end
    end
    gears.wallpaper.tiled(img, s, {x=40, y=40})
end
