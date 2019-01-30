extends RigidBody2D

#force value of the swipe push in x direction
export (float) var impulse_value_x = 250
#force value of the swipe push in y direction
export (float) var impulse_value_y = -15

var dying = false

var CloudTypes = ["cloud_white", "cloud_white_big", "cloud_dark", "cloud_dark_big"]

func init(pos):
	global_position = pos
	randomize()
	


func ready():
	$AnimatedSprite.play(CloudTypes[randi() % CloudTypes.size()])
	
	
func _process(delta):
	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func destroy():
	queue_free()

func _on_SwipeDetector_swiped(direction):
	# Handle swipe detection on object
	if not dying:
		dying = true
		print("Swiped to: ", direction)
		apply_impulse(direction, Vector2(impulse_value_x * -direction.x, impulse_value_y))
		$CollisionShape2D.disabled = true
		$TouchArea/CollisionShape2D.disabled = true
		$AnimationPlayer.play("Fade_out")


func _on_Cloud_body_entered(body):
	print(body)
	if body.is_in_group("Player"):
		print("PLAYER CHMURA")
		Global.Player.end()
		queue_free() #death anim


func _on_Cloud_body_shape_entered(body_id, body, body_shape, local_shape):
	print(body)
