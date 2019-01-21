extends Control

const enemyscene = preload("res://Scenes/Enemy.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if event is InputEventScreenTouch:
		print("touch")
		self.add_child(enemyscene.instance())
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