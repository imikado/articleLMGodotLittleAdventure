extends Node2D

var playerPath=null

func setPlayerPath(playerPath_):
	playerPath=playerPath_

func loadPosition():
	if(GlobalPlayer.shouldLoadPosition()):
		getPlayer().position=GlobalPlayer.loadPosition()
		
func getPlayer():
	return get_node(playerPath)


func _on_playerAndControl_quit():
	GlobalGame.gotoMenu()
	pass # Replace with function body.


func _on_playerAndControl_save():
	GlobalGame.saveWithPosition(filename,getPlayer().getPlayerPosition());
	pass # Replace with function body.
