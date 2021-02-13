extends "res://common/class/scene.gd"


func _ready():
	setPlayerPath("playerAndControl")
	loadPosition()
	getPlayer().zoomUp()
	getPlayer().loadCameraLimits($cameraRef)

func _on_spiderattack_playerOpenedDoor():
	
	GlobalPlayer.savePosition(getPlayer().getPlayerPosition())
	get_tree().change_scene("res://screens/macro-map/spiderFight.tscn")
	pass # Replace with function body.


func _on_crabvillage_playerOpenedDoor():
	#get_tree().change_scene()
	pass # Replace with function body.


func _on_treevillage2_playerOpenedDoor():
	GlobalPlayer.savePosition(Vector2(900,258))
	get_tree().change_scene("res://screens/tree-village.tscn")
	pass # Replace with function body.
