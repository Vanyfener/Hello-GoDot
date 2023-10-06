extends CharacterBody2D

signal laser(pos, dir)
signal grenade(pos, dir)

const SPEED = 600
const ROTATION_SPEED = 10

var primary_delay: bool = true
var secondary_delay: bool = true

func _process(delta):
	#movement
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = lerp(velocity.x, direction.x * SPEED, delta * 8.0)
		velocity.y = lerp(velocity.y, direction.x * SPEED, delta * 8.0)
	
	move_and_slide()
	
	#rotation
	rotation = get_smooth_mouse_rotation(delta, ROTATION_SPEED)
	
	#Left/Right mouse click
	var player_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary action") && primary_delay:
		var laser_markers = $LaserStartPositions.get_children()
		var random_laser_selection = laser_markers[randi() % laser_markers.size()]
		direction = player_direction
		$GunSmoke.emitting = true
		primary_delay = false
		$PrimaryDelay.start()
		laser.emit(random_laser_selection.global_position, player_direction)
		
	if Input.is_action_just_pressed("secondary action") && secondary_delay:
		var grenade_throw_point = $GrenadeStartPositions/Marker2D.global_position
		secondary_delay = false
		$SecondaryDelay.start()
		grenade.emit(grenade_throw_point, player_direction)
		
func _on_primary_delay_timeout():
	primary_delay = true
	
func _on_secondary_delay_timeout():
	secondary_delay = true

func get_smooth_mouse_rotation(dlt, rot_speed) -> float:
	var vec = (get_global_mouse_position() - global_position).normalized()
	var ang = vec.angle()
	var rot = global_rotation
	return lerp_angle(rot, ang, rot_speed * dlt)
