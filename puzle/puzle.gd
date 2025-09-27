extends Node3D
class_name Puzle


@export var area: Area3D
@export var temp: Control
@export var puzle_name: String


var is_actived = false
var is_player_nearby = false


func _initialize_pulze() -> void:
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
	
	
func _input_pulze():
	pass


func _physics_process(delta: float) -> void:
	if is_player_nearby and Input.is_action_just_pressed("ui_get_object"):
		is_actived = true
		temp.visible = is_actived
		LEVELS.listen_moved_player.emit(false)
	if is_actived and Input.is_action_just_pressed("ui_drop_item"):
		is_actived = false
		temp.visible = is_actived
		LEVELS.listen_moved_player.emit(true)
	_input_pulze()
