extends Node

const SETTINGS_SAVE_PATH : String = "user://SettingsData.save"

var settings_data_dict : Dictionary = {}

func _ready():
	SettingsSignalBus.set_settings_dictionary.connect(on_settings_save)


func on_settings_save(data : Dictionary) -> void:
	var save_settings_data_file = FileAccess.open_encrypted_with_pass(SETTINGS_SAVE_PATH, FileAccess.WRITE, "G7$2fP!s9*")
	
	var json_data_string = JSON.stringify(data)
	
	save_settings_data_file.store_line(json_data_string)