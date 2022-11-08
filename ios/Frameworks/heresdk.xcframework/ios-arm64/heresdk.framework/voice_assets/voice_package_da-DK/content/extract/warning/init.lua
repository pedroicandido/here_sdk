local common = require 'content.extract.common.init'
local attributes = require 'content.extract.warning.attributes'

local warning = {}

warning.attributes = attributes


function warning.extract_simple_warning(input)
    local message_content = common.extract_common_content(input)
    message_content.use_speed_warner = input.speed_warner
    return message_content
end


function warning.extract_safety_camera_warning(input)
    local message_content = common.extract_common_content(input)
    message_content.above_speed_limit = input.above_speed_limit
    message_content.use_speed_camera = input.speed_camera
    return message_content
end


function warning.extract_traffic_ahead_warning(input)
    local message_content = common.extract_common_content(input)
    message_content.automatic_avoidance = attributes.is_automatic_avoidance_on(input.avoidance_mode)
    return message_content
end


return warning
