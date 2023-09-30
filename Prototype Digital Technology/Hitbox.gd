extends Area2D
var Hitbox
func _ready():
	set_meta("hitbox", 1)

func _on_Hitbox_body_entered(body):
	Hitbox = false
	Hitbox = true
	if body is Player:
		pass
