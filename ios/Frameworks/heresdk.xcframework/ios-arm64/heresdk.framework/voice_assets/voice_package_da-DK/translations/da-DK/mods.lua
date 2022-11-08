local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    sentence:gsub('%. mål ', '. Målet ')
    return sentence
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    -- handle dot as "," (e.g.: 'After 0.5 miles' becomes 'After 0,5 miles')
    distance = string.gsub(distance, '(%d+)%.(%d+)', '%1,%2')
    return distance .. ' ' .. variables[distance_unit]
end

return mods
