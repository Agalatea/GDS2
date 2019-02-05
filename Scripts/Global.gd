extends Node



var Player
var Gamestate
var GUI


var score_file = "user://highscore.txt"
var highscore = 0


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
		highscore = int(content)
		f.close()
		
func sum_up_game():
	if Global.Gamestate.current_score > highscore:
		highscore = Global.Gamestate.current_score
		save_score()

func save_score():
	var f = File.new()
	f.open(score_file, File.WRITE)
	f.store_string(str(Global.Gamestate.current_score))
	f.close()



