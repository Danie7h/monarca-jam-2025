extends Node3D
class_name Door


@onready var collision := $Area3D/CollisionShape3D
@export var room : String


func _ready() -> void:
	print(room)


func _on_area_3d_area_entered(area: Area3D) -> void:
	print(area)
	print(load(room))
