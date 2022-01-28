extends KinematicBody2D


# Declare member variables here. Examples:
export var move_speed := 450
export var jump_speed := 750
export var gravity := 2000

var velocity = Vector2.ZERO	

# Called when the node enters the scene tree for the first time.
func _ready():
	Inventory.Player2d = self
	
func _process(delta):
	animation_controller()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = 0
	
	#vertical velocity
	if Input.is_action_pressed("right"):
		velocity.x += move_speed
	if Input.is_action_pressed("left"):
		velocity.x -= move_speed
	#jump
	if Input.is_action_pressed("up"):
		if is_on_floor():
			velocity.y = -jump_speed
	if Input.is_action_pressed("interact"):
		print(Inventory.Items)
	
	#apply gravity 
	velocity.y += gravity * delta
	
	#move player
	velocity = move_and_slide(velocity, Vector2.UP)

func animation_controller():
	# face left or right
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite.flip_h = true
	
	if velocity.y < 0:
		$AnimatedSprite.play("Jumping")
	else:
		if velocity.x != 0:
			$AnimatedSprite.play("Walking")
		else:
			$AnimatedSprite.play("Idle")
