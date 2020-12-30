extends Node2D

func getPlayer():
	return $YSort/player

func _ready():
	if(GlobalPlayer.shouldLoadPosition()):
		getPlayer().position=GlobalPlayer.loadPosition()

func _on_shop_playerEntered():
	var PositionToSave=getPlayer().position
	PositionToSave.y+=10
	GlobalPlayer.savePosition(PositionToSave)
	get_tree().change_scene("res://screens/tree-village/shop.tscn")
