extends CharacterBody2D
class_name Player


@export var speed := Vector2(300.0, 400.0)
@export var direction: float = -1
@export var stomp_impulse: float = 600.0

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	_update_velocity(delta)
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		var enemy = collision.get_collider() as Enemy
		
		if enemy != null:
			var collision_normal := collision.get_normal()
			var is_stomping := collision_normal.dot(Vector2.UP) > 0.25
			
			if is_stomping:
				velocity.y = -stomp_impulse
				enemy.kill()
			else:
				self.kill()


func kill() -> void:
	if is_queued_for_deletion():
		return
	
	PlayerData.deaths += 1
	queue_free()


func _update_velocity(delta: float) -> void:
	var input_direction := Input.get_axis("move_left", "move_right")
	
	if input_direction != 0:
		velocity.x = speed.x * input_direction
	else:
		velocity.x = 0
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -speed.y
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = 0
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, speed.y)
	velocity.x = min(velocity.x, speed.x)
