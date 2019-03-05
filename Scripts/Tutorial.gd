extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Cloud/AnimatedSprite.play("cloud_dark_big")
	$Cloud2/AnimatedSprite.play("cloud_dark")
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Button_pressed():
	get_tree().change_scene(Global.Menu)

