extends Node2D


@export var force = -500.0


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player: 
		area.get_parent().velocity.y += force
		$AnimatedSprite2D.play("boing")
		await get_tree().create_timer(0.3).timeout
	queue_free()
