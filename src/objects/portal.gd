@tool
extends Area2D


@export var next_scene: PackedScene

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	
	if next_scene == null:
		warnings.push_back("The next scene property can't be empty")
	
	return warnings


func _on_body_entered(_body: Node2D) -> void:
	_teleport()


func _teleport() -> void:
	animation_player.play("fade_in")
	await animation_player.animation_finished
	get_tree().change_scene_to_packed(next_scene)

