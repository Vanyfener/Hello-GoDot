extends Node2D

var laser_scene: PackedScene = preload("res://projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://projectiles/grenade.tscn")

func _on_gate_player_entered_inside():
	print("entered inside a level")
	
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
