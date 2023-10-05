extends CharacterBody2D

const SPEED = 300.0

var direction: Vector2

func _physics_process(_delta):
	direction = Vector2(1.0, 0.0)
	velocity = direction * SPEED
	
	move_and_slide()
