extends Node3D
class_name Door


@onready var collision := $Area3D
@export var key : String
@export var marker: Node3D


func _ready() -> void:
	collision.connect("body_entered", func(body: Node3D) -> void:
		if body.is_class('CharacterBody3D') and key and marker:
			LEVELS.open_door.emit(key, marker)
	)
