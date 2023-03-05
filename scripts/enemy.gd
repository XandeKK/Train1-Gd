extends CharacterBody2D

@export var speed := 100.0
@export var health := 1
@export var can_take_damage := false

func take_damage(value: int) -> void:
	health -= value
	if health <= 0:
		$AnimationPlayer.play("Dead")
		$CollisionShape2D.set_deferred("disabled", true)
		await $AnimationPlayer.animation_finished
		queue_free()
