extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var start_position = Vector3()
export var end_position = Vector3()

onready var tween = get_node("Tween")
var _start_time := OS.get_time()
var _current_state := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	print(delta)
	
func set_state(state):
	_start_time = OS.get_datetime()
	_current_state = state
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
