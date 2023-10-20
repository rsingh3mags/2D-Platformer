extends Node

# collecting coins variable
var coins_collected = 0 
var timer = 0

var time: float = 0.0
var minutes: int = 0
var seconds: int =0
var msec: int = 0


# global ready function to make sure it's run by godot.
func _ready():
	print_debug("global ready!")
	print_debug(coins_collected)
	print_debug(timer)

# for the main menu if escape is presed
# on play again pressed
func _input(event):
	if event.is_action_pressed("return_to_main_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
		
# Timer code
func _process(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	
# to reset timer and coins when start is pressed again
func reset_time():
	time = 0.0
	minutes = 0
	seconds = 0
	msec = 0
	coins_collected = 0 
