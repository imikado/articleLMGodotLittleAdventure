extends CanvasLayer

signal movePlayer(joystickVector_)

signal pushButton
 
var joystick_speed = 0;
var joystick_angle = 0;
var joystick_vector = Vector2();


func _on_button_pushButton():
	emit_signal("pushButton")



func _on_joystickbig_moveJoystick(joystickVector_):
	emit_signal("movePlayer",joystickVector_)
	
