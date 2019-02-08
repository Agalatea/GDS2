extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	Global.EffectsSound = self 
	if(Global.effects_sound == "on"):
		$effects_btn.pressed = false
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Effects"), false)  
	else:
		$effects_btn.pressed = true
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Effects"), true) 

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_effects_btn_pressed():
	if(Global.effects_sound == "on"):
		$effects_btn.pressed = true
		Global.save_effects_sound("off")
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Effects"), true)  
	else:
		$effects_btn.pressed = false
		Global.save_effects_sound("on")
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Effects"), false)  
