extends StaticBody2D


# Declare member variables here. Examples:
export var increment = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	if(Globals.LeverState["3DLever"]):
		self.position.x = self.position.x + increment.x
		self.position.y = self.position.y + increment.y
		pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
