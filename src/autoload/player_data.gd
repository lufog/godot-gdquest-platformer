extends Node


signal score_updated
signal player_died


var _score := 0
var score:
	get:
		return _score
	set(value):
		_score = value
		score_updated.emit()

var _deaths := 0
var deaths:
	get:
		return _deaths
	set(value):
		_deaths = value
		player_died.emit()


func reset_data() -> void:
	_score = 0
	_deaths = 0
