extends KinematicBody2D

var screensize = Vector2()

enum States {INIT, ALIVE, INVULNERABLE, DEAD}
var state = null

var motion = Vector2()
export (float) var basic_speed = 0

#how much speed increase over time
export (float) var speed_increase_factor = 0.02
#every time period that speed increase
export (int) var time_increase = 1
# max movement speed
export (float) var max_speed = 600
#every time the pig will look up
export var look_up_time = 5

export (int) var min_look_up_value = 3
export (int) var max_look_up_value = 10

var elapsed_time_alive = 0


func _ready():
	randomize()
	Global.Player = self 
	state = ALIVE
	$LookUpTimer.wait_time = look_up_time

func run():
	motion.y =- basic_speed

#func _input(event):
#    if event.is_action_pressed('click'):	
#        target = get_global_mouse_position()

func _physics_process(delta):
	run()
	if state in [States.ALIVE]:
		move_and_slide(motion)
		
	#Colided with something	
	if get_slide_count() > 0: 
		var collision = get_slide_collision(0)
		proces_border_collision(collision)
	
#	look_at(target)
#	velocity = (target - position).normalized() * speed
#    # rotation = velocity.angle()
#	if (target - position).length() > 5:
#		#move_and_slide(velocity)
#		pass

#process collision with clouds
func proces_border_collision(collision):
	if(collision):
		if collision.get_collider().is_in_group("Enemy") and state != States.DEAD:
			end()

func _process(delta):
	if state == States.ALIVE:
		elapsed_time_alive += delta
		increase_speed_over_time()
		
func increase_speed_over_time():
	if (int(elapsed_time_alive) % time_increase) == 0 and basic_speed < max_speed:
		basic_speed += speed_increase_factor


func end():
	state = States.DEAD
	Global.sum_up_game()
	queue_free()
	get_tree().change_scene(Global.GameOver)
	

func _on_LookUpTimer_timeout():
	$Sprite.play("lookup")
	look_up_time = rand_range(min_look_up_value, max_look_up_value)

func _on_Sprite_animation_finished():
	if $Sprite.animation == "lookup":
		$Sprite.play("idle")
		$LookUpTimer.wait_time = look_up_time
