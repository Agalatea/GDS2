extends Node2D

export var spawn_obstackle_timer = 2
var screen_size_x 
var screen_size_y

var TapEnemy = preload("res://Scenes/BirdEnemy.tscn")
var SwipeEnemy = preload("res://Scenes/CloudEnemy.tscn")


var obstackles = [TapEnemy,SwipeEnemy]

func _ready():
	Global.Gamestate = self
	$Obstacke_spawn_timer.wait_time = spawn_obstackle_timer
	
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y

func _process(delta):
	pass
		

func spawn_obstackle():
	#Spawn random obstackle in front of the player above camera
	
	randomize()
	var rand_obstackle = obstackles[randi() % obstackles.size()]
	print(rand_obstackle)
	
	var player_pos = Global.Player.global_position
	var spawn_pos = Vector2()
	spawn_pos.y = player_pos.y - screen_size_y/2
	spawn_pos.x = player_pos.x
	if rand_obstackle:
		var obstackle = rand_obstackle.instance()
		$Obstackles.add_child(obstackle)
		obstackle.init(spawn_pos)
	
	
func _on_Obstacke_spawn_timer_timeout():
	spawn_obstackle()
