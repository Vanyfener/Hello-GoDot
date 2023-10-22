extends RigidBody2D

var grenade_velocity = 1500

func explode():
	$GrenadeCollision.disabled = true
	linear_velocity = Vector2(0, 0)
	angular_velocity = 0
	$ExplosionAnimation.play("ExplosionSlideShow")
	print("Boom!")
