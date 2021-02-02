extends "res://addons/gut/test.gd"

class TestSimpleProperties:
	extends 'res://addons/gut/test.gd'
	var Player=load("res://common/singletons/globalPlayer.gd")
	
	func test_life():
		var player=Player.new()
		player.setLife(100)
		player.damage(20)
		var lifeLeft=player.getLife()
		assert_eq(80, lifeLeft, "devrait afficher 80: 100-20")

	func test_xp():
		var player=Player.new()
		player.setXp(20)
		player.addXp(10)
		var newXp=player.getXp()
		assert_eq(30,newXp,"devrait afficher 30: 20+10")
		
		assert_eq(100,player.getLife(),"devrait etre a 100 (confirme l'isolation des tests)")

class TestLittleIntelligence:
	extends 'res://addons/gut/test.gd'
	var Player=load("res://common/singletons/globalPlayer.gd")
	
	func test_savePosition():
		var player=Player.new()
		player.savePosition(Vector2(10,50))
		var savedPosition=player.getPosition()
		assert_eq(Vector2(10,50),savedPosition)
		player.queue_free()
		
	func test_loadPosition():
		var player=Player.new()
		player.savePosition(Vector2(10,50))
		var savedPosition=player.loadPosition()
		assert_eq(Vector2(10,50),savedPosition,"devrait retourner les coord")
		var savedPositionAfterLoad=player.loadPosition()
		assert_eq(null,savedPositionAfterLoad,"devrait retourner vide")
	
	func test_shouldLoadPosition():
		var player=Player.new()
		assert_false(player.shouldLoadPosition(),"doit retourner faux car pas de position")
		player.savePosition(Vector2(10,50))	
		assert_true(player.shouldLoadPosition(),"devrait retourner vrai car une position a ete sauvée")
		player.resetPosition()
		assert_false(player.shouldLoadPosition(),"devrait retourner faux car la position a ete effacée")
		
