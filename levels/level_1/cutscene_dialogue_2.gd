extends Control

@export var dialogue_ended_2 := false

func _ready() -> void:
	hide()
func _process(delta: float) -> void:
	if dialogue_ended_2:
		if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_get_object"):
			hide()
			get_tree().paused = false
			$"../CataArea".queue_free()
			queue_free()
			
