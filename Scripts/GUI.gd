extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Global.GUI = self

func update_GUI(points):
	$CenterContainer/HBoxContainer/Score.text = str(points)
