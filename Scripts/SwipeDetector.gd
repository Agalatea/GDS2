extends Node2D

#Note Add this scene to object and connect signals to handle swipe events

# Signals to send on swipe action/cancel swipe
signal swiped(direction)
signal swipe_canceled(start_position)

# Detect if swipe was diagonal, diagonal swipe threshold
export (float, 1.0, 1.5) var MAX_DIAGONAL_SLOPE = 1.5 # set manually
#Swipe timeout, time for perform swipe
onready var timer = $Timer

var swipe_start_position = Vector2()



func _on_TouchArea_input_event(viewport, event, shape_idx):
	if not event is InputEventScreenTouch:
		return
	if event.pressed:
		_start_detection(event.position)
	elif not timer.is_stopped():
		_end_detection(event.position)


func _start_detection(position):
	swipe_start_position = position
	timer.start()
	
func _end_detection(position):
	timer.stop()
	var direction = (position - swipe_start_position).normalized()
	#if swipe is diagonal
	if abs(direction.x) + abs(direction.y) > MAX_DIAGONAL_SLOPE:
		return #do nothing
	if position == swipe_start_position:
		return
	
	if abs(direction.x) > abs(direction.y): #horizontal swipe
		emit_signal('swiped', Vector2(-sign(direction.x), 0.0))
	else:
		#may be not used by us
		#emit_signal('swiped', Vector2(0.0, -sign(direction.y))) #vertical swipe
		return
	

func _on_Timer_timeout():
	emit_signal('swipe_canceled', swipe_start_position)
	


#example of connection and usage 
#func _on_EXAMPLESCENE_input_event(viewport, event, shape_idx):
#	if not event is InputEventScreenTouch:
#		return
#	if event.pressed:
#		_start_detection(event.position)
#	elif not timer.is_stopped():
#		_end_detection(event.position)
