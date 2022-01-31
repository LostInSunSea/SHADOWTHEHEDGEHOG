extends Node

const World2D = preload("res://Levels/2DLevel1.tscn")
const World3D = preload("res://Levels/3DLevel1.tscn")
const World2D2 = preload("res://Levels/2DLevel2.tscn")
const World3D2 = preload("res://Levels/3DLevel2.tscn")
const WinLevel = preload("res://Levels/WinLevel.tscn")

const Transition = preload("res://Levels/Transitions/Fade.tscn")
var temp
var is3D = true
var isLVL2 = false
var ARROW = false
var DOOR = false

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
		pass
	if Globals.DOOR_INTERACTED:
		print("door interacted")
		DOOR = true
		swap_scene()		
		Globals.DOOR_INTERACTED = false
	if Globals.ARROWTRIGGER:
		print("scenemanager arrow -----------------------<")
		ARROW = true
		swap_scene()
		Globals.ARROWTRIGGER = false
		pass
	

func swap_scene():
	print("swapping")
	temp = Transition.instance()
	add_child(temp)
	temp.connect("transitioned", self, "_on_FadeTransition_transitioned")
	temp.transition()

func _on_FadeTransition_transitioned():
	#$CurrentScene.get_child(0).queue_free()
	for i in $CurrentScene.get_children():
		print("test222222222--------------")
		i.queue_free()
	print("Trigger", Globals.ARROWTRIGGER)
	if DOOR:
		print("transitioning to ", Globals.LEVEL_TO_LOAD)
		if Globals.LEVEL_TO_LOAD == "3DLevel1":
			$CurrentScene.add_child(World3D.instance())
		elif Globals.LEVEL_TO_LOAD == "3DLevel2":
			$CurrentScene.add_child(World3D2.instance())
		elif Globals.LEVEL_TO_LOAD == "WinLevel":
			$CurrentScene.add_child(WinLevel.instance())
		DOOR = false
	elif ARROW: 
		print("arrows")
		if(isLVL2):
			print("test1")
			$CurrentScene.add_child(World2D.instance())
		else:
			print("test2")
			$CurrentScene.add_child(World2D2.instance())
		isLVL2 = !isLVL2
		ARROW = false
	else:
		print("no arrows")
		if(is3D):
			if(isLVL2):
				print("test1")
				$CurrentScene.add_child(World2D2.instance())
			else:
				print("test2")
				$CurrentScene.add_child(World2D.instance())
			is3D = false
		else:
			if(isLVL2):
				print("test3")
				$CurrentScene.add_child(World3D2.instance())
			else:
				print("test4")
				$CurrentScene.add_child(World3D.instance())
			is3D = true
	temp.disconnect("transitioned", self, "_on_FadeTransition_transitioned")
	temp.queue_free()

