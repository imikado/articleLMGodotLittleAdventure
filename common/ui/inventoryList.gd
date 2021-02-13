extends CanvasLayer

signal buyItem(item_)

var itemList=[]

var itemClass=preload("res://common/class/item_class.gd")


var patternItem=null

func _ready():
	getWindow().visible=false
	getSideInfo().visible=false

#access
func getWindow():
	return $window
	
func getGrid():
	return $window/HBoxContainer/GridContainer

func getSideInfo():
	return $window/HBoxContainer/sideInfo

func getEquipButton():
	return getSideInfo().get_node("equipButton")
	
func getDisplayButton():
	return getSideInfo().get_node("displayButton")
	
func setItemList(itemList_):
	itemList=itemList_
	pass
	
func hide():
	getWindow().visible=false
	
func show():
	getWindow().visible=true
	if patternItem==null:
		var exampleItem=getGrid().get_node("item")
		patternItem=exampleItem.duplicate()
		exampleItem.queue_free()
	
		for item in itemList:
			var realItem=GlobalItems.getItem(item)
			var newItem=patternItem.duplicate()
			newItem.setImage(realItem.getTexture())
			newItem.connect("button_down",self,"_on_pressed_selected",[item])
		
			getGrid().add_child(newItem)

func _on_pressed_selected(item_):
	var realItem=GlobalItems.getItem(item_)
	getSideInfo().visible=true
	getSideInfo().get_node("title").text=realItem.name
	getSideInfo().get_node("description").text=realItem.description


	var equipButton=getEquipButton()
	equipButton.connect("button_down",self,"_on_pressed_equip",[item_])

	var displayButton=getDisplayButton()
	displayButton.connect("button_down",self,"_on_pressed_display",[item_])


	if realItem.type==itemClass.TYPE.TOOL:
		equipButton.visible=true
	else:
		equipButton.visible=false
		
	if realItem.type==itemClass.TYPE.MAP:
		displayButton.visible=true
	else:
		displayButton.visible=false
	
		
func _on_pressed_equip(item_):
	GlobalPlayer.setEquipment(item_)

func _on_pressed_display(item_):
	#display map zoomed
	pass

func _on_closeButton_pressed():
	getWindow().visible=false

