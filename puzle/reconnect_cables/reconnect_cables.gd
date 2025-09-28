extends Puzle


@onready var cables := $PanelContainer/BoxContainer/Cables
@onready var plugs := $PanelContainer/BoxContainer/Plugs


@export var cables_colors: Array[Color]


func _ready() -> void:
	_initialize_pulze()
	for i in cables_colors:
		var cable = Connector.new()
		var label_cable = Label.new()
		var plug = Connector.new()
		var label_plug = Label.new()
		#label_cable.text = "cable"
		#label_plug.text = "plug"
		cable.add_child(label_cable)
		cable.color = i
		plug.add_child(label_plug)
		plug.color = i
		cables.add_child(cable)
		plugs.add_child(plug)


func _input_pulze():
	pass
