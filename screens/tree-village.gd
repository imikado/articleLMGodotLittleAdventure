extends "res://common/class/scene.gd"


func _ready():
	setPlayerPath("YSort/playerAndControl")
	loadPosition()
	getPlayer().loadCameraLimits($cameraRef)


func _on_shop_playerEntered():
	GlobalPlayer.savePosition(Vector2(48,73))
	get_tree().change_scene("res://screens/tree-village/shop.tscn")


func _on_gordonhome_playerEntered():
	GlobalPlayer.savePosition(Vector2(55,84))
	get_tree().change_scene("res://screens/tree-village/gordon-home.tscn")

func _on_gemhouse_playerEntered():
	GlobalPlayer.savePosition(Vector2(48,73))
	get_tree().change_scene("res://screens/tree-village/gem-house.tscn")
	pass # Replace with function body.


func _on_goOutFromTreeVillage_playerOpenedDoor():
	GlobalPlayer.savePosition(Vector2(293,608))
	get_tree().change_scene("res://screens/macro-map.tscn")
	pass # Replace with function body.




func _on_playerAndControl_endClimbing():
	$YSort.sort_enabled=true
	pass # Replace with function body.


func _on_playerAndControl_startClimbing():
	$YSort.sort_enabled=false
	pass # Replace with function body.
 
