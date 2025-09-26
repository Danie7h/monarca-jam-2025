extends Node3D
class_name Puzle


@export var area: Area3D
@export var temp: Control
@export var puzle_name: String

var is_actived = false
var is_player_nearby = false


func _ready() -> void:
	if temp:
		temp.visible = is_actived
	area.body_entered.connect(func(body: Node3D) -> void:
		if body.is_class("CharacterBody3D"):
			is_player_nearby = true
			LEVELS.msg_player.emit("actived_puzle", puzle_name)
	)
	area.body_exited.connect(func(body: Node3D) -> void:
		if body.is_class("CharacterBody3D"):
			is_player_nearby = false
			temp.visible = false
	)
