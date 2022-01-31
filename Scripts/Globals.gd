#Global VARIABLE Implementation
extends Node

#Reference to Player
var Player2d
var Player3d
#Inventory is a dictionary with a reference to other objects
var Items = {}
var LeverState = {
	"L1Lever1": false,
	"L1Lever2": false
}
var PlayerState = {
	"transform": null,
	"spring_arm_transform": null
}
var LeverMap = {
	"L1Lever1": "/root/SceneManager/CurrentScene/3DLevel1/Props/L1Box1",
	"L1Lever2": "/root/SceneManager/CurrentScene/3DLevel1/Props/L1Box2"
}
var LeverMap2D = {
	"L1SBox": "L1Lever1",
	"L1LBox": "L1Lever2"
}

var SWAP3D = false
var ARROWTRIGGER = false
var DOOR_INTERACTED = false
var LEVEL_TO_LOAD = "3DLevel1"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func addItemToInventory(var item):
	Items[item.name]=1

func toggleLeverState(var lever):
	LeverState[lever] = !LeverState[lever]
	print(LeverState)
	print(LeverState[lever])
