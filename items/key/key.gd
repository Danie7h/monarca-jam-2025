extends Node3D


@export var key_name: String
@onready var area := $Area3D

const TYPE_MSG = "get_key"

var is_get := false

func _ready() -> void:
	area.connect("body_entered", func(body: Node3D) -> void:
		if body.get_class() == "CharacterBody3D":
			LEVELS.msg_player.emit(TYPE_MSG, key_name)
			is_get = true
	)
	area.connect("body_exited", func(body: Node3D) -> void:
		if body.get_class() == "CharacterBody3D":
			is_get = false
	)


func _physics_process(delta: float) -> void:
	if is_get:
		if Input.is_action_just_pressed("ui_get_object"):
			LEVELS.lister_get_key.emit(key_name)
			
			self.queue_free()
