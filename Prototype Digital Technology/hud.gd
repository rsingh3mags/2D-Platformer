extends CanvasLayer 

# show what level the player is on in the HUD
func level(num):
	$CurrentLevel.text = " " + str(num)
	
# show the amount of coins that the PLayer has collected
func coins(num):
	$Coins.text = " " + str(num)

# show fps
func _process(_delta):
	$fps.text = "FPS: " + str(Engine.get_frames_per_second())
