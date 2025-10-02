extends Area3D



@onready var cutscene_dialogue_2: Control = $"../CutsceneDialogue2"

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		cutscene_dialogue_2.show()
		$"../CutsceneDialogue2/AnimationPlayer".play("Cata_text_2")
		var _player = get_tree().get_first_node_in_group("player") as CharacterBody3D
		var _cata = $"../Sister/Cataxis_model"
		_player.look_at(Vector3(_cata.global_position.x, _player.global_position.y, _cata.global_position.z))
		get_tree().paused = true
		LEVELS.lister_get_key.emit("Llave_Oficina")
