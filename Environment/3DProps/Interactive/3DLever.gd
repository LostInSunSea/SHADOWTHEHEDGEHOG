extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lever_angle := 30.0

signal lever_turned()
var is_active := false
onready var handle = $Handle

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.LeverState[self.name] = false
	pass # Replace with function body.

func interact():
	print("Interacting with lever!")
	Globals.toggleLeverState(self)
	
	var deg_to_radians = (lever_angle * 2) * PI / 180
	if Globals.LeverState[self.name]:
		handle.rotate_object_local(Vector3(1, 0, 0), deg_to_radians)
	else:
		handle.rotate_object_local(Vector3(1, 0, 0), -deg_to_radians)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
