extends Node3D
class_name Door


@onready var area := $Area3D
@onready var collision := $StaticBody3D/CollisionShape3D
@onready var mesh := $Area3D/MeshInstance3D
@export var key_name : String
@export var marker: Node3D


var is_open := false


func _ready() -> void:
	area.connect("body_entered", func(body: Node3D) -> void:
		if body.is_class('CharacterBody3D') and key_name and marker:
			LEVELS.open_door.emit(key_name, marker)
		if body.is_class('CharacterBody3D') and key_name:
			LEVELS.request_open_door.emit(key_name)
	)
	area.connect("body_exited", func (body: Node3D) -> void:
		if body.is_class('CharacterBody3D'):
			mesh.visible = true
			$StaticBody3D.set_collision_layer_value(1, true)
	)
	LEVELS.response_open_door.connect(func(response_key_name: String) -> void:
		is_open = key_name == response_key_name
		mesh.visible = !is_open
		$StaticBody3D.set_collision_layer_value(1, !is_open)
	)
