extends Button


@onready var _scene_tree := get_tree()


func _on_button_up() -> void:
	PlayerData.score = 0
	_scene_tree.paused = false
	_scene_tree.reload_current_scene()
