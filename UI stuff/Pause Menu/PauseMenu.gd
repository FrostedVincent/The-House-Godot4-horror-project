extends Control

@onready var main = $"res://Test.tscn"

func _on_resume_game_pressed():
	main.pauseMenu()


func _on_return_to_main_menu_pressed():
	get_tree().quit()

