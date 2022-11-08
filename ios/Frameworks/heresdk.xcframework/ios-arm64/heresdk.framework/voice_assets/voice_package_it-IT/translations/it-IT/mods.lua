local mods = require('translations.mods')

function mods.get_distance_phrase(distance, distance_unit, variables)
    -- handle dot as "," (e.g.: 'After 0.5 miles' becomes 'Tra 0,5 miglia')
    distance = string.gsub(distance, '(%d+)%.(%d+)', '%1,%2')
    return distance .. ' ' .. variables[distance_unit]
end

return mods
