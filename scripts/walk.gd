extends PlayerState

func enter(msg:= {}):
	player.set_animate("Walk")

func physics_update(delta):
	if not player.is_on_floor() and player.velocity.y > -1:
		state_machine.transition_to("Fall")
		return
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.speed
		player.flip_h(direction < 0)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Jump")
	elif Input.is_action_just_pressed("roll"):
		state_machine.transition_to("Roll")
	elif is_equal_approx(direction, 0.0):
		state_machine.transition_to("Idle")
