extends Node2D

var shopItemClass=preload("res://common/class/shopItem_class.gd")

func _ready():
	$simpleDialog.addDiscussion("Vendeur",["Bonjour Gordon","Que souhaites-tu ?"])
	$simpleDialog.addDiscussion("Gordon",["Bonjour monsieur","Je souhaiterais acheter un objet"])
	$simpleDialog.addDiscussion("Vendeur",["Je vais t’afficher les produits en vente","Tu n’auras qu’a choisir"])
	
	$shopList.setShopItemList([
		shopItemClass.new(GlobalItems.ID.WOOD_SWORD,10),
		shopItemClass.new(GlobalItems.ID.HEALTH_POTION_10,50),
	])

func _on_door_playerOpenedDoor():
	get_tree().change_scene("res://screens/tree-village.tscn")


func _on_discussionDoor_playerOpenedDoor():
	$simpleDialog.start()
	pass # Replace with function body.


func _on_simpleDialog_discussionFinished():
	$simpleDialog.end()
	$shopList.show()
	pass # Replace with function body.


func _on_discussionArea_playerOpenedDoor():
	$simpleDialog.start()
	pass # Replace with function body.
