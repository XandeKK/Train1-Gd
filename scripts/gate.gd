extends Area2D

@export var top_closed : Texture
@export var lock : Texture
@export var key : KeyGate
@export var path : String

var within := false

func _ready():
	$Label.hide()
	$Top.texture = top_closed
	$Lock.texture = lock

func _process(delta):
	if within:
		$Label.show()
		if Global.keys.has(key):
			$Label.text = 'Press "E" to open'
			$AnimationPlayer.play("Open")
			if Input.is_action_just_pressed("interactive"):
				Global.goto_scene(path)
		else:
			$Label.text = "Get a key this gate"

func _on_body_entered(body):
	within = true

func _on_body_exited(body):
	within = false
	$Label.hide()
