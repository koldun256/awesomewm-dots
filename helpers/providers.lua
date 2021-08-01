local provider = {}
provider.raw = function(start)
  local listeners = { }

  local provider = start(function(value)
    for _, listener in pairs(listeners) do
      listener(value)
    end
  end)

    provider.onChange = function(callback)
        table.insert(listeners, callback)
    end

  return provider
end

 provider.shell = function(data)
    return provider.raw(function(update)
        local refresh = function()
            awful.spawn.easy_async(data.command, function(stdout)
                update(data.pipe(stdout))
            end)
        end

        gears.timer {
            timeout = data.timeout,
            call_now = true,
            autostart = true,
            callback = refresh
        }

        local actions = {}

        for name, command in pairs(data.actions) do
            actions[name] = function()
                awful.spawn.easy_async_with_shell(command, refresh)
            end
        end

        return actions
    end)
end

return provider
