extends Node2D

# take you back to the main menu after instructions and controls are viewed
func _on_ok_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
