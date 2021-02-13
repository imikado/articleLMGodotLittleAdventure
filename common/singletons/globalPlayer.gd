extends Node

var simpleFieldToSaveList=["gems","xp","life","maxLife","nickname","itemsList","equipment"]

var position=null
var itemsList=[]

var gems=10
var xp=0
var life=100
var maxLife=100
var nickname=null
var equipment=null

#---nickname
func setNickname(nickname_):
	nickname=nickname_

func getNickname():
	return nickname

#---equipment
func setEquipment(item_):
	equipment=item_
	
func getEquipment():
	return equipment
	
func hasEquipment():
	if equipment==null:
		return false
	else:
		return true

#--life
func setLife(life_):
	life=life_

func getLife():
	return life

func getMaxLife():
	return maxLife
	
func damage(damage_):
	life-=damage_
	
#--xp
func setXp(xp_):
	xp=xp_

func getXp():
	return xp

func addXp(xp_):
	xp+=xp_

#--position
func savePosition(newPosition_):
	position=newPosition_

func loadPosition():
	var savedPosition=position
	resetPosition()
	return savedPosition
	
func getPosition():
	return position

func resetPosition():
	position=null

func shouldLoadPosition():
	if(position!=null):
		return true
	else:
		return false

#--gems
func addGems(value_):
	putGems(value_)
	
func putGems(value_):
	gems+=value_
	
func spendGems(value_):
	if(value_<=gems):
		gems-=value_
		
func getGemsBalance():
	return gems
	
func canSpendGems(price_):
	if(price_<=gems):
		return true
	return false

#--items
func hasItem(itemId_):
	return itemsList.has(itemId_)
	
func addItemIfNotExist(itemId_):
	if !hasItem(itemId_):
		addItem(itemId_)
		
func addItem(itemId_):
	itemsList.append(itemId_)
	
func getItemsList():
	return itemsList
	
func getAttackList():
	var attackFilteredList=[]
	for itemId in getItemsList():
		var realItem=GlobalItems.getItem(itemId)
		if realItem.type==item_class.TYPE.WEAPON:
			for attack in realItem.actionList:
				if xp >= attack.xpMin:
					attackFilteredList.append(attack)
			
	return attackFilteredList
	
func loadFromSave(data_):
	for field in simpleFieldToSaveList:
		if data_.has(field):
			set(field,data_[field])
	position=Vector2(data_.position[0],data_.position[1])
	pass

func convertToSave():
	var saveData=GlobalGame.convertObjectToSave(self,simpleFieldToSaveList)
	
	saveData.position=[position.x,position.y]	

	return saveData
