extends PlayerState

func enter(msg := {}):
	player.velocity = Vector2.ZERO
	player.set_animate("Idle")

func physics_update(delta):
	if not player.is_on_floor():
		state_machine.transition_to("Fall")
		return
	
	if Input.is_action_just_pressed("move_up"):
		state_machine.transition_to("Jump")
	elif Input.get_axis("move_left", "move_right") != 0:
		state_machine.transition_to("Walk")
	elif Input.is_action_just_pressed("roll"):
		state_machine.transition_to("Roll")
		
