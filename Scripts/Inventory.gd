#Global VARIABLE Implementation
extends Node

#Reference to Player
var Player2d
var Player3d
#Inventory is a dictionary with a reference to other objects
var Items = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func addItemToInventory(var item):
	Items[item.name]=1
