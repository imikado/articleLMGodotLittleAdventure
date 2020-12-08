extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_shop_playerEntered():
	get_tree().change_scene("res://screens/tree-village/shop.tscn")
