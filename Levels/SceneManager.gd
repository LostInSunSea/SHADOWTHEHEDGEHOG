extends Node

const World2D = preload("res://Levels/2DLevel1.tscn")
const World1_3D = preload("res://Levels/3DLevel1.tscn")
const World2_3D = preload("res://Levels/3DLevel2.tscn")
const Transition = preload("res://Levels/Transitions/Fade.tscn")
var temp
var is3D = true

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.SWAP3D:
		swap_scene()
		Globals.SWAP3D = false
		pass
	if Input.is_action_just_pressed("Transition") && is3D == false:
		swap_scene()

func swap_scene():
	print("swapping")
	temp = Transition.instance()
	add_child(temp)
	temp.connect("transitioned", self, "_on_FadeTransition_transitioned")
	temp.transition()

func _on_FadeTransition_transitioned():
	$CurrentScene.get_child(0).queue_free()
	if(is3D):
		$CurrentScene.add_child(World2D.instance())
		is3D = false
	else:
		$CurrentScene.add_child(World1_3D.instance())
		is3D = true
	temp.disconnect("transitioned", self, "_on_FadeTransition_transitioned")
	temp.queue_free()
