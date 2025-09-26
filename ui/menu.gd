extends Control

@onready var start := %Start
@onready var credited := %Credited
@onready var exit := %Exit
@onready var display_menu := %DisplayMenu


var option_focus := 0


func _ready() -> void:
	start.connect("button_down", func() -> void:
		get_tree().change_scene_to_file("res://levels/level_1/level_1.tscn")
	)
	credited.connect("button_down", func() -> void:
		clear_display()
		display_menu.add_child(load("res://ui/credited.tscn").instantiate())
	)
	exit.connect("button_down", func() -> void:
		get_tree().quit()
	)
	
	
func clear_display() -> void:
	for x in display_menu.get_children():
		(x as Node).queue_free()
