extends Node2D

var current_score = 0

export var spawn_obstackle_timer = 2
var screen_size_x 
var screen_size_y
onready var GUI = Global.GUI

func _ready():
	Global.Gamestate = self
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y

func _process(delta):
	calculate_score(delta)
	update_GUI()
	
func _on_EnemySpawner_spawn_enemy():
	$EnemySpawner.spawn_enemy()


func update_GUI():
	if Global.Player.state == Global.Player.States.ALIVE:
		GUI.update_GUI(current_score)
		
		
func calculate_score(delta):
	#TODO MAKE IT BETTER
	current_score =  int(- int(Global.Player.global_position.y) * 0.8 * delta)




