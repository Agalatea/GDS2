extends AnimatedSprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	randomize()
	play(str(randi() % 8))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func die():
	$AnimationPlayer.play("die")
	
func free():
	queue_free()

	