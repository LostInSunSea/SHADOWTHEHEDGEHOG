extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal lever_turned()
var is_active := false
onready var handle = $Handle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	print("Interacting with lever!")
	is_active = not is_active
	
	if is_active:
		handle.transform.rotated()
	else:
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
