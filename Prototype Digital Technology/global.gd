extends Node

# collecting coins variable
var coins_collected = 0 

# global ready function to make sure it's run by godot.
func _ready():
	print_debug("global ready!")
	print_debug(coins_collected)
	
# for the main menu if escape is presed
func _input(event):
	if event.is_action_pressed("return_to_main_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
