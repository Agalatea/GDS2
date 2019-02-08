extends Node2D


var sound_on
var sound_off

func _ready():
	Global.BackgroundSound = self 
	if(Global.background_sound == "on"):
		$bgm_button.pressed = false
		$BGM.play()
	else:
		$bgm_button.pressed = true
		$BGM.stop()

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
