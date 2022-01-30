extends KinematicBody

signal interact()

export var move_speed := 7.0
export var jump_impulse := 11.0
export var gravity := 50.0
export var height := 1.5
export var interact_distance := 4.0

var velocity := Vector3.ZERO
var snap_vector := Vector3.DOWN

onready var _spring_arm: SpringArm = get_node("CameraArm")
onready var _interact_raycast: RayCast = get_node("CameraArm/Camera/InteractRaycast")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact():
	var other = _interact_raycast.get_collider()
	if _check_raycast() and other.is_in_group("Interactive"):
		other.interact()
		# emit_signal("interact", other)

func _check_raycast():
	if _interact_raycast:
		var distance = (_interact_raycast.get_collision_point() - _spring_arm.transform.origin).length()
		var other = _interact_raycast.get_collider()
		if _interact_raycast.is_colliding() and distance < interact_distance:
			return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_spring_arm.translation = translation
	_spring_arm.translation.y += height # Raise to the height of the player's eyes
	
	var other = _interact_raycast.get_collider()
	if _check_raycast():
		
	
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("interact"):
		print("Interacting from player")
		interact()
	pass

# Called on physics update
func _physics_process(delta):
	var move_direction := Vector3.ZERO
	move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	move_direction.z = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_direction = move_direction.rotated(Vector3.UP, _spring_arm.rotation.y).normalized()
	
	velocity.x = move_direction.x * move_speed
	velocity.z = move_direction.z * move_speed
	velocity.y -= gravity * delta
	
	var just_landed := is_on_floor() and snap_vector == Vector3.ZERO
	var is_jumping := is_on_floor() and Input.is_action_just_pressed("jump")
	if is_jumping:
		velocity.y = jump_impulse
		snap_vector = Vector3.ZERO
	elif just_landed:
		snap_vector = Vector3.DOWN
	velocity = move_and_slide_with_snap(velocity, snap_vector, Vector3.UP, true)
