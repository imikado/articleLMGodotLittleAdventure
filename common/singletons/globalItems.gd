extends Node

var itemClass=preload("res://common/class/item_class.gd")
var attackClass=preload("res://common/class/item/attack_class.gd")
var potionClass=preload("res://common/class/item/potion_class.gd")

enum ID {
	WOOD_SWORD, 
	HEALTH_POTION_10
	}

var itemList={
	
	ID.WOOD_SWORD:itemClass.new(
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
		]
	),
	ID.HEALTH_POTION_10:itemClass.new(
		"Potion de santé",
		"Une potion de santé qui donne 10 points de vie.",
		"common/items/magicpotion/magic-potion.png",
		itemClass.TYPE.MAGICPOTION,
		[	
			potionClass.new("increaseLife",10)
		]
	)
}

func getItem(key_):
	return itemList[key_]
	
	


