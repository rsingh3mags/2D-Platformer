extends Area2D
# Variable for Hitbox
var Hitbox
# Metadata for the hitbox so I can create player death
func _ready():
	set_meta("hitbox", 1)

# what happens when player enters the hitbox.
func _on_Hitbox_body_entered(body):
	Hitbox = false
	Hitbox = true
	if body is Player:
		pass
