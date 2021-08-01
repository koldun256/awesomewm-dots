require("awful.autofocus")
local set_signals = function(signals) 
  for signal, callback in pairs(signals) do 
    client.connect_signal(signal, callback)
  end
end

return function(params) 
  beautiful.init(gfs.get_configuration_dir() .. 'config/' .. params.theme .. '-theme.lua')
  awful.layout.layouts = params.layouts
  awful.screen.connect_for_each_screen(function(s) 
    awful.tag(params.tags, s, params.layouts[1])
    params.wallpapers(s)
    params.topbar(s)
  end)
  set_signals(params.signals)
  awful.rules.rules = {{
    rule = {},
    properties = {
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = params.clientkeys,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    }
  }}
  root.keys(params.globalkeys)
  if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
  end

  do
    local in_error = false
    awesome.connect_signal("debug::error", function(err)
      if in_error then return end
      in_error = true

      naughty.notify({
	preset = naughty.config.presets.critical,
	title = "Oops, an error happened!",
	text = tostring(err) 
      })
      in_error = false
    end)
  end
end
