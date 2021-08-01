return require'helpers.providers'.shell {
    timeout = 10,
    command = 'acpi',
    pipe = function(stdout)
        local status, charge_str = string.match(stdout, '.+: (%a+), (%d?%d?%d)%%,?(.*)')
        return {
            charge = tonumber(charge_str),
            is_charging = status == 'Charging'
        }
    end,
    actions = {}
}
