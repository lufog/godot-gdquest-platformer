extends Area2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(_body: Node2D) -> void:
	PlayerData.score += 1
	animation_player.play("fade_out")
	await animation_player.animation_finished
	queue_free()
