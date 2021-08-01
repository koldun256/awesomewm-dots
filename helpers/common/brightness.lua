return require'helpers.providers'.shell {
    timeout = 1,
    command = 'xbacklight -get',
    pipe = function(brightness)
        return string.format('%0.f%%',brightness)
    end,
    actions = {
        inc = 'xbacklight -inc 5',
        dec = 'xbacklight -dec 5'
    }
}
