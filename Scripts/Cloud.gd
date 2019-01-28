extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var CloudTypes = ["cloud_white", "cloud_white_big", "cloud_dark", "cloud_dark_big"]

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func init(pos):
	global_position = pos
	randomize()
	$Sprite.play(CloudTypes[randi() % CloudTypes.size()] )

func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	#To dziala jak tapniecie
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		queue_free()

func _on_RockTap_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
