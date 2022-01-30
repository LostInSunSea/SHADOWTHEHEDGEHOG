extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lever_angle := 30.0

var target_prop
onready var handle = $Handle

# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.LeverState[self.name] = false
	update_lever_rotation()

func interact():
	print("Interacting with lever!")
	Globals.toggleLeverState(self)
	update_lever()

func update_lever_rotation():
	var deg_to_radians = (lever_angle * 2) * PI / 180
	if Globals.LeverState[self.name]:
		handle.rotate_object_local(Vector3(1, 0, 0), -deg_to_radians)
	else:
		handle.rotate_object_local(Vector3(1, 0, 0), deg_to_radians)

func update_lever():
	update_lever_rotation()
	# Update target prop location
	print("self: ", self.name)
	var target_prop_name = Globals.LeverMap[self.name]["3DProp"]
	print("target prop name - ", target_prop_name)
	for i in get_node("/root/SceneManager/CurrentScene/").get_children():
		print("child")
		print(i)
	target_prop = get_node(target_prop_name)
	print(target_prop)
	if target_prop:
		target_prop.set_state(Globals.LeverState[self.name]);
