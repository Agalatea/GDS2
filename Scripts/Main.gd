extends Control

var enemyscene = preload("res://Scenes/Enemy.tscn")
var game_scene = preload("res://Scenes/Main.tscn")

func _ready():
	$BGM.play()

#func _input(event):
#	if event is InputEventScreenTouch:
#		print("touch")
		
#EXMAPLE for later
# if event is InputEventScreenDrag:
#        if event.speed.y < -10:
#            self.state = BOOST
#                    self.character_on_input_press_position = self.position
#            self.get_tree().set_input_as_handled()
#        elif event.speed.y > 10:
#            self.state = DIVE
#            self.character_on_input_press_position = self.position
#            self.get_tree().set_input_as_handled()
#    elif event is InputEventScreenTouch:
#        if event.pressed:
#            self.state = FLY
#            self.character_on_input_press_position = self.position
#            self.get_tree().set_input_as_handled()

func _on_Timer_timeout():
	pass


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_About_pressed():
	get_tree().change_scene("res://Scenes/About.tscn")