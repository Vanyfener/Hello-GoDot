extends RigidBody2D

var grenade_velocity = 1500

func explode():
	$'GrenadeCollision'.disabled = true
	$ExplosionAnimation.play("ExplosionSlideShow")
	print("Boom!")
