extends CanvasLayer

func level(num):
	$CurrentLevel.text = " " + str(num)

func coins(num):
	$Coins.text = " " + str(num)
	
func _process(_delta):
	$fps.text = "FPS: " + str(Engine.get_frames_per_second())
