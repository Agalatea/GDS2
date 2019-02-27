extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func init(pos):
	global_position = pos

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	$Timer.start()


func _on_Timer_timeout():
	queue_free()
