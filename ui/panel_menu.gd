extends BoxContainer
class_name PanelMenu

@onready var resumen := %Resumen

var option_focus := 0

#func _ready() -> void:
	#resumen.connect("button_down", func () -> void: LEVELS.toogle_pause(false))


func _process(delta: float) -> void:
	gamepad()
	
func gamepad() -> void:
	if Input.is_action_just_pressed("ui_up"):
		option_focus -= 1
	if Input.is_action_just_pressed("ui_down"):
		option_focus += 1
	if option_focus >= len(get_children()):
		option_focus = 0
	if option_focus < 0:
		option_focus = len(get_children()) -1
	(get_child(option_focus) as Button).grab_focus()
	
	if Input.is_action_just_pressed("ui_accept"):
		(get_child(option_focus) as Button).pressed
