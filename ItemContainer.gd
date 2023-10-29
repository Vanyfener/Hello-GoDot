extends ItemContainer


func hit():
	if !is_opened:
		$LidSprite.hide()
		for i in range(0, 3):
			var spawn_positions_amount = randi()%$SpawnPositions.get_child_count()
			var pos = $SpawnPositions.get_child(spawn_positions_amount).global_position
			open.emit(pos, current_direction)
		is_opened = true
