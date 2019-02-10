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

# GLOBAL PATH TO RELEVANT SCENES - MUST BE CHANGED MANNUALLY
var Menu = "res://Scenes/Menu.tscn"
var Main = "res://Scenes/Main.tscn"
var GameOver = "res://Scenes/GameOver.tscn"
var About = "res://Scenes/About.tscn"

# TODO add references to scenes that will spawn somewhere
var background_first = preload("res://Graphic/baground/Assety_-08.png")
var background_second = preload("res://Graphic/baground/Assety_-09.png")
var background_black = preload("res://Graphic/baground/Assety_-10.png")

func _ready():
	setup()

func setup():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		if not content:
			content =  "0,0,on,on"
		values_from_file = content.split(",")
		highscore = int(values_from_file[0])
		sum_score = int(values_from_file[1])
		background_sound = str(values_from_file[2])
		effects_sound = str (values_from_file[3])
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
	f.store_string(str(highscore) +","+ str(sum_score)+","+background_sound+","+effects_sound)
	f.close()


	