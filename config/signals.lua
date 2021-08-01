local rad = math.rad
local function rounded_rect()
  local r1 = 6
  local r2 = 6
  local r3 = 6
  local r4 = 6
  return function(cr, width, height)
      cr:new_sub_path()
      cr:arc(width - r1, r1, r1, rad(-90), rad(0))
      cr:arc(width - r2, height - r2, r2, rad(0), rad(90))
      cr:arc(r3, height - r3, r3, rad(90), rad(180))
      cr:arc(r4, r4, r4, rad(180), rad(270))
      cr:close_path()
  end
end
local signals = {
  manage = function(c) 
    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
      awful.placement.no_offscreen(c)
    end

    awful.client.swap.byidx(c.screen.selected_tag.master_count)
    --c.shape = rounded_rect()
    end,
  focus = function(c)
    c.border_color = beautiful.aqua
  end,
  unfocus = function(c)
    c.border_color = beautiful.bg0
  end,
}


local function update_borders(s, layout_name)
  local max = layout_name == "max"
  local only_one = #s.tiled_clients == 1 -- use tiled_clients so that other floating windows don't affect the count

  -- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
  for _, c in pairs(s.clients) do
    if (max or only_one) and not c.floating or c.maximized or not c.focusable then
      c.border_width = 0
    else
      c.border_width = beautiful.border_width
    end
  end
end

local function update_borders_by_client(c)
  if c.screen and c.screen.selected_tag then
    update_borders(c.screen, c.screen.selected_tag.layout.name)
  end
end

local function update_borders_by_tag(t)
  if t.screen then
    update_borders(t.screen, t.layout.name)
  end
end

for _, signal in pairs({"%sfloating", "%sfullscreen", "%smaximized_vertical", "%smaximized_horizontal", "%smaximized",
  "%sminimized", "%shidden", "manage", "unmanage"}) do
  client.connect_signal(string.format(signal, "property::"), update_borders_by_client)
end

for _, signal in pairs({"%sselected", "%sactivated", "tagged"}) do
  tag.connect_signal(string.format(signal, "property::"), update_borders_by_tag)
end

signals["property::screen"] = function(c, old_screen)
  update_borders_by_client(c)
  if old_screen and old_screen.selected_tag then
    update_borders(old_screen, old_screen.selected_tag.layout.name)
  end
end
return signals
