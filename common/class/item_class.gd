extends Resource

class_name item_class 

enum TYPE {WEAPON, MAGICPOTION }

var name
var description
var image
var type
var actionList

func _init(name_,description_,image_,type_,actionList_=[]):
	self.name=name_
	self.description=description_
	self.image=image_
	self.type=type_
	self.actionList=actionList_

func getTexture():
	var textureTmp=ImageTexture.new()
		
	var imageTmp= Image.new()
	imageTmp.load("res://"+image)
	textureTmp.create_from_image(imageTmp,0)
	
	return textureTmp
