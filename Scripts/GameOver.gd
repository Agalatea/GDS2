extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$MenuTap.stream = Global.menu_tap_sound
	$CenterContainer/VBoxContainer/HBoxContainer/Score.text = str(Global.sesion_score)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Back_pressed():
	$MenuTap.play()
	get_tree().change_scene(Global.Menu)


func _on_PlayAgain_pressed():
	$MenuTap.play()
	get_tree().change_scene(Global.Main)
