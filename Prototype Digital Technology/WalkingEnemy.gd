extends CharacterBody2D

# Variable for direction of the enemy
var direction = Vector2.RIGHT # (1,0) 

# Both variables needed for the enemys ledge checking
@onready var LedgeCheckRight: = $LedgeCheckRight
@onready var LedgeCheckLeft: = $LedgeCheckLeft

# function for ledgecheck
func _physics_process(_delta):
	var found_wall = is_on_wall()
	var found_Ledge = not LedgeCheckRight.is_colliding() or not LedgeCheckLeft.is_colliding()
# Change Direction when ledge is foung
	if found_wall or found_Ledge:
		direction *= -1
# Play enemy animation
	velocity = direction * 25
	$AnimatedSprite2D.play("Walking")
	move_and_slide()
