return require'helpers.providers'.shell {
    timeout = 1,
    command = 'getaudio',
    pipe = function(volume) return volume end,
    actions = {
        inc = 'amixer -D pulse sset Master 5%+',
        dec = 'amixer -D pulse sset Master 5%-'
    }
}
