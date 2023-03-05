extends PlayerState

var fall_force : float = 0

func enter(msg:= {}):
	player.set_animate("Fall")

func physics_update(delta):
	player.velocity.y += player.gravity * delta
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.air_speed
		player.flip_h(direction < 0)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.air_speed)
	
	player.move_and_slide()
	
	if player.is_on_floor():
		state_machine.transition_to("Land", {"fall_force": fall_force})
	else:
		fall_force = player.velocity.y
