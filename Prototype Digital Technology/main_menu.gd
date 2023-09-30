extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("MainMenu ready!")


	if !OS.has_feature("pc"):
		$Options/Fullscreen.hide()
		$Options/Quit.hide() 
	
func _process(delta):
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_fullscreen_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN )


func _on_quit_pressed():
	get_tree().quit()
