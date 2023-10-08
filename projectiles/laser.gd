extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	$SelfDestructTimer.start()
	
	# Smooth laser disapearance
	var tween = get_tree().create_tween()
	tween.tween_property($LaserImage, "modulate:a", 0, $SelfDestructTimer.wait_time)


func _process(delta):
	position += direction * speed * delta


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	queue_free()	


func _on_self_destruct_timer_timeout():
	queue_free()
