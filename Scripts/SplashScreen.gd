extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if Global.tutorial_shown == 0:
			get_tree().change_scene(Global.Tutorial)
		else:
			get_tree().change_scene(Global.Menu)
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
