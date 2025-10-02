extends MeshInstance3D


func unlock()->void:
	var _material = get_active_material(0) as StandardMaterial3D
	_material.albedo_color = Color.GREEN
