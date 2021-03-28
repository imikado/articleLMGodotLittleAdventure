extends Node2D

var honeyReceived=0

func getPlayer():
	return $"bear-platform"

# Called when the node enters the scene tree for the first time.
func _ready():
	$gameOver.visible=false
	getPlayer().loadCameraLimits($cameraRef)
	getPlayer().enableCamera()
	
	$startDialog.addDiscussion("Apiculteur",[
		"Bonjour,",
		"Peux-tu m'aider à récuperer mon miel  ?",
		"Il te faudra aller à la ruche et me ramener mes 3 sceaux"
	])
	$startDialog.start()
	
	disableNavigation()
	
	$winDialog.addDiscussion("Apiculteur",
	[
		"Bravo,",
		"Merci beaucoup",
		"Voila 4 gems pour te remercier"
	])
	

func enableNavigation():
	$navigation.enable()
	$navigation.enableButton()

func disableNavigation():
	$navigation.disable()
	


func playerPickedHoney(honey_):
	honey_.queue_free()
	getPlayer().fill()


func _on_honey_playerPickHoney(obj_):
	playerPickedHoney(obj_)



func _on_honey2_playerPickHoney(obj_):
	playerPickedHoney(obj_)


func _on_honey3_playerPickHoney(obj_):
	playerPickedHoney(obj_)


func _on_exitDoor_playerOpenedDoor():
	goBackToVillage()	


func _on_bearAsking_playerOpenedDoor():
	if getPlayer().isFilled():
		honeyReceived+=1
		
		get_node("bearAsking/honney"+str(honeyReceived)).visible=true
		getPlayer().empty()
		
		if honeyReceived > 3:
			$winDialog.start()
			$navigation.disable()
		


func _on_startDialog_discussionFinished():
	$startDialog.end()
	enableNavigation()


func _on_winDialog_discussionFinished():
	$winDialog.end()
	GlobalPlayer.addGems(4)
	goBackToVillage()	
	
func goBackToVillage():
	GlobalPlayer.savePosition(Vector2(341,419))
	get_tree().change_scene("res://screens/bear-village.tscn")



func _on_fall_body_shape_entered(body_id, body, body_shape, area_shape):
	print ("tombe")
	if body.is_in_group("Player"):
		$gameOver.visible=true
		$gameOver/Camera2D.current=true


func _on_Button_button_down():
	$gameOver.visible=false
	$gameOver/Camera2D.current=false
	get_tree().reload_current_scene()
