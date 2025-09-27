extends Puzle


@onready var cables := $PanelContainer/BoxContainer/Cables
@onready var plugs := $PanelContainer/BoxContainer/Plugs


@export var cables_colors: Array[Color]


func _ready() -> void:
	_initialize_pulze()
	var count = 0
	for x in cables_colors:
		count += 1
		var panel_container := PanelContainer.new() 
		var label := Label.new()
		label.text = str(count)
		panel_container.add_child(label)
		cables.add_child(panel_container)



func _input_pulze():
	pass
