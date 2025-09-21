extends Level3d


var rooms: Dictionary[String, Node3D]


func _ready() -> void:
	_action_screen()
	LEVELS.open_door.connect(func(key: String, node: Node3D) -> void:
		if not rooms.get(key):
			var path: String
			if key == "access_tunnel":
				path = "res://rooms/access_tunnel/access_tunnel.tscn"
			if key == "main_hall":
				path = "res://rooms/main_hall/main_hall.tscn"
			if path:
				rooms.set(key, load(path).instantiate())
				rooms.get(key).global_position = node.global_position
				rooms.get(key).global_rotation = node.global_rotation
				add_child(rooms.get(key))
	)
