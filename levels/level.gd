extends Node2D

class_name LevelParent

var laser_scene: PackedScene = preload("res://projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://items/item.tscn")

func _ready():
	#get present containers on map
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
	
	#get present enemies on map
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.connect("laser", _on_enemy_laser)


func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position =	 pos
	item.direction = direction
	$Items.call_deferred("add_child", item)


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


func _on_enemy_laser(pos, dir):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = dir.angle() + PI / 2
	laser.direction = dir
	$Projectiles.add_child(laser)
