extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400
export var gravity = 2000

var velocity = Vector2.ZERO	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#reset horizontal velocity
	velocity.x = 0
	
	#set horizontal velocity
	if (Input.is_action_pressed("right")):
		velocity.x += speed
	elif (Input.is_action_pressed("left")):
		velocity.x -= speed
	
	# apply gravity
	velocity.y += gravity * delta
	
	#check for animation
	if(velocity.length()>0):
		velocity = velocity.normalized() * speed
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
