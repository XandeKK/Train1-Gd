extends Node

var keys := []
var current_scene = null
var points := 0
var current_life;

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
	current_life = current_scene.get_node("Player").current_life

func reset():
	var root = get_tree().get_root()
	
	keys = []
	points = 0
	
	goto_scene(get_tree().current_scene.scene_file_path)

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

func _deferred_goto_scene(path):
	current_scene.free()
	
	var s = ResourceLoader.load(path)

	current_scene = s.instantiate()

	get_tree().get_root().add_child(current_scene)

	get_tree().set_current_scene(current_scene)
