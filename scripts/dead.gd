extends PlayerState

func enter(msg := {}):
	player.set_animate("Dead")
	await get_tree().create_timer(1).timeout
	Global.reset()
