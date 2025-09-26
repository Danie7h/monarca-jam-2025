extends Node

signal listen_paused(value: bool)
signal open_door(key_mane: String, node: Node3D)
signal msg_player(type_msg: String, msg: String)
signal lister_get_key(key_mane: String)
signal request_open_door(key_mane: String)
signal response_open_door(key_mane: String)
signal is_have_key(key_name: String)
signal listen_moved_player(is_moved: bool)

func toogle_pause(value: bool) -> void:
	listen_paused.emit(value)
