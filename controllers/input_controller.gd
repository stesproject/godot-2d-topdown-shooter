class_name InputController
extends BaseController

signal direction_changed(new_direction: Vector2)
signal aim_changed(angle: float)
signal shoot_pressed()


func _physics_process(_delta: float) -> void:
	var input_direction = Input.get_vector(
		Const.INP_MOVE_LEFT,
		Const.INP_MOVE_RIGHT,
		Const.INP_MOVE_UP,
		Const.INP_MOVE_DOWN
	).normalized()
	direction_changed.emit(input_direction)


func _unhandled_input(event: InputEvent) -> void:
	# Handle shoot input
	if event.is_action_pressed(Const.INP_SHOOT):
		shoot_pressed.emit()


func _process(_delta: float) -> void:
	var aim_direction = Vector2.ZERO

	# Check for joystick input first (right analog stick)
	var joystick_input = Vector2(
		Input.get_action_strength(Const.INP_AIM_RIGHT) - Input.get_action_strength(Const.INP_AIM_LEFT),
		Input.get_action_strength(Const.INP_AIM_DOWN) - Input.get_action_strength(Const.INP_AIM_UP)
	)
	
	# If joystick has significant input, use it for aiming
	if joystick_input.length() > Const.JOY_DEADZONE_THRESHOLD:
		aim_direction = joystick_input.normalized()
		aim_changed.emit(aim_direction.angle())
	else:
		# Otherwise use mouse position
		var mouse_position = get_global_mouse_position()
		aim_direction = (mouse_position - global_position).normalized()
		aim_changed.emit(aim_direction.angle())
