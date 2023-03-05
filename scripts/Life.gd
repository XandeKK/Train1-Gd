extends Control

var life_size = 256

func on_change_life(player_life):
	if player_life == 0:
		$TextureRect.hide()
	$TextureRect.size.x = player_life * life_size
