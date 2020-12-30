extends CanvasLayer

signal leave
signal attack(attack_)

func _ready():
	$attackList.visible=false
	build()

func show():
	$buttonList.visible=true

func hide():
	$buttonList.visible=false

func build():
	for attack in GlobalPlayer.getAttackList():
		var buttonTmp=Button.new()
		buttonTmp.text=attack.name
		
		buttonTmp.connect("button_down",self,"_on_attack_pressed",[attack])
		
		$attackList.add_child(buttonTmp)

func _on_leaveButton_pressed():
	emit_signal("leave")


func _on_attackButton_pressed():
	$attackList.visible=true
	
func _on_attack_pressed(attack_):
	emit_signal("attack",attack_)
	$attackList.visible=false
		
