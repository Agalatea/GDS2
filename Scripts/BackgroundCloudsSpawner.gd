extends Node2D

export (int) var min_look_up_value = 4
export (int) var max_look_up_value = 10
var spawn_period = 1


var background = preload("res://Scenes/CloudBackground.tscn")


func _ready():
	randomize()
	spawn_period = rand_range(min_look_up_value, max_look_up_value)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func spawn_cloud_background(position):
	
	var cloud_bg = background.instance()
	add_child(cloud_bg)
	cloud_bg.init(position)
	
	spawn_period = rand_range(min_look_up_value, max_look_up_value)
	$CloudSpawnTimer.wait_time = spawn_period

func _on_CloudSpawnTimer_timeout():
	if Global.Gamestate.game_state != Global.Gamestate.States.SPACE_STAGE:
		var player_pos = Global.Player.global_position
		var spawn_pos = Vector2()
		spawn_pos.y = player_pos.y - Global.screen_size_y
		spawn_pos.x = player_pos.x
		spawn_cloud_background(spawn_pos)
	
	
