extends Area3D





func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		$"../Sister/Cataxis_model".queue_free()
		$"../Ending/monster_cata".show()
		$"../Music/Music1".stop()
		$"../Music/Music2".play()
		queue_free()
