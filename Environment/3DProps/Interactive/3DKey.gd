extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _on_3DKey_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	Globals.Items[self.name] = true
	queue_free()
