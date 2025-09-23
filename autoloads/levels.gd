extends Node

signal listen_paused(value: bool)
signal open_door(key: String, node: Node3D)
signal msg_player(type_msg: String, msg: String)
signal lister_get_key(key: String)
signal request_open_door(key_mane)
signal response_open_door(key_mane)
signal is_have_key(key_name)

func toogle_pause(value: bool) -> void:
	listen_paused.emit(value)
