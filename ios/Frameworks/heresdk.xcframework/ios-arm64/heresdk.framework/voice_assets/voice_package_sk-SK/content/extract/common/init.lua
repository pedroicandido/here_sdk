local common = {}

common.attributes = require 'content.extract.common.attributes'

function common.extract_common_content(input)
    local message_content = {}
    message_content.trigger = common.attributes.get_trigger(input.trigger)
    message_content.trigger_class = common.attributes.get_trigger_class(input)
    message_content.vp_supported_lang_code = common.attributes.get_vp_supported_lang_code(input);
    message_content.vp_marc_lang_code = common.attributes.get_vp_marc_lang_code(input)
    return message_content
end

return common
