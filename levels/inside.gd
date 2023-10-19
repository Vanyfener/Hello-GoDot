extends LevelParent

#var packed_level: PackedScene = preload("res://levels/outside.tscn")

func _on_gate_player_entered_inside(_body):
	var tween = create_tween()
	tween.tween_property($Player, "player_speed", 0, 0.5)
	$LevelTransition.change_scene("res://levels/outside.tscn")
