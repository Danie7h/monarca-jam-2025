extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		$AnimationPlayer.play("ending")
		$monster_cata.show()
		
		var _player = get_tree().get_first_node_in_group("player") as CharacterBody3D
		var _monster = $monster_cata
		_player.look_at(Vector3(_monster.global_position.x, _player.global_position.y, _monster.global_position.z))
		$"../Music/Music1".stop() 
		$"../Music/Music2".stop()
		$"../Music/Tension".play()
		get_tree().paused = true


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "ending":
		get_tree().paused = false
		get_tree().change_scene_to_file("res://creditos.tscn")
		
