extends KinematicBody2D

signal startClimbing
signal endClimbing

var speed=100

var left=false
var right=false
var up=false
var down=false

var useTouch=false

var startClimbing=false
var onScale=false
var isClimbing=false

func enableCamera():
	$Camera2D.current=true

func disableCamera():
	$Camera2D.current=false
	

func _ready():
	add_to_group("Player")


func _process(delta):
	
	pocessInput()
	
	var velocity = Vector2()  # The player's movement vector.
	
	if left:
		velocity.x -= 1
	elif right:
		velocity.x += 1
	elif up:
		velocity.y -= 1	
	elif down:
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
		
	move_and_slide(velocity)
	
	processAnimation()
	
	resetKeys()


func pocessInput():
	if Input.is_action_pressed("ui_right"):
		right=true
		useTouch=false
	if Input.is_action_pressed("ui_left"):
		left=true
		useTouch=false
	if Input.is_action_pressed("ui_down"):
		down=true
		useTouch=false
	if Input.is_action_pressed("ui_up"):
		up=true
		useTouch=false


func processAnimation():
	var currentAnimation='walk-right'
	
	if startClimbing:
		currentAnimation='climbing'
	elif up :
		currentAnimation='walk-up'
		$AnimatedSprite.flip_h=true
	elif down :
		currentAnimation='walk-down'
		$AnimatedSprite.flip_h=false
	elif left:
		$AnimatedSprite.flip_h=true

	elif right:
		$AnimatedSprite.flip_h=false
	else:
		currentAnimation='idle'

	playAnimation(currentAnimation)


func playAnimation(anim):
	$AnimatedSprite.play(anim)
	$AnimatedSprite.play()


func resetKeys():
	if useTouch:
		return
		
	left=false
	right=false
	up=false
	down=false


func _on_navigation_movePlayer(joystickVector_):
	useTouch=true
	
	right=false
	left=false
	down=false
	up=false	
	
	if abs(joystickVector_.x)>abs(joystickVector_.y) :
	
		if(joystickVector_.x > 10):
			right=true
		elif(joystickVector_.x < -10):
			left=true
	 
	else:
				
		if(joystickVector_.y > 10):
			down=true
		elif(joystickVector_.y < -10):
			up=true


func _on_gordonhome_playerStartClimbing():
	startClimbing=true
	emit_signal("startClimbing")

func _on_gordonhome_playerOnScale():
	onScale=true

func _on_gordonhome_playerLeaveScale():
	onScale=false

func _on_gordonhome_playerEndClimbing():
	if !onScale:
		startClimbing=false
		emit_signal("endClimbing")
