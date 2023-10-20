extends CharacterBody2D

# Player
class_name Player
# Jump leaniency var
var jump_leaniency = 1
# Player Speed
const SPEED = 150
# Player jump velocity
const JUMP_VELOCITY = -275
# dying variable for player death animation
var dying = false
# Hitbox varabile for player death
var in_Hitbox = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
# Add the gravity.
# Player movemnt and all of the player animations
# freeze player input when in door and hitbox
	print(in_Hitbox)
	var in_door = get_parent().find_child("Door").door
	if not is_on_floor():
		velocity.y += gravity * delta
# freeze Player input when in door and hitbox for jumping
	if (
			Input.is_action_just_pressed("jump") and is_on_floor()
			and gravity and not in_door and not in_Hitbox
	):
		velocity.y = JUMP_VELOCITY
		$JumpSFX.play()
	# Get the input direction and handle the movement.
	# Freeze player input when in hitbox and door
	# all of the player animations are listed in the code bellow
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

	
# When Player enters the Hitbox
# take player back to the start coodernates and disable player collision untill respawned.
# dissable collison shape
	move_and_slide()
func _on_area_2d_area_entered(area):
	if area.has_meta("hitbox"):
		velocity.x = 0
		velocity.y = 0
		dying = true
		in_Hitbox = true
		$Player_death.play()
		$Area2D/CollisionShape2D2.set_deferred("disabled",true)
		await get_tree().create_timer(1).timeout
		position.x = 107
		position.y = 281
		$Area2D/CollisionShape2D2.set_deferred("disabled",false)
		in_Hitbox = false
