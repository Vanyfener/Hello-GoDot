extends CanvasLayer

@onready var laser_ammo_label: Label = $WeaponsContainer/WeaponBars/LaserGunBar/LaserGunAmmo/LaserAmmo
@onready var grenade_amount_label: Label = $WeaponsContainer/WeaponBars/GrenadeBar/GrenadeAmmo/GrenadesAmount
@onready var laser_gun_image: TextureRect = $WeaponsContainer/WeaponBars/LaserGunBar/LaserGun/LaserGunImage
@onready var grenade_ammo: TextureRect = $WeaponsContainer/WeaponBars/GrenadeBar/Grenade/GrenadeAmmo
@onready var health_amount_progress_bar: TextureProgressBar = $"Health&ArmorContainer/HealthBar"

#colors
var green: Color = Color(0, 1, 0, 1)
var red: Color = Color(1, 0, 0, 1)

func _ready():
	laser_ammo_label.text = str(Globals.laser_ammo_amount)
	grenade_amount_label.text = str(Globals.grenade_amount)
	update_color(Globals.laser_ammo_amount, laser_ammo_label, laser_gun_image)
	update_color(Globals.grenade_amount, grenade_amount_label, grenade_ammo)
	

func update_laser_ammo_amount():
	laser_ammo_label.text = str(Globals.laser_ammo_amount)
	update_color(Globals.laser_ammo_amount, laser_ammo_label, laser_gun_image)


func update_grenade_amount():
	grenade_amount_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_amount_label, grenade_ammo)

func update_color(amount: int, label: Label, icon: TextureRect):
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green

#func update_health_amount():
#	health_amount_progress_bar.value = 

