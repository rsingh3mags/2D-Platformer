extends Node2D
# Level number
@export var level_num = 0

# All the variables needed to make the timer.
@onready var time: float = Global.time

# All the code that is needed for the timer to work
func _process(_delta) -> void:
	$Timer/Minutes.text = "%02d:" % Global.minutes
	$Timer/Seconds.text = "%02d." % Global.seconds
	$Timer/Msecs.text = "%03d" % Global.msec

# code on how the timer is formatted inside of the labels/ HUD
func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [Global.minutes, Global.seconds, Global.msec]
	
# function to stop the code
func _on_stop_timer_body_entered(body):
	if body.name == "Player":
		Global.set_process(false)

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD.level(level_num)
	set_coins_label()
	for coin in $Coins.get_children():
		coin.coin_collected.connect(_on_coin_collected)
	Global.set_process(true)

# when coin is collected
func _on_coin_collected():
	set_coins_label()

# coins collected added to HUD
func set_coins_label():
	$HUD.coins(Global.coins_collected)

# update the level in HUD and change file to the level the player enters.
func _on_door_player_entered(level):
	get_tree().change_scene_to_file(level)
