local mods = require('translations.mods')

--If exit name is just a number, "번" should be appended to it.
local function is_exit_a_number(first_part, exit_value, last_part)
    if (exit_value ~= nil or exit_value ~= "") then
        if (tonumber(exit_value) ~= nil) then
            exit_value = exit_value .. "번"
        end
    end
    return first_part.." "..exit_value.." "..last_part
end

function mods.apply_language_specific_mods(sentence)
    sentence = string.gsub(sentence, "(.+)%s(.+)%s출구로(.+)", is_exit_a_number)
    sentence = string.gsub(sentence, "십시오를 따라", "다가")
    return sentence
end

return mods
