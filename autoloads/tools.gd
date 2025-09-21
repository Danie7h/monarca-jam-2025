extends Node


func clear(node: Node):
	for x in node.get_children():
		x.queue_free()
