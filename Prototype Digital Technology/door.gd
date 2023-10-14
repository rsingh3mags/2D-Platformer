extends Area2D
var door = false
@export var level = ""
signal player_entered(level)

func _on_body_entered(body):
	if body.name == "Player":
		get_node("CollisionShape2D/AnimatedSprite2D").play("idle")
		$Entered_Door.play()
		door = true
		await get_tree().create_timer(3).timeout
		door = false
		player_entered.emit(level)
