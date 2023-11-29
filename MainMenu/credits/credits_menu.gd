class_name CreditsMenu
extends Control 

@onready var back = $MarginContainer/VBoxContainer/Back as Button

signal back_credits_menu


func _ready():
	back.button_down.connect(_on_back_pressed)
	set_process(false)


func _on_back_pressed() -> void:
	back_credits_menu.emit()
	set_process(false)
