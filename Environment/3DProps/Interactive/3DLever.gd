extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lever_angle := 30.0

var target_prop
var update_lever_flag = false
var rotated = false
onready var handle = $Handle

# Called when the node enters the scene tree for the first time.
func _ready():
	update_lever_flag = true

func _process(delta):
	if update_lever_flag:
		update_lever_flag = false
		update_lever(true)

func interact():
	#print("Interacting with lever - ", self.name)
	Globals.toggleLeverState(self.name)
	update_lever()

func update_lever_rotation():
	var deg_to_radians = (lever_angle * 2) * PI / 180
	if Globals.LeverState[self.name]:
		handle.rotation_degrees.x = lever_angle
	else:
		handle.rotation_degrees.x = -lever_angle

func update_lever(skip_animation = false):
	update_lever_rotation()
	# Update target prop location
	#print("self: ", self.name)
	var target_prop_name = Globals.LeverMap[self.name]
	#print("target prop name - ", target_prop_name)
	target_prop = get_node(target_prop_name)
	print(target_prop)
	if target_prop:
		target_prop.set_state(self.name, skip_animation);
