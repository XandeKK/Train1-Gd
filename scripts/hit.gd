extends PlayerState

func enter(msg := {}):
	player.set_animate("Hit")
	player.velocity.x = msg["knockback"]
	player.velocity.y = -abs(msg["knockback"])
	player.take_damage(1)

func physics_update(delta):
	player.velocity.y += player.gravity * delta
	player.move_and_slide()
	
	if player.is_on_floor():
		if player.is_dead():
			state_machine.transition_to("Dead")
		else:
			state_machine.transition_to("Idle")

func _on_hit_box_body_entered(body):
	# body.damage
	if body.position.x > player.position.x:
		state_machine.transition_to("Hit", {"knockback": -player.knockback})
	else:
		state_machine.transition_to("Hit", {"knockback": player.knockback})

