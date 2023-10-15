extends CharacterBody2D

class_name Player
var health = 4
var jump_leaniency = 1
const SPEED = 150
const JUMP_VELOCITY = -275
var dying = false

var in_Hitbox = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
#Add the gravity.
	print(in_Hitbox)
	var in_door = get_parent().find_child("Door").door
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor() and gravity and not in_door and not in_Hitbox:
		velocity.y = JUMP_VELOCITY
		$JumpSFX.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction and not in_door and not in_Hitbox:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	elif not in_Hitbox:
		$AnimatedSprite2D.play("Idle")
		velocity.x = move_toward(velocity.x, 0, float(SPEED) / 2)
	if dying == true:
		$AnimatedSprite2D.play("death")
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.play("after_death")
		dying = false
	elif not is_on_floor():
		$AnimatedSprite2D.play("jump")

	
	move_and_slide()
func _on_area_2d_area_entered(area):
	if area.has_meta("hitbox"):
		$Player_death.play()
		dying = true
		in_Hitbox = true
		await get_tree().create_timer(1).timeout
		position.x = 107
		position.y = 281
		in_Hitbox = false
