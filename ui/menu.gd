extends Control

@onready var start := %Start
@onready var options := $PanelContainer/VBoxContainer
var option_focus := 0

func _ready() -> void:
	start.connect("button_down", _start)

func _process(delta: float) -> void:
	gamepad()
	
func gamepad() -> void:
	if Input.is_action_just_pressed("ui_up"):
		option_focus -= 1
	if Input.is_action_just_pressed("ui_down"):
		option_focus += 1
	if option_focus >= len(options.get_children()):
		option_focus = 0
	if option_focus < 0:
		option_focus = len(options.get_children()) -1
	(options.get_child(option_focus) as Button).grab_focus()
	
	if Input.is_action_just_pressed("ui_accept"):
		(options.get_child(option_focus) as Button).pressed
		
func _start() -> void:
	get_tree().change_scene_to_file('res://levels/test/scene.tscn')
