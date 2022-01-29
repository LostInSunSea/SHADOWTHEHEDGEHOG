extends Node

const World2D = preload("res://Levels/2DLevel1.tscn")
const World3D = preload("res://Levels/3DLevel1.tscn")

var is3D = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Transition"):
		$FadeTransition.transition()

func _on_FadeTransition_transitioned():
	$CurrentScene.get_child(0).queue_free()
	if(is3D):
		$CurrentScene.add_child(World2D.instance())
		is3D = false
	else:
		$CurrentScene.add_child(World3D.instance())
		is3D = true 
	print("Swapped Scene")
