#Global VARIABLE Implementation
extends Node

#Reference to Player
var Player2d
var Player3d
#Inventory is a dictionary with a reference to other objects
var Items = {}
var LeverState = {}
var PlayerState = {
	"transform": null,
	"spring_arm_transform": null
}
var LeverMap = {
	"L1Lever1": {
		"2DProp": "",
		"3DProp": "L1Box1"
	}
}
var SWAP3D = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func addItemToInventory(var item):
	Items[item.name]=1

func toggleLeverState(var lever):
	LeverState[lever.name] = !LeverState[lever.name]
	print(LeverState)
	print(LeverState[lever.name])
