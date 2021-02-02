extends CanvasLayer

signal save
signal quit

const ITEM_SAVE=0
const ITEM_QUIT=1

# Called when the node enters the scene tree for the first time.
func _ready():
	setLife(GlobalPlayer.getLife())
	setGems(GlobalPlayer.getGemsBalance())
	pass # Replace with function body.

func setLife(life_):
	$Control/HBoxContainer/life.text=str(life_)
	
func setGems(gems_):
	$Control/HBoxContainer/gem.text=str(gems_)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_down():
	$Control/HBoxContainer/PopupMenu.popup()
	pass # Replace with function body.


func _on_PopupMenu_id_pressed(id):
	var actionSelected=$Control/HBoxContainer/PopupMenu.get_current_index()
	if actionSelected==ITEM_SAVE:
		emit_signal("save")
	elif actionSelected==ITEM_QUIT:
		emit_signal("quit")
		
