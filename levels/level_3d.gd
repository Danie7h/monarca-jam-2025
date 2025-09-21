extends Node3D
class_name Level3d

@onready var screen_pause = preload("res://ui/pause.tscn").instantiate()
var is_paused := false


func _ready() -> void:
	_action_screen()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_pause"):
		is_paused = !is_paused
		LEVELS.toogle_pause(is_paused)


func _action_screen() -> void:
	screen_pause.visible = is_paused
	add_child(screen_pause)
	LEVELS.listen_paused.connect(func (value: bool) -> void: screen_pause.visible = value)
