extends Area2D

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

func _input_event(viewport, event, shape_idx):
	#To dziala jak tapniecie
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		queue_free()

func _on_RockTap_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
