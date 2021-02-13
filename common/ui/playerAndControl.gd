extends Node2D


signal save
signal quit

signal startClimbing
signal endClimbing

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func getPlayerPosition():
	return $player.global_position

func reloadGems():
	$HUD.reloadGems()

func zoomDown():
	$player.zoomDown()
	
func zoomUp():
	$player.zoomUp();
	
func loadCameraLimits(cameraRef_):
	$player.loadCameraLimits(cameraRef_)


func _on_shopList_buyItem(item_):
	$HUD.reloadGems()
	$HUD.reloadInventory()
	pass # Replace with function body.


func _on_HUD_save():
	emit_signal("save")
	pass # Replace with function body.


func _on_HUD_quit():
	emit_signal("quit")
	pass # Replace with function body.


func _on_player_startClimbing():
	emit_signal("startClimbing")
	pass # Replace with function body.


func _on_player_endClimbing():
	emit_signal("endClimbing")
	pass # Replace with function body.


func _on_gordonhome_playerLeaveScale():
	$player._on_gordonhome_playerLeaveScale()
	pass # Replace with function body.


func _on_gordonhome_playerOnScale():
	$player._on_gordonhome_playerOnScale()
	pass # Replace with function body.


func _on_gordonhome_playerStartClimbing():
	$player._on_gordonhome_playerStartClimbing()
	pass # Replace with function body.
