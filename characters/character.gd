class_name Character
extends CharacterBody2D

@export var speed = 300.0
@export var friction = 1200.0
@export var acceleration = 1200.0


func move(direction: Vector2) -> void:
	var delta := get_physics_process_delta_time()
	# Apply movement with acceleration
	if direction != Vector2.ZERO:
		velocity = velocity.move_toward(direction * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()
