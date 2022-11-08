local mods = require('translations.mods')

function mods.apply_language_specific_mods(original_sentence)

    -- for waypoint "it" should be "den", therefore replace "Det" with "Den"
    return string.gsub(original_sentence, "vägpunkten. Det", "vägpunkten. Den")
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    -- handle dot as "," (e.g.: 'After 0.5 miles' becomes 'Efter 0,5 engelska mil')
    distance = string.gsub(distance, '(%d+)%.(%d+)', '%1,%2')
    return distance .. ' ' .. variables[distance_unit]
end

return mods
