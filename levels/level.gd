extends Node2D

class_name LevelParent

var laser_scene: PackedScene = preload("res://projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://projectiles/grenade.tscn")


func _on_player_laser(pos, dir):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = dir.angle() + PI / 2
	laser.direction = dir
	$Projectiles.add_child(laser)


func _on_player_grenade(pos, dir):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = dir * grenade.grenade_velocity
	$Projectiles.add_child(grenade)


func _on_garage_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.45, 0.45), 1.0)
	


func _on_garage_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.3, 0.3), 1.0)
