extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://resources/settings/DefaultSettings.tres")

var window_mode_index : int = 0
var resolution_index : int = 0
var master_volume : float = 0
var music_volume : float = 0
var sfx_volume : float = 0
var subtitles_set: bool = false

var loaded_data : Dictionary = {}

func _ready():
	handle_signal()
	create_storage_dictionary()


func create_storage_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"window_mode_index" : window_mode_index,
		"resolution_index" : resolution_index,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"subtitles_set" : subtitles_set,
	}
	
	return settings_container_dict


func get_window_mode_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index


func get_resolution_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_RESOLUTION_INDEX
	return resolution_index


func get_master_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOLUME
	return master_volume


func get_music_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOLUME
	return music_volume


func get_sfx_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SFX_VOLUME
	return sfx_volume


func get_subtitles_set() -> bool:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_SUBTITLES_SET
	return subtitles_set


func on_window_mode_selected(index : int) -> void:
	window_mode_index = index

func on_resolution_selected(index : int) -> void:
	resolution_index = index

func on_master_sound_set(value : float) -> void:
	master_volume = value

func on_music_sound_set(value : float) -> void:
	music_volume = value

func on_sfx_sound_set(value : float) -> void:
	sfx_volume = value

func on_subtitles_toggled(toggled : bool) -> void:
	subtitles_set = toggled

func on_settings_data_loaded(data : Dictionary) -> void:
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resolution_index)
	on_master_sound_set(loaded_data.master_volume)
	on_music_sound_set(loaded_data.music_volume)
	on_sfx_sound_set(loaded_data.sfx_volume)
	on_subtitles_toggled(loaded_data.subtitles_set)


func handle_signal() -> void:
	SettingsSignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SettingsSignalBus.on_resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_sound_set.connect(on_master_sound_set)
	SettingsSignalBus.on_music_sound_set.connect(on_music_sound_set)
	SettingsSignalBus.on_sfx_sound_set.connect(on_sfx_sound_set)
	SettingsSignalBus.on_subtitles_toggled.connect(on_subtitles_toggled)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
