extends CharacterBody2D
class_name Enemy


@export var speed := Vector2(300.0, 400.0)
@export var direction: float = -1
@export var stomp_impulse: float = 600.0

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	velocity.x = speed.x * direction


func _physics_process(delta: float) -> void:
	if is_on_wall():
		direction *= -1
		velocity.x = speed.x * direction
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.y = minf(velocity.y, speed.y)
	velocity.x = minf(velocity.x, speed.x)
	
	move_and_slide()


func kill() -> void:
	if is_queued_for_deletion():
		return
	
	queue_free()
