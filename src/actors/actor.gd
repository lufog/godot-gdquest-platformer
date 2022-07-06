extends CharacterBody2D
class_name Actor


@export var speed := Vector2(300.0, 400.0)

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	pass


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	velocity.y = min(velocity.y, speed.y)
	velocity.x = min(velocity.x, speed.x)
	
	move_and_slide()
