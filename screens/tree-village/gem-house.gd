extends "res://common/class/scene.gd"

var shopItemClass=preload("res://common/class/shopItem_class.gd")

func _ready():
	setPlayerPath("playerAndControl")
	loadPosition()
	getPlayer().zoomDown()
	getPlayer().loadCameraLimits($cameraRef)

	$simpleDialog.addDiscussion("Vendeur",["Bonjour Gordon","Que puis-je pour toi ?"])
	$simpleDialog.addDiscussion("Gordon",["Bonjour monsieur","Je souhaiterais gagner des gems pour acheter une épée"])
	$simpleDialog.addDiscussion("Vendeur",["Il y a des étoiles de Gormon enterrés dans notre village","Si tu m'en rapporte je te les echangerais contre une gems chacunes","Ca t'interesse ?"])
	$simpleDialog.addDiscussion("Gordon",["Oui,ça m'interesse mais comment les trouver ?"])
	$simpleDialog.addDiscussion("Vendeur",["Je vais te donner une carte et une pelle"])
	
	

func _on_door_playerOpenedDoor():
	GlobalPlayer.savePosition(Vector2(651,115))
	get_tree().change_scene("res://screens/tree-village.tscn")


func _on_discussionDoor_playerOpenedDoor():
	$simpleDialog.start()
	pass # Replace with function body.

func giveToPlayerSpadeAndMap():
	GlobalPlayer.addItemIfNotExist(GlobalItems.ID.SPADE)
	GlobalPlayer.addItemIfNotExist(GlobalItems.ID.GORMON_STAR_MAP)

func _on_simpleDialog_discussionFinished():
	$simpleDialog.end()
	
	giveToPlayerSpadeAndMap()


func _on_discussionArea_playerOpenedDoor():
	$simpleDialog.start()
	pass # Replace with function body.

