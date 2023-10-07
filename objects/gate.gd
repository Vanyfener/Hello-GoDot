extends StaticBody2D

signal player_entered_inside(body)

func _on_area_2d_body_entered(body):
	player_entered_inside.emit(body)
	
