extends Node2D

#every timer timeout enemy is spawned, must be getting lower when player is gaining speed
export var spawn_obstackle_timer = 1
#limit of the enemy spawn timer
export var spawn_obstackle_limit = 0.4
#every x (now 5) sec update enemy spawner timer
export var update_sawn_time_timer = 5

export var tap_enemies_p1 = 1
export var swipe_enemy_cloud_p1 = 1
export var swipe_enemy_storm_p1 = 1

export var tap_enemies_p2 = 1
export var swipe_enemy_cloud_p2 = 1
export var swipe_enemy_storm_p2 = 1

export var tap_enemies_p3 = 1
export var swipe_enemies_p3 = 1


var current_spawn_timer = 0
var spawn_timer_offset = 0
var spawn_limit_position = 100 # how far from left and right screen corner enemies will spawn

var TapEnemy_bird = preload("res://Scenes/BirdEnemy.tscn")
var SwipeEnemy_cloud = preload("res://Scenes/CloudEnemy.tscn")
var SwipeEnemy_storm = preload("res://Scenes/StormCloud.tscn")
var TapEnemy_plane = preload("res://Scenes/PlaneEnemy.tscn")
var TapEnemy_ufo = preload("res://Scenes/Ufo.tscn")
var SwipeEnemy_lajka = preload("res://Scenes/Ufo.tscn") #TODO ONLY DEBUG CHANGE THIS WHEN LAJKA SCENE WILL BE READY

var screen_size_x 
var screen_size_y

signal spawn_enemy
signal update_timer
#This array shoudl be changed when we want to display different 
var current_enemies = []

onready var enemies_first = []
#enemy_2 background TapEnemy_bird, SwipeEnemy_cloud, SwipeEnemy_storm
onready var enemies_second = []
##enemy 3 bakcground
onready var enemies_third = []


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
	for i in range(0, tap_enemies_p1):
		enemies_first.append(TapEnemy_bird)

	for j in range(0, swipe_enemy_cloud_p1):
		enemies_first.append(SwipeEnemy_cloud)

	for k in range(0, swipe_enemy_storm_p1):
		enemies_first.append(SwipeEnemy_storm)

	for i in range(0, tap_enemies_p2):
		enemies_second.append(TapEnemy_plane)

	for j in range(0, swipe_enemy_cloud_p2):
		enemies_second.append(SwipeEnemy_cloud)

	for k in range(0, swipe_enemy_storm_p2):
		enemies_second.append(SwipeEnemy_storm)

	for i in range(0, tap_enemies_p3):
		enemies_third.append(TapEnemy_ufo)

	for j in range(0, swipe_enemies_p3):
		enemies_third.append(SwipeEnemy_lajka)

	current_enemies = enemies_first
	
func spawn_enemy():
	#Spawn random obstackle in front of the player above camera
	
	randomize()
	var rand_enemy = current_enemies[randi() % current_enemies.size()]
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


func _on_Main_stage_one():
	current_enemies = enemies_first


func _on_Main_stage_two():
	current_enemies = enemies_second


func _on_Main_stage_three():
	current_enemies = enemies_third
