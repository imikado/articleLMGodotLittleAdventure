extends "res://common/class/scene.gd"

var groundFounded=null


func debug():
	GlobalPlayer.addItem(GlobalItems.ID.NAILS)
	GlobalPlayer.addItem(GlobalItems.ID.HONEY)
	GlobalPlayer.addItem(GlobalItems.ID.BUCKET)
	
	#$YSort/well.repair()
	#$YSort/craftsman.visible=false

func _ready():
	setPlayerPath("YSort/playerAndControl")
	loadPosition()
	getPlayer().loadCameraLimits($cameraRef)

	#debug()

	
	if true==GlobalScenes.getParamForSceneOr(filename,'ground.isDiscovered',false):
		$ground.enableDiscovered()
	
	if true==GlobalScenes.getParamForSceneOr(filename,'ground2.isDiscovered',false):
		$ground2.enableDiscovered()
	
	if true==GlobalScenes.getParamForSceneOr(filename,'ground3.isDiscovered',false):
		$ground3.enableDiscovered()
	
	if true==GlobalScenes.getParamForSceneOr(filename,'ground4.isDiscovered',false):
		$ground4.enableDiscovered()
	
	if true==GlobalScenes.getParamForSceneOr(filename,'ground5.isDiscovered',false):
		$ground5.enableDiscovered()
	
	if GlobalPlayer.hasItem(GlobalItems.ID.NAILS) and GlobalPlayer.hasItem(GlobalItems.ID.HONEY) and GlobalPlayer.hasItem(GlobalItems.ID.BUCKET) :
		
		$simpleDialog.addDiscussion("Artisan",["Bonjour Gordon","Tu peux m'aider à réparer le puit ?"])
		$simpleDialog.addDiscussion("Gordon",[
			"Oui je pense, j'ai",
			"- vos clous,",
			"- le miel pour sceller les pierres",
			"- et un nouveau seau :)"
		])
		$simpleDialog.addDiscussion("Artisan",["Félicitations Gordon","Je vais pouvoir réparer"])
	
	elif GlobalPlayer.hasItem(GlobalItems.ID.NAILS) or GlobalPlayer.hasItem(GlobalItems.ID.HONEY) or GlobalPlayer.hasItem(GlobalItems.ID.BUCKET) :
		$simpleDialog.addDiscussion("Artisan",["Bonjour Gordon","Tu peux m'aider à réparer le puit ?"])
		$simpleDialog.addDiscussion("Gordon",[
			"Bonjour",
			"Oui je pense, mais il me manque encore des objets",
			"Il me manque"
			
		])

		var missingItem=[]
		if !GlobalPlayer.hasItem(GlobalItems.ID.NAILS):
			missingItem.append("- les clous")
		if !GlobalPlayer.hasItem(GlobalItems.ID.HONEY):
			missingItem.append("- le miel pour sceller les pierres")
		if !GlobalPlayer.hasItem(GlobalItems.ID.BUCKET):
			missingItem.append("- le nouveau seau")
					
		$simpleDialog.addDiscussion("Gordon",missingItem)

	else:
		
		$simpleDialog.addDiscussion("Artisan",["Bonjour Gordon","Tu peux m'aider à réparer le puit ?"])
		$simpleDialog.addDiscussion("Gordon",["Bonjour monsieur","Oui bien sûr, comment ?"])
		$simpleDialog.addDiscussion("Artisan",[
				"Il me faudrait de quoi sceller les pierres,",
				" des clous pour refixer l'armature en bois,",
				" et un nouveau seau"])
		$simpleDialog.addDiscussion("Gordon",["Ou puis-je trouver ça ?"])
		$simpleDialog.addDiscussion("Artisan",[
				"Tu devras parcourir les différents villages autour de nous",
				" mais fais attention,",
				" des danger guête nos forêts.."])
	
	

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



func _on_playerAndControl_startClimbing():
	$YSort.sort_enabled=false

 


func _on_playerAndControl_digging():
	if groundFounded!=null:
		groundFounded.play()
		print("play ground")
	pass # Replace with function body.

func _on_playerAndControl_endDigging():
	if groundFounded!=null:
		groundFounded.stop()
	pass # Replace with function body.

#--- grounds
func processGormonStarFounded(grounded_):
	$notification.display("Une étoile de Gormon trouvée !!")
	GlobalPlayer.addItem(GlobalItems.ID.GORDMON_STAR)
	$YSort/playerAndControl.reloadInvetory()
	
	GlobalScenes.saveParamForScene(filename,grounded_+".isDiscovered",true)
	

func processGroundedLeft():
	groundFounded.stop()
	groundFounded=null

#ground
func _on_ground_isDiscovered():
	processGormonStarFounded("ground")
	
func _on_ground_rightGroundFounded():
	groundFounded=$ground

func _on_ground_rightGroundFoundedLeft():
	processGroundedLeft()

#ground2
func _on_ground2_isDiscovered():
	processGormonStarFounded("ground2")

func _on_ground2_rightGroundFounded():
	groundFounded=$ground2

func _on_ground2_rightGroundFoundedLeft():
	processGroundedLeft()

#ground3
func _on_ground3_isDiscovered():
	processGormonStarFounded("ground3")

func _on_ground3_rightGroundFounded():
	groundFounded=$ground3

func _on_ground3_rightGroundFoundedLeft():
	processGroundedLeft()

#ground4
func _on_ground4_isDiscovered():
	processGormonStarFounded("ground4")

func _on_ground4_rightGroundFounded():
	groundFounded=$ground4

func _on_ground4_rightGroundFoundedLeft():
	processGroundedLeft()

#ground5
func _on_ground5_isDiscovered():
	processGormonStarFounded("ground5")

func _on_ground5_rightGroundFounded():
	groundFounded=$ground5

func _on_ground5_rightGroundFoundedLeft():
	processGroundedLeft()


#func _on_craftsman_talk():
	#$simpleDialog.start()
	#getPlayer().disableNavigation()
	

func _on_simpleDialog_discussionFinished():
	$simpleDialog.end()
	getPlayer().enableNavigation()

	if GlobalPlayer.hasItem(GlobalItems.ID.NAILS) and GlobalPlayer.hasItem(GlobalItems.ID.HONEY) and GlobalPlayer.hasItem(GlobalItems.ID.BUCKET) :
		$YSort/well.repair()



func _on_well_talk():
	$simpleDialog.start()
	getPlayer().disableNavigation()
