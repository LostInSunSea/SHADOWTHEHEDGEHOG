extends Node

const World2D = preload("res://Levels/2DLevel1.tscn")
const World3D = preload("res://Levels/3DLevel1.tscn")
const Transition = preload("res://Levels/Transitions/Fade.tscn")
var temp
var is3D = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Transition"):
		temp = Transition.instance()
		add_child(temp)
		temp.connect("transitioned", self, "_on_FadeTransition_transitioned")
		temp.transition()

func _on_FadeTransition_transitioned():
	print("hello")
	$CurrentScene.get_child(0).queue_free()
	print("test", is3D)
	if(is3D):
		$CurrentScene.add_child(World2D.instance())
		is3D = false
	else:
		$CurrentScene.add_child(World3D.instance())
		is3D = true
	print($CurrentScene.get_children())
	temp.disconnect("transitioned", self, "_on_FadeTransition_transitioned")
	temp.queue_free()
	print("Swapped Scene")
