extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var start_position := Vector3()
export var end_position := Vector3()
export var duration_sec := 3.0

onready var tween: Tween = get_node("Tween")
var _start_time := OS.get_ticks_msec()
var _start_position := transform.origin
var _current_state := false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("my path: ", self.get_path())
	pass # Replace with function body.

func set_state(lever_name, skip_animation = false):
	_start_time = OS.get_ticks_msec()
	_current_state = Globals.LeverState[lever_name]
	print("setting state ", lever_name)
	if _current_state and not skip_animation:
		tween.interpolate_property(self, "transform:origin", start_position, end_position, 
		duration_sec, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	elif not skip_animation:
		tween.interpolate_property(self, "transform:origin", end_position, start_position, 
		duration_sec, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	elif _current_state:
		transform.origin = end_position
	else:
		transform.origin = start_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
