extends Area2D

var rotation_speed: int = 5
var available_options = ["health", "laser_ammo", "grenade_ammo"]
var type = available_options[randi()%len(available_options)]

func _ready():
	if type == "health":
		$ItemImage.modulate = Color(0.15, 0.6, 0.15) #green
	if type == "laser_ammo":
		$ItemImage.modulate = Color(0.15, 0.15, 0.6) #blue
	if type == "grenade_ammo":
		$ItemImage.modulate = Color(0.6, 0.15, 0.15) #red

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(_body):
	if type == "health":
		Globals.health += 30
	if type == "laser_ammo":
		Globals.laser_ammo_amount += 30
	if type == "grenade_ammo":
		Globals.grenade_amount += 5
	queue_free()
