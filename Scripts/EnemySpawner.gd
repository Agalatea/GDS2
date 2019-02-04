extends Node2D

#every timer timeout enemy is spawned, must be getting lower when player is gaining speed
export var spawn_obstackle_timer = 2 

var TapEnemy = preload("res://Scenes/BirdEnemy.tscn")
var SwipeEnemy = preload("res://Scenes/CloudEnemy.tscn")

var screen_size_x 
var screen_size_y

signal spawn_enemy()


onready var enemys = [TapEnemy, SwipeEnemy]

func _ready():
	$Timer.wait_time = spawn_obstackle_timer
	
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y
	
func spawn_enemy():
	#Spawn random obstackle in front of the player above camera
	
	randomize()
	var rand_enemy = enemys[randi() % enemys.size()]
	#print(rand_obstackle)
	
	var player_pos = Global.Player.global_position
	var spawn_pos = Vector2()
	spawn_pos.y = player_pos.y - screen_size_y/2
	spawn_pos.x = rand_range(player_pos.x - screen_size_x*0.6, player_pos.x + screen_size_x*0.6)
	if rand_enemy:
		var enemy = rand_enemy.instance()
		Global.Gamestate.get_node('Enemy').add_child(enemy)
		#$Obstackles.add_child(enemy)
		enemy.init(spawn_pos)
	
func _on_Timer_timeout():
	emit_signal('spawn_enemy')
