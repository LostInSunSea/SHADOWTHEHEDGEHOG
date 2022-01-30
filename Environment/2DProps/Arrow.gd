extends Area2D


# Declare member variables here. Examples:
export var increment = Vector2(0,0)
export var flip = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if flip:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	changeLocation()
	
func changeLocation():
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

func _on_Arrow_body_entered(body):
	print("inside-------------------------------------------------------------------------------->")
	Globals.ARROWTRIGGER = true
	pass # Replace with function body.

