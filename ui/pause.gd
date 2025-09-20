extends Control


@onready var resumen := %Resumen
@onready var credited := %Credited
@onready var display_pause := %DisplayPause
@onready var reset := %Reset


func _ready() -> void:
	LEVELS.listen_paused.connect(func(value: bool) -> void:
		if value:
			clear_display()
	)
	resumen.connect("button_down", func () -> void:
		LEVELS.toogle_pause(false)
	)
	credited.connect("button_down", func() -> void:
		clear_display()
		display_pause.add_child(load("res://ui/credited.tscn").instantiate())
	)
	reset.connect("button_down", func () -> void:
		get_tree().change_scene_to_file('res://ui/menu.tscn')
	)


func clear_display() -> void:
	for x in display_pause.get_children():
		(x as Node).queue_free()
