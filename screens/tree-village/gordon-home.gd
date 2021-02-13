extends "res://common/class/scene.gd"


func _ready():
	setPlayerPath("YSort/playerAndControl")
	loadPosition()
	getPlayer().zoomDown()
	getPlayer().loadCameraLimits($cameraRef)


func _on_door_playerOpenedDoor():
	GlobalPlayer.savePosition(Vector2(436,160))
	get_tree().change_scene("res://screens/tree-village.tscn")
	pass # Replace with function body.
