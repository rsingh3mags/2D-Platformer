extends Node2D
# Spikes speed
@export var speed = 160.0
# Spikes idle speed
var current_speed = 0
# Spikes Spawn position
@onready var spawn_pos = global_position


# Movement of the spikes.
func _physics_process(delta):
	position.y += current_speed * delta

# player dection system and the animation when it detects the player.
func _on_player_detect_area_entered(area):
	if area.get_parent() is Player:
		$AnimatableBody2D/AnimationPlayer.play("Shake")
		await get_tree().create_timer(1).timeout
		fall()

# Falling function of the spikes.
func fall():
	current_speed = speed
	await get_tree().create_timer(3).timeout
	position = spawn_pos
	current_speed = 0
	$AnimatableBody2D/AnimationPlayer.play("idle")
	
