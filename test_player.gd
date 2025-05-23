extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400
const BLOCK_MAX_VELOCITY = 180
const PUSH_FORCE = 100


var gravity: float =  ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed('ui_accept') and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction = Input.get_axis('ui_left','ui_right')
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collision_block = collision.get_collider()
		if collision_block.is_in_group("blocks") and abs(collision_block.get_linear_velocity().x) < BLOCK_MAX_VELOCITY:
			collision_block.apply_central_impulse(collision.get_normal() * -PUSH_FORCE)
	
	move_and_slide()
