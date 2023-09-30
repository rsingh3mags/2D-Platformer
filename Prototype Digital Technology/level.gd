extends Node2D
@export var level_num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.level(level_num)
	set_coins_label()
	for coin in $Coins.get_children():
		coin.coin_collected.connect(_on_coin_collected)

func _on_coin_collected():
	set_coins_label()
 
func set_coins_label():
	$HUD.coins(Global.coins_collected)

func _on_door_player_entered(level):
	get_tree().change_scene_to_file(level)


func _on_door_2_player_entered(level):
	get_tree().change_scene_to_file(level)
