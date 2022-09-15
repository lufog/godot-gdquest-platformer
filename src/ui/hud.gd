extends Control


var paused:
	get:
		return _scene_tree.paused
	set(value):
		pause_overlay.visible = value
		_scene_tree.paused = value

@onready var coins_label: Label = $ColorRect/HBoxContainer/CoinsLabel
@onready var title_label: Label = $PauseOverlay/TitleLabel
@onready var pause_overlay: ColorRect = $PauseOverlay
@onready var _scene_tree := get_tree()


func _ready() -> void:
	PlayerData.score_updated.connect(update_interface)
	PlayerData.player_died.connect(_player_data_player_died)
	update_interface()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and title_label.text != "You died":
		paused = not paused


func update_interface() -> void:
	coins_label.text = str(PlayerData.score).pad_zeros(3)


func _player_data_player_died() -> void:
	title_label.text = "You died"
	paused = true
	
