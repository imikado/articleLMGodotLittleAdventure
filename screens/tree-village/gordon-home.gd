extends Node2D


func getPlayer():
	return $player

func _ready():
	if(GlobalPlayer.shouldLoadPosition()):
		getPlayer().position=GlobalPlayer.loadPosition()


func _on_HUD_save():
	GlobalGame.saveWithPosition(filename,getPlayer().position);
	pass # Replace with function body.


func _on_HUD_quit():
	get_tree().change_scene("res://screens/menu.tscn")
	pass # Replace with function body.


func _on_door_playerOpenedDoor():
	get_tree().change_scene("res://screens/tree-village.tscn")
	pass # Replace with function body.
