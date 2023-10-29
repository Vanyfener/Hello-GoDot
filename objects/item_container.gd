extends StaticBody2D
class_name ItemContainer

var is_opened: bool = false

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal open(pos, direction)


func hit():
	pass

