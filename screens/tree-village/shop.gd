extends Node2D

var itemClass=preload("res://common/class/item_class.gd")
var shopItemClass=preload("res://common/class/shopItem_class.gd")
var attackClass=preload("res://common/class/item/attack_class.gd")
var potionClass=preload("res://common/class/item/potion_class.gd")


func _ready():
	$simpleDialog.addDiscussion("Vendeur",["Bonjour Gordon","Que souhaites-tu ?"])
	$simpleDialog.addDiscussion("Gordon",["Bonjour monsieur","Je souhaiterais acheter un objet"])
	$simpleDialog.addDiscussion("Vendeur",["Je vais t’afficher les produits en vente","Tu n’auras qu’a choisir"])
	
	$shopList.setShopItemList([
		shopItemClass.new(itemClass.new(
			"Epée en bois",
			"Une simple épée en bois de hêtre",
			"common/items/weapons/wood-sword.png",
			itemClass.TYPE.WEAPON,
			[
				attackClass.new(
					"Attaque simple",
					"attack_wood-sword_simple",
					10,
					0
				),
				attackClass.new(
					"Attaque avancée",
					"attack_wood-sword_advanced",
					20,
					10
				),
				attackClass.new(
					"Attaque en feu",
					"attack_wood-sword_onfire",
					50,
					50
				)
			]),10),
		shopItemClass.new(itemClass.new(
				"Potion de santé",
				"Une potion de santé qui donne 10 points de vie.",
				"common/items/magicpotion/magic-potion.png",
				itemClass.typeList.MAGICPOTION,
				[	
					potionClass.new("increaseLife",10)
				]
				),50),
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
