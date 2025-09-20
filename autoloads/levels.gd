extends Node

signal listen_paused(value: bool)

func toogle_pause(value: bool) -> void:
	listen_paused.emit(value)
