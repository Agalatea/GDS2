extends Node2D

var current_score = 0

export var spawn_obstackle_timer = 2

export var score_stage_one_change_limit = 20 # above that score stage will change to stage 2
export var score_stage_two_change_limit = 40 # above that score stage will change to stage 3

var screen_size_x 
var screen_size_y
onready var GUI = Global.GUI

signal stage_one
signal stage_two
signal stage_three


enum States {FIRST_STAGE, MIDDLE_STAGE, SPACE_STAGE}

var game_state = null

var backgrounds = [Global.background_first, Global.background_first_mid_second, Global.background_second, Global.background_second_mid_third, Global.background_third]

func _ready():
	Global.Gamestate = self
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y
	$ParallaxBackground/ParallaxLayer/Background.texture = Global.background_first
	$ParallaxBackground/ParallaxLayer.motion_mirroring = $ParallaxBackground/ParallaxLayer/Background.texture.get_size().rotated($ParallaxBackground/ParallaxLayer/Background.global_rotation)
	
	Global.sesion_score = 0
	game_state = States.FIRST_STAGE
	

func _process(delta):
	calculate_score(delta)
	update_GUI()
	#HARD CODED BACKGROUND CHANGE, NEEDS TO BE MORE SMOOTH 
	if current_score > score_stage_one_change_limit && current_score < score_stage_two_change_limit  && game_state != States.MIDDLE_STAGE:
		change_game_state(States.MIDDLE_STAGE)
	if current_score > score_stage_two_change_limit && game_state != States.SPACE_STAGE:
		change_game_state(States.SPACE_STAGE)


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
		if index == 2:
			$Transitions.spawn_transition_background(Global.background_first_mid_second, index)
		elif index == 4:
			$Transitions.spawn_transition_background(Global.background_second_mid_third, index)
		
		
func swap_paralax_layer(index):
	$ParallaxBackground/ParallaxLayer/Background.texture = backgrounds[index]

func change_game_state(new_state):
	match new_state:
		States.FIRST_STAGE:
			#change_background(0)
			emit_signal("stage_one")
		States.MIDDLE_STAGE:
			#background_transition
			change_background(2)
			#change enemies
			emit_signal("stage_two")
		States.SPACE_STAGE:
			#background transition
			change_background(4)
			emit_signal("stage_three")
			
	game_state = new_state
