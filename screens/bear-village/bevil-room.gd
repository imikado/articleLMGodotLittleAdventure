extends "res://common/class/scene.gd"


var nbBeeKilled=0
var maxNbBeeToKill=0


func debug():
	GlobalPlayer.addItem(GlobalItems.ID.WOOD_SWORD)



func _ready():
	#debug()

	setPlayerPath("playerAndControl")
	loadPosition()
	
	getPlayer().disableNavigation()
	
	startGame()
	
	$startRect/startDialog.addDiscussion("Apiculteur",[
		"Bonjour,",
		"Peux tu m'aider ?",
		"Nous avons depuis quelques jours des méchantes BeVil",
		"Qui nous empêche d'acceder à la ruche"
	])
	$startRect/startDialog.start()
	
	$startRect.visible=true
	
	$winRect/winDialog.addDiscussion("Apiculteur",[
		"Bravo,",
		"Un grand merci pour ton aide",
		"Pour te remercier, voici 4 Gems"
	])
	$winRect.visible=false
	
	

func startGame():
	getPlayer().loadCameraLimits($cameraRef)

	for node in get_children():
		if node.is_in_group("Enemy"):
			node.setPlayer(getPlayer())
			
			maxNbBeeToKill+=1



func _on_playerAndControl_hit(enemy_):
	enemy_.queue_free()
	GlobalPlayer.addXp(2)
	nbBeeKilled+=1
	$playerAndControl.reloadXp()
	
	if nbBeeKilled==maxNbBeeToKill:
		win()
	

func win():
	$winRect.visible=true
	$winRect/winDialog.start()
	
	$Camera2D.current=true
	
	$playerAndControl.disableNavigation()
	

func _on_playerAndControl_damagedBy(enemy_):
	
	enemy_.goBack()
	
	GlobalPlayer.damage(10)
	getPlayer().reloadLife()


func _on_startDialog_discussionFinished():
	$startRect/startDialog.end()
	$startRect.visible=false
	$playerAndControl.enableNavigation()
	$Camera2D.current=false
	pass # Replace with function body.


func _on_winDialog_discussionFinished():
	GlobalPlayer.addGems(4)
	
	GlobalPlayer.savePosition(Vector2(120,300))
	get_tree().change_scene("res://screens/bear-village.tscn")
