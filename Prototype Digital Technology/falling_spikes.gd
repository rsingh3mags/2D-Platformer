extends Node2D

@export var speed = 160.0
var current_speed = 0

@onready var spawn_pos = global_position



func _physics_process(delta):
	position.y += current_speed * delta


func _on_player_detect_area_entered(area):
	if area.get_parent() is Player:
		fall()


func fall():
	current_speed = speed
	await get_tree().create_timer(3).timeout
	position = spawn_pos
	current_speed = 0
