extends Area2D

#force value of the swipe push in x direction
export (float) var impulse_value_x = 250
#force value of the swipe push in y direction
export (float) var impulse_value_y = -15

export (float) var left_pitch = -13
export (float) var right_pitch = 13
export (int) var speed = 150

var dying = false
var dir_to_player = Vector2()
onready var motion = Vector2()

func _ready():
	pass
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _process(delta):
	#global_position += motion *delta
	pass
	

func _on_SwipeDetector_swiped(direction):
	$SwipeEnemy.play()
	dying = true
	$AnimatedSprite.play("die")
	$CollisionPolygon2D.disabled = true
	$AnimationPlayer.play("Fade_out")


func _on_Dog_body_entered(body):
	print(body)
	if body.is_in_group("Player"):
		Global.Player.end()
		$AnimatedSprite.play("die")
		$CollisionPolygon2D.disabled = true
		$AnimationPlayer.play("Fade_out")



func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free() 
