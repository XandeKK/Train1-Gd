extends Node2D

func _ready():
	$HUD/Point.on_get_item(Global.points)
	$Player.current_life = Global.current_life
	$HUD/Life.on_change_life(Global.current_life)

func _on_area_2d_body_entered(body):
	Global.reset()
