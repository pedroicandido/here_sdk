local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    -- handle dot as "," (e.g.: 'Sau 0.5 dặm' becomes 'Sau 0,5 dặm')
    return string.gsub( sentence, "(Sau%s%d+)%.(%d+%s)", "%1,%2" )
end

function mods.apply_language_specific_mods(sentence)
    -- expand the route number in Vietnamese from QL.## to quốc lộ ##
    return string.gsub( sentence, "(.+)%svào%sQL%.(.+)", "%1 vào quốc lộ %2" )
end

return mods
