extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var level_to_load := "3DLevel1"
export var lock_name := "3DLevel1"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	print("interacting with door")
	Globals.LEVEL_TO_LOAD = level_to_load
	Globals.DOOR_INTERACTED = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
