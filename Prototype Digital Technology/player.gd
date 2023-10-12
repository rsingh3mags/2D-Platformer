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

#Everything on dash
#var dashDirection = Vector2(1,0)
#var canDash = false
#var dashing = false 

#func dash():
	#if is_on_floor():
		#canDash = true
	#if Input.is_action_pressed("ui_right"):
		#dashDirection = Vector2(1,0)
	#if Input.is_action_just_pressed("ui_left"):
		#dashDirection = Vector2(-1,0)
	#if Input.is_action_just_pressed("ui_dash") and canDash:
		#velocity = dashDirection.normalized() * 1500
		#canDash = false 
		#dashing = true
		#await get_tree().create_timer(0.2).timeout
		#dashing = false


func _physics_process(delta):
	#dash()
#Add the gravity.")
	print(in_Hitbox)
	var in_door = get_parent().find_child("Door").door
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("jump") and is_on_floor() and gravity and not in_door and not in_Hitbox:
		velocity.y = JUMP_VELOCITY
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
		dying = true
		in_Hitbox = true
		await get_tree().create_timer(2).timeout
		dying = false
		position.x = 107
		position.y = 281
		in_Hitbox = false
