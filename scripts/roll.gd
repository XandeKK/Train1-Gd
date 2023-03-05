extends PlayerState

func enter(msg := {}):
	player.set_animate("Roll")

func physics_update(delta):
	player.velocity.y += player.gravity * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.roll_velocity
		player.rotate_sprite(direction * 0.15)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.roll_velocity)
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("roll"):
		state_machine.transition_to("Idle")

func exit():
	player.set_default_rotation()
