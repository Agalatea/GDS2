extends Area2D

var dying = false
export (int) var falling_speed  = 100

func _ready():
	$TapEnemy.stream = Global.paper_tap_sound
	$AnimationPlayer.play("fly")
	


func _process(delta):
	if dying:
		global_position.y += falling_speed * delta
		$Sprite.play("die")


func destroy():
	queue_free()

func _input_event(viewport, event, shape_idx):
	#To dziala jak tapniecie
	if Input.is_action_just_released("ui_touch") and not dying:
		$TapEnemy.play()
		dying = true
		$CollisionPolygon2D.disabled = true
		$AnimationPlayer.play("fade_out")



func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		Global.Player.end()
		queue_free() #death anim
