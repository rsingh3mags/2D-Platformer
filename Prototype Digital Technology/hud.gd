extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Level: " + str(num)

func coins(num):
	$Coins.text = "Coins: " + str(num)
	
	
func _process(delta):
	$fps.text = "fps = " + str(Engine.get_frames_per_second())
