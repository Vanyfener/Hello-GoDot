extends RigidBody2D

var grenade_velocity = 1500
var explosion_active: bool = false
var explosion_radius: int = 400

func explode():
	$GrenadeCollision.disabled = true
	linear_velocity = Vector2(0, 0)
	angular_velocity = 0
	$ExplosionAnimation.play("ExplosionSlideShow")
	explosion_active = true


func _process(_delta):
	if explosion_active:
		var targets = get_tree().get_nodes_in_group("Entity") + get_tree().get_nodes_in_group("Container")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			if "hit" in target && in_range:
				target.hit()
