extends "res://common/class/scene.gd"

var shopItemClass=preload("res://common/class/shopItem_class.gd")

const STEP_FIRSTTIME='first_time'
const STEP_SHOULD_FIND_GORMONSTAR='shouldFindGormonStar'
const STEP_HAS_FOUND_GORMONSTAR='hasFoundGormonStar'

func _ready():
	setPlayerPath("playerAndControl")
	loadPosition()
	getPlayer().zoomDown()
	getPlayer().loadCameraLimits($cameraRef)

	var step=GlobalScenes.getParamForSceneOr(filename,"step",STEP_FIRSTTIME)

	if step==STEP_FIRSTTIME :

		$simpleDialog.addDiscussion("Vendeur",["Bonjour Gordon","Que puis-je pour toi ?"])
		$simpleDialog.addDiscussion("Gordon",["Bonjour monsieur","Je souhaiterais gagner des gems pour acheter une épée"])
		$simpleDialog.addDiscussion("Vendeur",["Il y a des étoiles de Gormon enterrés dans notre village","Si tu m'en rapporte je te les echangerais contre une gems chacunes","Ca t'interesse ?"])
		$simpleDialog.addDiscussion("Gordon",["Oui,ça m'interesse mais comment les trouver ?"])
		$simpleDialog.addDiscussion("Vendeur",["Je vais te donner une carte et une pelle"])
		$simpleDialog.addDiscussion("Gordon",["Merci pour la pelle et la carte."])
	
		giveToPlayerSpadeAndMap()
		
		GlobalScenes.saveParamForScene(filename,"step",STEP_SHOULD_FIND_GORMONSTAR)

	elif step==STEP_SHOULD_FIND_GORMONSTAR:
		
		$simpleDialog.addDiscussion("Vendeur",["Bonjour Gordon","Tu as trouvé toutes les étoiles ?"])

		var nbGormonStarFounded=GlobalPlayer.countItem(GlobalItems.ID.GORDMON_STAR)
		
		if nbGormonStarFounded < 5:
			$simpleDialog.addDiscussion("Gordon",
			[
				"Bonjour monsieur",
				"Non pas encore, il m'en reste encore "+str((5-nbGormonStarFounded))+" à trouver"
			])
		elif nbGormonStarFounded == 5:
			$simpleDialog.addDiscussion("Gordon",
			[
				"Bonjour monsieur",
				"Oui j'ai tout trouver",
				"Les voilà"
			])
			$simpleDialog.addDiscussion("Vendeur",["Merci pour les étoiles de Gormon","Voilà tes 10 Gems"])

			GlobalPlayer.addGems(10)
			for i in range(5):
				GlobalPlayer.removeItem(GlobalItems.ID.GORDMON_STAR)
				
				GlobalScenes.saveParamForScene(filename,"step",STEP_HAS_FOUND_GORMONSTAR)
				
			getPlayer().reloadGems()
	
	elif step==STEP_HAS_FOUND_GORMONSTAR:
		$simpleDialog.addDiscussion("Vendeur",["Bonjour Gordon","Désolé je n'ai plus de mission pour toi ;)"])
	
	#debug
	
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
	getPlayer().enableNavigation()

func _on_discussionArea_playerOpenedDoor():
	$simpleDialog.start()
	getPlayer().disableNavigation()
