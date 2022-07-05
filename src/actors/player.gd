extends Actor



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


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
#
#
#
#func _physics_process(delta: float) -> void:
#	
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction := Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
