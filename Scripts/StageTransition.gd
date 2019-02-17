extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal change_background
var transition_number 

func _ready():
	var transition_texture_size = texture.get_size().y
	$TransitionENd.position.y = (- transition_texture_size)
	print($TransitionENd.position)


func init(pos, transition_background, transition_index):
	global_position = pos
	texture = transition_background
	transition_number = transition_index
		
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_VisibilityNotifier2D_screen_exited():
	pass
	
func _on_BackgroundChangeNotifier_body_entered(body):
	if body.is_in_group("Player"):
		emit_signal("change_background")
		print("transition_index:" , transition_number)
		Global.Gamestate.swap_paralax_layer(transition_number)
		
func _on_TransitionENd_body_entered(body):
	queue_free()

