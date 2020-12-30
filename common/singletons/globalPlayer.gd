extends Node

var position=null
var gems=0
var itemsList=[]
var xp=0
var life=100
var maxLife=100

#--life
func getLife():
	return life

func getMaxLife():
	return maxLife
	
func damage(damage_):
	life-=damage_
	
#--xp
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

func resetPosition():
	position=null

func shouldLoadPosition():
	if(position!=null):
		return true
	else:
		return false

#--gems
func putGems(value_):
	gems+=value_
	
func spendGems(value_):
	if(value_<gems):
		gems+=value_
		
func getGemsBalance():
	return gems
	
func canSpendGems(price_):
	if(price_<=gems):
		return true
	return false
	
func addItem(item:item_class):
	itemsList.append(item)
	
func getItemsList():
	return itemsList
	
func getAttackList():
	var attackFilteredList=[]
	for item in getItemsList():
		if item.type==item_class.TYPE.WEAPON:
			for attack in item.actionList:
				if xp >= attack.xpMin:
					attackFilteredList.append(attack)
			
	return attackFilteredList
