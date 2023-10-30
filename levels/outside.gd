extends LevelParent

#var packed_level: PackedScene = preload("res://levels/inside.tscn")

func _on_gate_player_entered_inside(_body):
	var tween = create_tween()
	tween.tween_property($Player, "player_speed", 0, 0.5)
	$LevelTransition.change_scene("res://levels/inside.tscn")


func _on_garage_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.45, 0.45), 1)


func _on_garage_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.3, 0.3), 2)
