extends Node

var _filename=null
var _sceneToLoad=null


func getSceneToLoad():
	return _sceneToLoad

func create(nickname_):
	var scene='screens/tree-village/gordon-home.tscn'
	_filename=getNewFilename(nickname_)
	GlobalPlayer.setNickname(nickname_)
	GlobalPlayer.savePosition(Vector2(48,75))
	save(scene)
	loadFile(_filename)

func saveWithPosition(scene_,position_):
	GlobalPlayer.savePosition(position_)
	save(scene_)

func save(scene_):
	print("save :"+_filename)
	var gameData=getDataToSave(scene_)
	var saveFile = File.new()
	saveFile.open("user://"+_filename, File.WRITE)
	saveFile.store_line(to_json(gameData))
	saveFile.close()

func getNewFilename(nickname_):
	var filePattern=nickname_+"_"
	var newId=1
	var saveList=getList()
	for saveFile in saveList:
		if(saveFile.substr(0,nickname_.length())==nickname_):
			newId+=1
	return filePattern+str(newId)+".save"

func getFilteredSaveList(fileList_):
	var filterSaveList=[]
	for file in fileList_:
		var extension=file.right( file.length()-5 )
		if extension=='.save':
			filterSaveList.append(file)
	return filterSaveList	
	

func getList():
	var path="user://"
	var fileList=[]
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if(file_name.substr(0,1)!="."):
				fileList.append(file_name)
			file_name = dir.get_next()
		
		dir.list_dir_end()
	else:
		push_error("Erreur lors de l'access au repertoire user://")
	
	return getFilteredSaveList(fileList)

func convertObjectToSave(object_,fieldList_):
	var saveData={}
	for field in fieldList_:
		saveData[field]=object_.get(field)
	return saveData


func gotoMenu():
	get_tree().change_scene("res://screens/game/menu.tscn")


func getDataToSave(scene_):
	var gameData= {
		"scene" : scene_,
		"player":GlobalPlayer.convertToSave(),
		"scenes":GlobalScenes.convertToSave(),
	}
	return gameData
	
		
func loadFile(file_):
	_filename=file_
	var saveFilename="user://"+file_
	var saveFile = File.new()
	if not saveFile.file_exists(saveFilename):
		return # Error! We don't have a save to load.
	
	saveFile.open(saveFilename, File.READ)
	while saveFile.get_position() < saveFile.get_len():
		# Get the saved dictionary from the next line in the save file
		var saveData = parse_json(saveFile.get_line())
		for field in saveData.keys():
			if field=="scene":
				_sceneToLoad=saveData[field]
			elif field=="player":
				GlobalPlayer.loadFromSave(saveData[field])
			elif field=="scenes":
				GlobalScenes.loadFromSave(saveData[field])
		
	saveFile.close()


	

