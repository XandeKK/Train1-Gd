extends Area2D

@export var point := 1

signal get_item(point: int)

func _ready():
	if Global.current_scene.get_node("HUD/Point") != null:
		get_item.connect(Global.current_scene.get_node("HUD/Point").on_get_item)

func _on_body_entered(body):
	$AnimationPlayer.play("Get")
	emit_signal("get_item", point)
	Global.points += point
	await get_tree().create_timer(0.5).timeout
	queue_free()
