extends Area2D

@export var speed: float = 500.0
@export var damage: float = 10.0

func _physics_process(delta: float) -> void:
	var velocity = Vector2(cos(rotation), sin(rotation)) * speed
	position += velocity * delta
