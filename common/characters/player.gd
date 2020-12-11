extends KinematicBody2D

var speed=100

var left=false
var right=false
var up=false
var down=false

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
	if Input.is_action_pressed("ui_left"):
		left=true
	if Input.is_action_pressed("ui_down"):
		down=true
	if Input.is_action_pressed("ui_up"):
		up=true


func processAnimation():
	var currentAnimation='walk-right'

	if up :
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
	left=false
	right=false
	up=false
	down=false
