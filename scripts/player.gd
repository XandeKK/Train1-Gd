extends CharacterBody2D
class_name Player

@export var speed := 300.0
@export var air_speed := 200.0
@export var jump_velocity := -600.0
@export var roll_velocity := 500.0
@export var knockback := 300
@export var max_life := 3
@export var current_life := max_life
var state_machine: StateMachine
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal change_life(current_life)

func _ready():
	change_life.connect(get_parent().get_node("HUD/Life").on_change_life)

func set_animate(name: String) -> void:
	$AnimationPlayer.play(name)

func flip_h(value: bool) -> void:
	$AnimatedSprite2D.flip_h = value

func rotate_sprite(value: float) -> void:
	$AnimatedSprite2D.rotation += value

func set_default_rotation() -> void:
	$AnimatedSprite2D.rotation = 0

func take_damage(value: int) -> void:
	current_life -= value
	Global.current_life = current_life
	emit_signal("change_life", current_life)

func is_dead() -> bool:
	return current_life <= 0

func is_full_life() -> bool:
	return current_life == max_life 

func _on_damage_box_body_entered(body):
	if body.can_take_damage:
#		Create new state Damage
		state_machine.transition_to("Jump")
		body.take_damage(1)

