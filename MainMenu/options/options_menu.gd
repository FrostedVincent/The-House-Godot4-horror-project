class_name OptionsMenu
extends Control 

@onready var back = $MarginContainer/VBoxContainer/Back as Button

signal back_options_menu


func _ready():
	back.button_down.connect(_on_back_pressed)
	set_process(false)


func _on_back_pressed() -> void:
	back_options_menu.emit()
	SettingsSignalBus.emit_set_settings_dictionary(SettingsDataContainer.create_storage_dictionary())
	set_process(false)
