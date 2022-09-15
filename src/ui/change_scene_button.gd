@tool
extends Button


@export_file var scene_path: String = ""

@onready var _scene_tree := get_tree()

func _on_button_up() -> void:
	_scene_tree.paused = false
	_scene_tree.change_scene_to_file(scene_path)


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if scene_path == "":
		warnings.push_back("The scene path property can't be empty")
	
	return warnings
