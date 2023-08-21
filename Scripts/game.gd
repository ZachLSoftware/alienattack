extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

@onready var enemy_hit_sound = $EnemyHitSound
@onready var player_explode = $PlayerExplode

var gameover_screen = preload("res://Scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives(lives)
	
	
func _on_deathzone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives -= 1
	hud.set_lives(lives)
	player_explode.play()
	enemy_hit_sound.play()
	if lives == 0:
		player.die()
		player_explode.play()
		await get_tree().create_timer(1.5).timeout
		
		var gameover_inst = gameover_screen.instantiate()
		gameover_inst.set_final_score(score)
		gameover_inst.z_index=1000
		ui.add_child(gameover_inst)		
		

func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)
	

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)
	enemy_hit_sound.play()
