extends Node2D

# variable for moving
var moving = false 

# Moving animaiton when player enters the moving platform
# Player detection function aswell
func _on_area_2d_area_entered(area):
	if area.get_parent() is Player && !moving:
		moving = true
		$AnimatableBody2D/AnimationPlayer.play("Move")
		$Player_On_Platform.play()
