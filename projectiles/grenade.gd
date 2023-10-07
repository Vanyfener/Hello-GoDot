extends RigidBody2D

var grenade_velocity = 1500

func explode():
	$ExplosionAnimation.play("ExplosionSlideShow")
	print("Boom!")
