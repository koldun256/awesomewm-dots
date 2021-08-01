local parse_key_name = function(keystroke)
    local elements = {}
    for element in string.gmatch(keystroke, "([^_]+)") do
        table.insert(elements, element)
    end
    local modifiers = table.pack(table.unpack(elements, 1, #elements - 1)) 
    return {
        key = elements[#elements],
        modifiers = table.pack(table.unpack(elements, 1, #elements - 1))
    }
end

local key = function(name, callback)
    local key_data = parse_key_name(name)
    return awful.key(key_data.modifiers, key_data.key, callback)
end

return function(keytable)
    local result = {}

    for keystroke, callback in pairs(keytable) do
        table.insert(result, key(keystroke, callback))
    end

    return gears.table.join(table.unpack(result))
end
