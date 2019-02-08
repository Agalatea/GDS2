extends Node2D


func _ready():
	Global.BackgroundSound = self 
	if(Global.background_sound == "on"):
		$bgm_button.pressed = false
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)  
	else:
		$bgm_button.pressed = true
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), true)  

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_bgm_button_pressed():
	if(Global.background_sound == "on"):
		$bgm_button.pressed = true
		Global.save_background_sound("off")
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), true)  
	else:
		$bgm_button.pressed = false
		Global.save_background_sound("on")
		AudioServer.set_bus_mute(AudioServer.get_bus_index("BGM"), false)  
