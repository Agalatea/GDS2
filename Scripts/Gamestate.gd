extends Node2D

var current_score = 0

export var spawn_obstackle_timer = 2
# above that score background shoudl change
export var score_background_change_limit = 20
var screen_size_x 
var screen_size_y
onready var GUI = Global.GUI



var backgrounds = [Global.background_first, Global.background_first_mid_second, Global.background_second, Global.background_second_mid_third, Global.background_third]

func _ready():
	Global.Gamestate = self
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y
	$ParallaxBackground/ParallaxLayer/Background.texture = Global.background_first
	Global.sesion_score = 0
	

func _process(delta):
	calculate_score(delta)
	update_GUI()
	#HARD CODED BACKGROUND CHANGE, NEEDS TO BE MORE SMOOTH 
	if current_score > score_background_change_limit:
		change_background(1)
		#send signal to mayby change enemies
	if current_score > score_background_change_limit+2:
		change_background(2)
	if current_score > score_background_change_limit*2:
		change_background(3)
		#send signal to mayby change enemies
	if current_score > score_background_change_limit*2+2:
		change_background(4)
	
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

func change_background(index):
	if index < backgrounds.size():
		$ParallaxBackground/ParallaxLayer/Background.texture = backgrounds[index]


