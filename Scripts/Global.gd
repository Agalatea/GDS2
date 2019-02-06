extends Node



var Player
var Gamestate
var GUI


var score_file = "user://highscore.txt"
var highscore = 0
var sum_score = 0
var values_from_file

# GLOBAL PATH TO RELEVANT SCENES - MUST BE CHANGED MANNUALLY
var Menu = "res://Scenes/Menu.tscn"
var Main = "res://Scenes/Main.tscn"
var GameOver = "res://Scenes/GameOver.tscn"
var About = "res://Scenes/About.tscn"

# TODO add references to scenes that will spown somewhere


func _ready():
	setup()

func setup():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		if not content:
			values_from_file = ["0","0"]
		values_from_file = content.split(",")
		highscore = int(values_from_file[0])#int(content[0])
		sum_score = int(values_from_file[1])
		f.close()
		
func sum_up_game():
	sum_score += Global.Gamestate.current_score
	if Global.Gamestate.current_score > highscore:
		highscore = Global.Gamestate.current_score
		save_highscore()
	save_add_score()

func save_highscore():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(highscore) +","+ str(sum_score))
	f.close()

func save_add_score():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(highscore) +","+ str(sum_score))
	f.close()
	


	