extends Area2D

var rotation_speed: int = 5
var available_options = ["health", "laser_ammo", "grenade_ammo"]
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int = randi_range(150, 250)


func _ready():
	if type == "health":
		$ItemImage.modulate = Color(0.15, 0.6, 0.15) #green
	if type == "laser_ammo":
		$ItemImage.modulate = Color(0.15, 0.15, 0.6) #blue
	if type == "grenade_ammo":
		$ItemImage.modulate = Color(0.6, 0.15, 0.15) #red
	
	#item animations
	var target_position = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_position, 0.4)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.4).from(Vector2(0, 0))

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
