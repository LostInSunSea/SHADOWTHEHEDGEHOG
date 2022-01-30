extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var start_position := Vector3()
export var end_position := Vector3()
export var duration_sec := 3.0

onready var tween := get_node("Tween")
var _start_time := OS.get_ticks_msec()
var _start_position := transform.origin
var _current_state := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_state(state):
	_start_time = OS.get_ticks_msec()
	_current_state = state
	print("setting state ", state)
	if _current_state:
		tween.interpolate_property(self, "position", start_position, end_position, 
		duration_sec, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	else:
		tween.interpolate_property(self, "position", end_position, start_position, 
		duration_sec, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
