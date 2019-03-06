extends Node



var Player
var Gamestate
var GUI
var BackgroundSound
var EffectsSound


var score_file = "user://highscore.txt"
var highscore = 0
var sum_score = 0
var sesion_score = 0
var background_sound = "on"
var effects_sound = "on"
var values_from_file = {}
var screen_size_x = 0
var screen_size_y = 0

# GLOBAL PATH TO RELEVANT SCENES - MUST BE CHANGED MANNUALLY
var Menu = "res://Scenes/Menu.tscn"
var Main = "res://Scenes/Main.tscn"
var GameOver = "res://Scenes/GameOver.tscn"
var About = "res://Scenes/About.tscn"
var Tutorial = "res://Scenes/Tutorial2.tscn"

# TODO add references to scenes that will spawn somewhere
var background_first = preload("res://Graphic/baground/Assety_-08.png")
var background_first_mid_second = preload("res://Graphic/baground/Assety_-54.png")
var background_second = preload("res://Graphic/baground/Assety_-09.png")
var background_second_mid_third = preload("res://Graphic/baground/Assety_-55.png")
var background_third = preload("res://Graphic/baground/Assety_-10.png")

# Sounds
var menu_tap_sound = preload("res://Sound/MenuClick.wav") 
var swiped_enemy_sound = preload("res://Sound/Swipe.wav")
var highscore_sound = preload("res://Sound/HighScore.wav")
var death_pop_sound = preload ("res://Sound/DeathPop.wav")
var death_zap_sound = preload("res://Sound/DeathZap.wav")

#TODO - load different pigs
var pig_1_unlocked = 1
var pig_2_unlocked = 0
var pig_3_unlocked = 0
var pig_4_unlocked = 0
var active_pig = 1



func _ready():
	screen_size_x = get_viewport().size.x
	screen_size_y = get_viewport().size.y
	setup()
	
#func setup_sounds():
#	menu_tap_stream = AudioStreamPlayer.new()
#	menu_tap_stream.stream = menu_tap_sound
#	menu_tap_stream.playing = true
#	menu_tap_stream.bus = "Effects"

func setup():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		if not content:
			content =  "0,0,on,on,1,0,0,0,1"
		values_from_file = content.split(",")
		highscore = int(values_from_file[0])
		sum_score = int(values_from_file[1])
		background_sound = str(values_from_file[2])
		effects_sound = str (values_from_file[3])
		if values_from_file.size() > 4:
			pig_1_unlocked =  int (values_from_file[4])
			pig_2_unlocked =  int (values_from_file[5])
			pig_3_unlocked =  int (values_from_file[6])
			pig_4_unlocked =  int (values_from_file[7])
			active_pig =  int (values_from_file[8])
		f.close()
		
func sum_up_game():
	sesion_score = Global.Gamestate.current_score
	sum_score += Global.Gamestate.current_score
	if Global.Gamestate.current_score > highscore:
		highscore = Global.Gamestate.current_score
		save_highscore()
	save_add_score()

func save_background_sound(status):
	background_sound = status
	save()

func save_effects_sound(status):
	effects_sound = status
	save()

func save_highscore():
	save()

func save_add_score():
	save()

func save():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(highscore) +","+ str(sum_score)+","+background_sound+","+effects_sound+","+str(pig_1_unlocked)+","+str(pig_2_unlocked)+","+str(pig_3_unlocked)+","+str(pig_4_unlocked)+","+str(active_pig))
	f.close()


	