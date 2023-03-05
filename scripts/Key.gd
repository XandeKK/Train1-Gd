extends Area2D
class_name KeyGate

@export var texture : Texture

func _ready():
	$Sprite2D.texture = texture

func _on_body_entered(body):
	$CollisionShape2D.set_deferred("disabled", true)
	$AnimationPlayer.play("Get")
	Global.keys.append(self)
	await get_tree().create_timer(0.5).timeout
	queue_free()
