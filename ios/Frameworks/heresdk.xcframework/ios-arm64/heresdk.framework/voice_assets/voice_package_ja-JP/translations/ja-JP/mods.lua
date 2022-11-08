local mods = require('translations.mods')

mods.number_to_string = {
    [1] = '一',
    [2] = '二',
    [3] = '三',
    [4] = '四',
    [5] = '五',
    [6] = '六',
    [7] = '七',
    [8] = '八',
    [9] = '九'
}

function mods.convert_numeric_to_string(value)
    if value > 0 and value < 1000 then
        local hundreds = math.floor(value/100)
        local tens = math.floor((value % 100) / 10)
        local unit = math.floor(value % 10)
        local distance_str = ''

        if hundreds > 0 then
            if hundreds > 1 then
                distance_str = distance_str .. mods.number_to_string[hundreds]
            end
            distance_str = distance_str .. '百'
        end

        if tens > 0 then
            if tens > 1 then
                distance_str = distance_str .. mods.number_to_string[tens]
            end
            distance_str = distance_str .. '十'
        end

        if unit > 0 then
            distance_str = distance_str .. mods.number_to_string[unit]
        end

        return distance_str
    else
        return value
    end
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    local distance_str = mods.convert_numeric_to_string(tonumber(distance))

    -- no white space between distance and its unit for Japanese
    return distance_str .. variables[distance_unit]
end

function mods.apply_language_specific_mods(sentence)
    -- Avoid repetitive word of exit in case the direction information contains this word already
    sentence = sentence:gsub("出口出口", "出口")

    return sentence
end

return mods
