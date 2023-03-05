extends PlayerState

func enter(msg:= {}):
	player.set_animate("Land")
	if msg["fall_force"] > 1000:
		state_machine.transition_to("Hit", {"knockback": 100})
	else:
		state_machine.transition_to("Idle")
