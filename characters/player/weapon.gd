extends Node2D

@export var projectile_scene: PackedScene
@export var projectile_parent: NodePath

@onready var spawn_position: Marker2D = $SpawnPosition


func shoot() -> void:
	var projectile_instance = projectile_scene.instantiate()
	projectile_instance.global_position = spawn_position.global_position
	projectile_instance.rotation = rotation
	if projectile_parent:
		get_node(projectile_parent).add_child(projectile_instance)
	else:
		owner.add_child(projectile_instance)
