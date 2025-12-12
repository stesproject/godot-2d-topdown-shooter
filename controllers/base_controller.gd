class_name BaseController
extends Node2D

@export var enabled: bool = true:
	set(value):
		enabled = value
		_update_process_mode()


func _ready() -> void:
	_update_process_mode()


func _update_process_mode() -> void:
	if enabled:
		process_mode = PROCESS_MODE_INHERIT
	else:
		process_mode = PROCESS_MODE_DISABLED
