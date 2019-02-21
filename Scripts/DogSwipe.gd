extends Area2D

#force value of the swipe push in x direction
export (float) var impulse_value_x = 250
#force value of the swipe push in y direction
export (float) var impulse_value_y = -15

var dying = false


func init(pos):
	pass
#	global_position = pos
#	$AnimatedSprite.play("Idle")
#	print("JESTEM LAJKA")
#	print(global_position)

func _ready():
	$AnimationPlayer.play("fly")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_SwipeDetector_swiped(direction):
	dying = true
	$AnimatedSprite.play("die")
	$CollisionPolygon2D.disabled = true
	$AnimationPlayer.play("Fade_out")


func _on_Dog_body_entered(body):
	print(body)
	if body.is_in_group("Player"):
		print("PLAYER Łajka")
		Global.Player.end()
		queue_free() #death anim


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free() 
