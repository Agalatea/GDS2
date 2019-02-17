extends Node2D

export (PackedScene) var First_Second 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func spawn_transition_background(transition_background, transiton_index):
	#Spawn transition background
	var player_pos = Global.Player.global_position
	var spawn_pos = Vector2()
	spawn_pos.y = player_pos.y - Global.screen_size_y *0.4
	spawn_pos.x = player_pos.x 
	
	var transition = First_Second.instance()
	add_child(transition)
	transition.init(spawn_pos, transition_background, transiton_index)
	
	print("Spawned transition")
	
	