extends Node2D

@onready var character: Character = $".."
@onready var input_controller: InputController = $"../InputController"
@onready var weapon: Node2D = $"../Weapon"


func _ready() -> void:
  input_controller.direction_changed.connect(_on_direction_changed)
  input_controller.aim_changed.connect(_on_aim_changed)
  input_controller.shoot_pressed.connect(weapon.shoot)


func _on_direction_changed(new_direction: Vector2) -> void:
  character.move(new_direction)


func _on_aim_changed(angle: float) -> void:
  weapon.rotation = angle
