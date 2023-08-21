extends Node2D

var enemy_scene = preload("res://Scenes/enemy.tscn")

@onready var spawn_positions = $SpawnPositions
signal enemy_spawned

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var pos_arr = spawn_positions.get_children()
	var rand_pos = pos_arr.pick_random()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position=rand_pos.global_position
	emit_signal("enemy_spawned", enemy_instance)
	
	
