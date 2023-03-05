extends PlayerState

func enter(msg := {}):
	player.velocity.y = player.jump_velocity
	player.set_animate("Jump")
	
func physics_update(delta):
	player.velocity.y += player.gravity * delta
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.air_speed
		player.flip_h(direction < 0)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.air_speed)
	
	player.move_and_slide()
	
	if player.velocity.y > -1:
		state_machine.transition_to("Fall")
