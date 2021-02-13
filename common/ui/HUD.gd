extends CanvasLayer

signal save
signal quit

const MENU_SAVE=0
const MENU_INVENTORY=1
const MENU_QUIT=2

# Called when the node enters the scene tree for the first time.
func _ready():
	setLife(GlobalPlayer.getLife())
	setGems(GlobalPlayer.getGemsBalance())
	
	$btnBlock.visible=false
	
	$inventoryList.setItemList(GlobalPlayer.getItemsList())
	pass # Replace with function body.

func reloadGems():
	setGems(GlobalPlayer.getGemsBalance())
	
func reloadInventory():
	$inventoryList.setItemList(GlobalPlayer.getItemsList())

func setLife(life_):
	$Control/HBoxContainer/life.text=str(life_)
	
func setGems(gems_):
	$Control/HBoxContainer/gem.text=str(gems_)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	$btnBlock.visible=true
	pass # Replace with function body.


func _on_btnSave_button_down():
	emit_signal("save")	
	$btnBlock.visible=false
	pass # Replace with function body.


func _on_btnQuit_button_down():
	emit_signal("quit")
	pass # Replace with function body.


func _on_btnInventory_button_down():
	$btnBlock.visible=false
	$inventoryList.show()
