extends KinematicBody2D

export (int) var swipe_friction = 1


var elapsed_time = 0
var start_pos
var speed = 0
var start_time
var direction = Vector2(0,0)
var swipe_start

var touch_pos = Vector2(0,0)
var final_touch = Vector2(0,0)
var thrown = false
var lifted = false

func init(pos):
	global_position = pos

onready var touched = false

#BASIC SWIPE TESTING

#func _input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		thrown = true
#	else:
#		thrown = false
#	if event is InputEventScreenTouch:
#		if event.is_pressed():
#			print(event.position)
#			start_pos = event.position
#			start_time = elapsed_time
#		else:
#			direction = event.position - start_pos
#			speed = (direction.length()) / (elapsed_time - start_time)
#			direction = direction.normalized()
#			print(direction, speed)

#	if event is InputEventScreenDrag:
#		if (event.position - position).length() < 30:
#			thrown = true
#			direction = event.speed
#		else:
#			thrown = false
#			direction = Vector2()
#
#func _ready():
#	# Called when the node is added to the scene for the first time.
#	# Initialization here
#	pass
#
func _process(delta):
	pass

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
#
#
#TRY DRAG WORKAROUND

func _on_RockSwipe_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_touch"):
		print("touched rock")
		touched = true

func _on_TouchArea_input_event(viewport, event, shape_idx):
	if event.is_action_released("ui_touch"):
		print("realeased rock")
		touched = false
		#Add fore impulse or tween
		direction = 0

	if touched:
		if event is InputEventScreenDrag:
			print("gets dragged")
			print("ply:", position)
			print("pos: ", event.position)
			print("rel: ", event.relative)
			print("vel: ", event.speed)
			direction = event.speed

			#Move the obstackle hardcode
			#position = position + event.relative

			#Move the obstackle with collision
			move_and_collide(event.relative)




#WORKING CLICK AND DRAG!!!!
#func _unhandled_input(event):
#	if event is InputEventMouseButton and not event.pressed:
#		lifted = false
#	if lifted and event is InputEventMouseMotion:
#		position += event.relative
#
#func _input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton and event.pressed:
#		lifted = true






