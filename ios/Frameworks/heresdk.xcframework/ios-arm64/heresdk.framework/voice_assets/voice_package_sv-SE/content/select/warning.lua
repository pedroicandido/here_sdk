local warning = {}


function warning.select_common_content()
    local content = {}
    content.prompt_class = 'notification'
    return content
end


function warning.select_simple_warning(trigger)
    local content = warning.select_common_content()
    if trigger == 'gps_signal_lost' then content.action = 'gpslost'
    elseif trigger == 'gps_signal_restored' then content.action = 'gpsrestored'
    elseif trigger == 'route_recalculation' then content.action = 'newroute'
    elseif trigger == 'speed_warner' then content.action = 'speedsignal'
    end
    return content
end


function warning.select_safety_camera_warning(message)
    local content = warning.select_common_content()
    if message.above_speed_limit then
        content.action = 'speedcameraspeeding'
    else
        content.action = 'speedcamera'
    end
    return content
end


function warning.select_traffic_ahead_warning(message)
    local content = warning.select_common_content()
    content.automatic_avoidance = message.automatic_avoidance
    return content
end


return warning
