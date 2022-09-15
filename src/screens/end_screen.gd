extends Control


@onready var score_label: Label = $ScoreLabel


func _ready() -> void:
	score_label.text = score_label.text % [PlayerData.score, PlayerData.deaths]
