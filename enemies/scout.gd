extends CharacterBody2D

signal laser(pos, dir)

@export var scout_rotation_speed: float = 8

var is_player_nearby: bool = false
var is_able_to_shoot: bool = true
var is_right_gun: bool = false


func _process(delta):
	if is_player_nearby:
		
		#scout rotation
		rotation = get_smooth_enemy_rotation(delta, scout_rotation_speed)
		
		#scout shooting
		if is_able_to_shoot:
			var laser_start_positions = $LaserStartPositions.get_children()
			var current_start_selection = laser_start_positions[int(is_right_gun)]
			is_right_gun = !is_right_gun
			var pos: Vector2 = current_start_selection.global_position
			var dir: Vector2 = (Globals.player_position - position).normalized()
			laser.emit(pos, dir)
			is_able_to_shoot = false
			$LaserCooldownTimer.start()


func get_smooth_enemy_rotation(dlt, rot_speed) -> float:
	var vec = (Globals.player_position - global_position).normalized()
	var ang = vec.angle()
	var rot = global_rotation
	return lerp_angle(rot, ang, rot_speed * dlt)


func _on_attack_area_body_entered(_body):
	is_player_nearby = true


func _on_attack_area_body_exited(_body):
	is_player_nearby = false


func _on_laser_cooldown_timer_timeout():
	is_able_to_shoot = true
