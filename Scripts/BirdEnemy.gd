extends Area2D

var dying = false


func _ready():
	pass
	
func init(pos):
	global_position = pos

func _process(delta):
	pass


func destroy():
	queue_free()

func _input_event(viewport, event, shape_idx):
	#To dziala jak tapniecie
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and not dying:
		dying = true
		$CollisionPolygon2D.disabled = true
		$AnimationPlayer.play("fade_out")

func _on_RockTap_body_entered(body):
	if body.is_in_group("Player"):
		Global.Player.end()
		queue_free() #death anim
