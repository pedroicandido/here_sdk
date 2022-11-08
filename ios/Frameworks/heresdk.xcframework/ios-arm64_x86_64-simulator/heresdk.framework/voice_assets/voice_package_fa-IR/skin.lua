_package_settings = {}
main_attribute_array = {}
voice_settings = {}

language = "Farsi"
language_id = "53"
language_loc = "فارسی"
main_attribute_array["LocalizedType"] = "نام خیابان را اعلام کرد"
main_attribute_array["language_code"] = "fa-IR"
main_attribute_array["ngLangCode"] = "fas"
marc_code = "FAS"
speed_camera = "true"
speed_warner = "true"

config_file = "main.lua"
description = "voice package for "..language_loc
feature_list = { "metric", "imperial_uk", "imperial_us" }
id = language_id..marc_code
output_type = "tts"
voice_settings["nguidance"] = "true"
voice_settings["nguidance_junction"] = "true"
voice_settings["nguidance_stop_sign"] = "true"
voice_settings["nguidance_trafficlights"] = "true"
voice_settings["prompt_mode"] = "1"
