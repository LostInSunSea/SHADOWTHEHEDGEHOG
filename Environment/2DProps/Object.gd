extends StaticBody2D


# Declare member variables here. Examples:
export var increment = Vector2(0,0)
export var flip = false
# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name)
	if flip:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	if self.name in Globals.LeverMap2D:
		var lever = Globals.LeverMap2D[self.name]
		if(Globals.LeverState[lever]):
			self.position.x = self.position.x + increment.x
			self.position.y = self.position.y + increment.y
			pass
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.play("default")

	pass
