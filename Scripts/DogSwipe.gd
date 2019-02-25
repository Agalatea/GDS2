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
	randomize()
	$SwipeEnemy.stream = Global.swiped_enemy_sound
	#$AnimationPlayer.play("Fly")
	dir_to_player = Global.Player.global_position - get_owner().global_position
	dir_to_player = dir_to_player.normalized()
	#print("DIR: ", dir_to_player)
	#print("dog pos", global_position.x)
	#print("player pos", Global.Player.global_position.x)
#	if get_owner().global_position.x > Global.Player.global_position.x:
#		rotate(right_pitch)
#		motion = Vector2(1, -0.5) * speed
#
#	elif get_owner().global_position.x < Global.Player.global_position.x:
#		rotate(right_pitch)
#		motion = Vector2(1, -0.5) * speed
		
	var roll = randi() % 2
	print("rolling: ", roll)
	if roll == 0:
		rotate(left_pitch)
		motion = Vector2(-0.6, 0.5) * speed
	if roll == 1:
		rotate(right_pitch)
		motion = Vector2(0.6, 0.5) * speed
		
	#motion = dir_to_player * speed
	#motion.y = -0.2
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func _process(delta):
	global_position += motion *delta
	

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
