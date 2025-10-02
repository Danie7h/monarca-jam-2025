extends Control

@export var dialogue_ended := false

func _ready() -> void:
	get_tree().paused = true

func _process(delta: float) -> void:
	if dialogue_ended:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_get_object"):
			hide()
			get_tree().paused = false
