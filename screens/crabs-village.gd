extends "res://common/class/scene.gd"

func _ready():
	setPlayerPath("YSort/playerAndControl")
	loadPosition()
	getPlayer().loadCameraLimits($cameraRef)

	$simpleDialog.addDiscussion("Habitant",[
		"Bonjour jeune inconnu"
	])
	$simpleDialog.addDiscussion("Gordon",
	["Bonjour,",
	"Il me faudrait des clous",
	"Pour réparer notre puit"])
	$simpleDialog.addDiscussion("Habitant",
	["Tu es au bon endroit,",
	"Remporte les 2 épreuves",
	"Il te donneront un jeton",
	"Que tu pourras échanger",
	"Dans la boutique"])


func _on_welcomeboy_talk():
	$simpleDialog.start()
	getPlayer().disableNavigation()


func _on_simpleDialog_discussionFinished():
	$simpleDialog.end()
	getPlayer().enableNavigation()


func _on_goToMacroMap_playerOpenedDoor():
	GlobalPlayer.savePosition(Vector2(427,61))
	get_tree().change_scene("res://screens/macro-map.tscn")


func _on_shop_entered():
	get_tree().change_scene("res://screens/crabs-village/shop.tscn")


func _on_game1_entered():
	get_tree().change_scene("res://screens/crabs-village/game1-room.tscn")


func _on_game2_entered():
	get_tree().change_scene("res://screens/crabs-village/game2-room.tscn")


func _on_game3_entered():
	get_tree().change_scene("res://screens/crabs-village/game3-room.tscn")
