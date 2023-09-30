extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Level: " + str(num)


func coins(num):
	$Coins.text = "Coins: " + str(num)
