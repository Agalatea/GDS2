extends Node2D


signal ballons_destroyed

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func destroy_baloons():
	for ballon in get_children():
		ballon.die()