extends RigidBody2D

#force value of the swipe push in x direction
export (float) var impulse_value_x = 250
#force value of the swipe push in y direction
export (float) var impulse_value_y = -15

var dying = false
var fly_fight = true

func change_fly_dir(direction_type):
	fly_fight = !fly_fight



func init(pos):
	global_position = pos
	#var cloud_sprite = CloudTypes[randi() % CloudTypes.size()]
	#$AnimatedSprite.play(cloud_sprite)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

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
		print("PLAYER CHMURA")
		Global.Player.end()
		queue_free() #death anim
