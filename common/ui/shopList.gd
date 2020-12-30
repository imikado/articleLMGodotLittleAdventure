extends CanvasLayer

signal buyItem(item_)

var shopItemList=[]

var itemClass=preload("res://common/class/item_class.gd")
var shopItemClass=preload("res://common/class/shopItem_class.gd")

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

func getBuyButton():
	return getSideInfo().get_node("buyButton")
	
func setShopItemList(shopItemList_):
	shopItemList=shopItemList_
	pass
	
func hide():
	getWindow().visible=false
	
func show():
	getWindow().visible=true
	if patternItem==null:
		var exampleItem=getGrid().get_node("item")
		patternItem=exampleItem.duplicate()
		exampleItem.queue_free()
	
		for shopItem in shopItemList:
			var newItem=patternItem.duplicate()
			newItem.setImage(shopItem.item.getTexture())
			newItem.connect("button_down",self,"_on_pressed_selected",[shopItem])
		
			getGrid().add_child(newItem)

func _on_pressed_selected(shopItem_):
	getSideInfo().visible=true
	getSideInfo().get_node("title").text=shopItem_.item.name
	getSideInfo().get_node("description").text=shopItem_.item.description
	getSideInfo().get_node("HBoxContainer/price").text=str(shopItem_.price)

	var buyButton=getBuyButton()
	buyButton.connect("button_down",self,"_on_pressed_buy",[shopItem_])

	if GlobalPlayer.canSpendGems(shopItem_.price):
		buyButton.disabled=false
	else:
		buyButton.disabled=true
		
func _on_pressed_buy(shopItem_):
	GlobalPlayer.spendGems(shopItem_.price)
	GlobalPlayer.addItem(shopItem_.item)
	emit_signal("buyItem",shopItem_.item)


func _on_closeButton_pressed():
	getWindow().visible=false

