extends LevelParent

#var packed_level: PackedScene = preload("res://levels/outside.tscn")

func _on_gate_player_entered_inside(_body):
#	var tween = get_tree().create_tween()
#	tween.tween_property($Player, "player_speed", 0, 0.5)
	get_tree().change_scene_to_file("res://levels/outside.tscn")
#	get_tree().change_scene_to_packed(packed_level)
