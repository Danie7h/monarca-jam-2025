extends CharacterBody3D

@export_group("Movement Settings")
@export var SPEED: float = 5.0
@export var JUMP_VELOCITY: float = 4.5

@export_group("Look Settings")
@export_range(0.001, 0.01, 0.001) var MOUSE_SENSITIVITY: float = 0.005
@export_range(1.0, 5.0, 0.1) var CONTROLLER_SENSITIVITY: float = 3.0

const MIN_PITCH_RAD: float = -1.2
const MAX_PITCH_RAD: float = 1.2

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D

var is_paused := false

var _gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	LEVELS.listen_paused.connect(func(value: bool) -> void: is_paused = value)


func _unhandled_input(event: InputEvent) -> void:
	
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		var mouse_motion: Vector2 = Vector2(event.relative.x, event.relative.y)
		_apply_look_rotation(Vector2(-mouse_motion.x, -mouse_motion.y) * MOUSE_SENSITIVITY)

	
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _physics_process(delta: float) -> void:
	if not is_paused:
		_apply_gravity(delta)
		_handle_jump()
		_handle_controller_look(delta)
			
		var input_direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		_handle_movement(input_direction)
			
		move_and_slide()


func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= _gravity * delta


func _handle_jump() -> void:
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


func _handle_controller_look(delta: float) -> void:
	var look_input: Vector2 = Input.get_vector("ui_right_2", "ui_left_2", "ui_up_2", "ui_down_2")
	if look_input.length_squared() > 0:
		_apply_look_rotation(look_input * CONTROLLER_SENSITIVITY * delta)


func _handle_movement(input_dir: Vector2) -> void:
	var direction: Vector3 = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


func _apply_look_rotation(rotation_delta: Vector2) -> void:
	head.rotate_y(rotation_delta.x)
	
	camera.rotate_x(rotation_delta.y)
	camera.rotation.x = clamp(camera.rotation.x, MIN_PITCH_RAD, MAX_PITCH_RAD)
