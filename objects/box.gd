extends ItemContainer

func hit():
	$LidSprite.hide()
	var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count())
	open.emit(pos, current_direction)
