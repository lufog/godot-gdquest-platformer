extends Actor


@onready var stomp_detector: Area2D = $StompDetector


func _physics_process(delta: float) -> void:
	var input_direction := Input.get_axis("move_left", "move_right")
	
	if input_direction != 0:
		velocity.x = speed.x * input_direction
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -speed.y
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0
	
	super._physics_process(delta)


func _on_stomp_detector_area_entered(area: Area2D) -> void:
	if stomp_detector.global_position.y > area.global_position.y:
		return
	
	velocity.y = -speed.y * 0.8


func _on_enemy_detector_body_entered(_body: Node2D) -> void:
	_die()


func _die() -> void:
	if is_queued_for_deletion():
		return
	
	PlayerData.deaths += 1
	queue_free()
