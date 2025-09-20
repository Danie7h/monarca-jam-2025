extends Control

@onready var resumen := %Resumen

func _ready() -> void:
	resumen.connect("button_down", func () -> void:
		LEVELS.toogle_pause(false)
	)
