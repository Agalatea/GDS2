extends RigidBody2D

#force value of the swipe push in x direction
export (float) var impulse_value_x = 200
#force value of the swipe push in y direction
export (float) var impulse_value_y = -15

func init(pos):
	global_position = pos

func _process(delta):
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func destroy():
	queue_free()

func _on_SwipeDetector_swiped(direction):
	# Handle swipe detection on object
	print("Swiped to: ", direction)
	apply_impulse(direction, Vector2(impulse_value_x * -direction.x, impulse_value_y))
	$AnimationPlayer.play("Fade_out")
