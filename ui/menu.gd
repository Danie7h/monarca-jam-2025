extends Control

@onready var start := %Start
var option_focus := 0

func _ready() -> void:
	start.connect("button_down", _start)
		
func _start() -> void:
	get_tree().change_scene_to_file('res://levels/test/scene.tscn')
