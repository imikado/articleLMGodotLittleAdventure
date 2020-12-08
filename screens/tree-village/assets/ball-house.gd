extends StaticBody2D

signal playerEntered

func _ready():
	pass # Replace with function body.

func _on_door_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.is_in_group("Player"):
		emit_signal("playerEntered")
