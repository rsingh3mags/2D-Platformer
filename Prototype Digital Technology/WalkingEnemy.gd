extends CharacterBody2D

var direction = Vector2.RIGHT # (1,0) 

@onready var LedgeCheckRight: = $LedgeCheckRight
@onready var LedgeCheckLeft: = $LedgeCheckLeft

func _physics_process(delta):
	var found_wall = is_on_wall()
	var found_Ledge = not LedgeCheckRight.is_colliding() or not LedgeCheckLeft.is_colliding()
	
	if found_wall or found_Ledge:
		direction *= -1
	
	velocity = direction * 25
	$AnimatedSprite2D.play("Walking")
	move_and_slide()
