extends CharacterBody2D

#var is_anemy : bool = true

const SPEED = 300.0

var direction: Vector2

func _physics_process(_delta):
	direction = Vector2(1.0, 0.0)
	velocity = direction * SPEED
	
	move_and_slide()


func hit():
	print("damage")
