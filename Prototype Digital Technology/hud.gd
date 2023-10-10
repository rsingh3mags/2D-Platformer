extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Level: " + str(num)

func coins(num):
	$Coins.text = "Gems: " + str(num)
	
func _process(delta):
	$fps.text = "FPS = " + str(Engine.get_frames_per_second())
