extends Node

signal update_laser_ammo_amount()
signal update_grenade_amount()
signal update_health_amount()

var player_position: Vector2

var laser_ammo_amount = 60:
	get:
		return laser_ammo_amount
	set(value):
		laser_ammo_amount = value
		update_laser_ammo_amount.emit()


var grenade_amount = 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		update_grenade_amount.emit()

var is_player_able_to_take_damage: bool = true
var health = 33:
	get:
		return health
	set(value):
		if value > health:
			health = min(value, 100)
		else: 
			if is_player_able_to_take_damage:
				health = value
				is_player_able_to_take_damage = false
				player_damage_ability()
		update_health_amount.emit()


func player_damage_ability():
	await get_tree().create_timer(3).timeout
	is_player_able_to_take_damage = true
	
