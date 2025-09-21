extends Node

signal listen_paused(value: bool)
signal open_door(key: String, node: Node3D)

func toogle_pause(value: bool) -> void:
	listen_paused.emit(value)
