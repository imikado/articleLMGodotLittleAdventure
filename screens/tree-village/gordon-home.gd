extends "res://common/class/scene.gd"


func _ready():
	setPlayerPath("YSort/playerAndControl")
	loadPosition()
	getPlayer().zoomDown()
	getPlayer().loadCameraLimits($cameraRef)
	
	$simpleDialog.addDiscussion("Maman de Gordon",["Bonjour Gordon"])
	$simpleDialog.addDiscussion("Gordon",["Bonjour Maman, comment vas papa ?"])
	$simpleDialog.addDiscussion("Maman de Gordon",["Il est encore mal au point",
	"Depuis la tempête qui a ravagé le puit..",
	"Je continue de le soigner..",
	"Le problème c'est qu'en son absence,",
	"personne ne peut aider notre artisan,",
	"a réparer notre unique puit",
	"ce qui nous embête au quotidien.."])


func _on_door_playerOpenedDoor():
	GlobalPlayer.savePosition(Vector2(436,160))
	get_tree().change_scene("res://screens/tree-village.tscn")
	pass # Replace with function body.


func _on_mom_talk():
	$simpleDialog.start()
	getPlayer().disableNavigation()


func _on_simpleDialog_discussionFinished():
	$simpleDialog.end()
	getPlayer().enableNavigation()
