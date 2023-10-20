extends Node2D

# print MainMenu 
func _ready():
	
	print("MainMenu ready!")

# hide the buttons after the player presses start.
	if !OS.has_feature("pc"):
		$Options/Fullscreen.hide()
		$Options/Quit.hide() 


# When the player presses start level 1 starts playing.
func _on_start_button_pressed():
	Global.reset_time()
	print(Global.time)
	get_tree().change_scene_to_file("res://level_1.tscn")

# Function for fullscreening the game when player presses Fullscreen button.
func _on_fullscreen_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN )

# Quit game when the player presses quit.
func _on_quit_pressed():
	get_tree().quit()


func _on_controls_pressed():
	get_tree().change_scene_to_file("res://instructionscontrols.tscn")
