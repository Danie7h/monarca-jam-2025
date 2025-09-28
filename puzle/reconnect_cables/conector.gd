extends PanelContainer
class_name Connector


@export var color: Color


func _ready() -> void:
	var style_box: StyleBoxFlat = get_theme_stylebox("panel").duplicate()
	style_box.set_bg_color(color)
	add_theme_stylebox_override("panel", style_box)
