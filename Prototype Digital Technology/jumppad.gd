extends Node2D

#Velocity of the jumppad after player hits it.
@export var force = -500.0

# When player enters the jumppad it plays animation and increases players verticel velocity
# Play Jumppad animations
# Jumppad sound
func _on_area_2d_area_entered(area):
	if area.get_parent() is Player: 
		area.get_parent().velocity.y += force
		$AnimatedSprite2D.play("boing")
		$JUMP.play()
		await get_tree().create_timer(0.3).timeout
		$AnimatedSprite2D.play("idle")
