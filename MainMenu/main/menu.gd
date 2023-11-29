class_name MainMenu
extends CanvasLayer

@onready var start = $Control/MarginContainer/VBoxContainer/Start as Button
@onready var settings = $Control/MarginContainer/VBoxContainer/Settings as Button
@onready var credits = $Control/MarginContainer/VBoxContainer/Credits as Button
@onready var quit = $Control/MarginContainer/VBoxContainer/Quit as Button
@onready var options_menu = $Options_Menu as OptionsMenu
@onready var credits_menu = $Credits_Menu as CreditsMenu
@onready var margin_container = $Control/MarginContainer as MarginContainer

@onready var test = preload("res://Test.tscn") as PackedScene


func _ready():
	handle_connecting_signals()


func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(test)


func _on_settings_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true


func _on_credits_pressed() -> void:
	margin_container.visible = false
	credits_menu.set_process(true)
	credits_menu.visible = true


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_options_menu() -> void:
	margin_container.visible = true
	options_menu.visible = false


func _on_back_credits_menu() -> void:
	margin_container.visible = true
	credits_menu.visible = false


func handle_connecting_signals() -> void:
	start.button_down.connect(_on_start_pressed)
	settings.button_down.connect(_on_settings_pressed)
	credits.button_down.connect(_on_credits_pressed)
	quit.button_down.connect(_on_quit_pressed)
	options_menu.back_options_menu.connect(_on_back_options_menu)
	credits_menu.back_credits_menu.connect(_on_back_credits_menu)
