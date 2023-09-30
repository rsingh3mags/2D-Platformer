extends Node2D
@export var level_num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print( "level " + str(level_num) +" ready!")
	
	for coin in $Coins.get_children():
		coin.coin_collected.connect(_on_coin_coin_collected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event.is_action_pressed("return_to_main_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_door_body_entered(body):
	if body == $Player:
		get_tree().change_scene_to_file("res://level_2.tscn")


func _on_coin_coin_collected():
	$HUD/Coins.text ="Coins: " + str(Global.coins_collected)
