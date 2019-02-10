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
	#Liniear function of height
	var score = 0.01 * int(abs(Global.Player.global_position.y)) 
	if (score > current_score):
		current_score =  int(score)




