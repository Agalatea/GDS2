extends Tween

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var state = {
	trans = Tween.TRANS_LINEAR,
	eases = Tween.EASE_IN,
}

func _ready():
	reset_enemy()
	


func reset_enemy():
	var tween = self
	var pos = tween.tell()
	tween.reset_all()
	tween.remove_all()

	var sprite = get_node("Panel/Sprite")
	var size = get_node("Panel").get_size()

	
	tween.interpolate_method(sprite, "set_position", Vector2(size.x/2, size.y), Vector2(size.x/2, -100), 2, state.trans, state.eases)
#	tween.interpolate_property(sprite, "position", Vector2(size.x, size.y), Vector2(0, 0), 2, state.trans, state.eases, 2)

#
#	tween.interpolate_method(sprite, "set_modulate", Color("b2d90a") , Color("b4a90a") , 2, state.trans, state.eases)
#	tween.interpolate_property(sprite, "modulate", Color("b4a90a"), Color("b2d90a"), 2, state.trans, state.eases, 2)
	
	

	
#	tween.interpolate_method(sprite, "set_scale", Vector2(0.5, 0.5), Vector2(1.5, 1.5), 2, state.trans, state.eases)
#	tween.interpolate_property(sprite, "scale", Vector2(1.5, 1.5), Vector2(0.5, 0.5), 2, state.trans, state.eases, 2)


	
#		tween.interpolate_method(sprite, "set_rotation_degrees", 0, 360, 2, state.trans, state.eases)
#		tween.interpolate_property(sprite, "rotation_degrees", 360, 0, 2, state.trans, state.eases, 2)

	
#		tween.interpolate_callback(self, 0.5, "on_callback", "0.5 second's after")
#		tween.interpolate_callback(self, 0.2, "on_callback", "1.2 second's after")

	tween.set_repeat(false)
	tween.start()
	tween.seek(pos)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
