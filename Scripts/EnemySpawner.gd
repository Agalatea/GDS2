extends Node2D

#every timer timeout enemy is spawned, must be getting lower when player is gaining speed
export var spawn_obstackle_timer = 1
#limit of the enemy spawn timer
export var spawn_obstackle_limit = 0.4
#every x (now 5) sec update enemy spawner timer
export var update_sawn_time_timer = 5


var current_spawn_timer = 0
var spawn_timer_offset = 0
var spawn_limit_position = 100 # how far from left and right screen corner enemies will spawn

var TapEnemy = preload("res://Scenes/BirdEnemy.tscn")
var SwipeEnemy = preload("res://Scenes/CloudEnemy.tscn")
var SwipeEnemy_storm = preload("res://Scenes/StormCloud.tscn")
var SwipeEnemy_ufo = 0
var TapEnemy_plane = 0

var screen_size_x 
var screen_size_y

signal spawn_enemy
signal update_timer
#This array shoudl be changed when we want to display different 
var current_enemies = []

onready var enemys_first = [TapEnemy, SwipeEnemy, SwipeEnemy_storm]
#enemy_2 background
#enemy 3 bakcground

func _process(delta):
	spawn_timer_offset = recalculate_spawn_timer(Global.Player.basic_speed)
	#print(current_spawn_timer)
	#if true:#every 5 seconds
		
		
func recalculate_spawn_timer(player_speed):
	var timer =  200/(player_speed)
	#print(1-timer)
	return 1-timer



func _ready():
	$Timer.wait_time = spawn_obstackle_timer
	$UpdateSpawnTimeTimer.wait_time = update_sawn_time_timer
	
	current_spawn_timer = spawn_obstackle_timer
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y
	current_enemies = enemys_first
	
func spawn_enemy():
	#Spawn random obstackle in front of the player above camera
	
	randomize()
	var rand_enemy = enemys_first[randi() % enemys.size()]
	#print(rand_obstackle)
	
	var player_pos = Global.Player.global_position
	var spawn_pos = Vector2()
	spawn_pos.y = player_pos.y - screen_size_y
	spawn_pos.x = clamp(
				rand_range(player_pos.x - screen_size_x*0.6, player_pos.x + screen_size_x*0.6),
				spawn_limit_position,
				screen_size_x - spawn_limit_position)
	if rand_enemy:
		var enemy = rand_enemy.instance()
		Global.Gamestate.get_node('Enemy').add_child(enemy)
		
		enemy.init(spawn_pos)
	
func _on_Timer_timeout():
	emit_signal('spawn_enemy')

func _on_EnemySpawner_update_timer(time_offset):
	current_spawn_timer = current_spawn_timer - time_offset

	if current_spawn_timer >= spawn_obstackle_limit:
		print(current_spawn_timer)
		update_spawn_timer(current_spawn_timer)
	else:
		current_spawn_timer = spawn_obstackle_limit
		

func update_spawn_timer(wait_time):
	$Timer.wait_time = wait_time
	
func _on_UpdateSpawnTimeTimer_timeout():
	emit_signal('update_timer', spawn_timer_offset)
