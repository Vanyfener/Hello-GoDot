extends Node

signal update_laser_ammo_amount()
signal update_grenade_amount()
signal update_health_amount()

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


var health = 33:
	get:
		return health
	set(value):
		health = value
		update_health_amount.emit()
