extends CanvasLayer


export var unlock_2 = 250
export var unlock_3 = 1000
export var unlock_4 = 2000



func _ready():
	set_pig_texts()
	$MenuTap.stream = Global.menu_tap_sound
	$HBoxContainer/BestScore.text = str(Global.highscore)
	$HBoxContainer2/SumScore.text = str(Global.sum_score)
	
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_pig_texts():
	$PigOneButton.text = "Unlocked"
	$PigTwoButton.text = "Fly "+ str(unlock_2)
	if (Global.highscore > unlock_2):
		Global.pig_2_unlocked = 1
		$PigTwoButton.text = "Ulocked"
	$PigThreeButton.text = "Fly "+ str(unlock_3)
	if (Global.highscore > unlock_3):
		Global.pig_3_unlocked = 1
		$PigThreeButton.text = "Ulocked"
	$PigFourButton.text = "Fly "+ str(unlock_4)
	if (Global.highscore > unlock_4):
		Global.pig_4_unlocked = 1
		$PigFourButton.text = "Ulocked"
	
	if(Global.active_pig == 1) :
		$PigOneButton.text = "Active"
	elif(Global.active_pig == 2) :
	 	$PigTwoButton.text = "Active"
	elif(Global.active_pig == 3) :
	 	$PigThreeButton.text = "Active"
	elif(Global.active_pig == 4) :
	 	$PigFourButton.text = "Active"

func _on_TextureButton_pressed():
	$MenuTap.play()
	get_tree().change_scene(Global.Menu)


func _on_PigOneButton_pressed():
	$MenuTap.play()
	Global.active_pig = 1
	Global.save()
	set_pig_texts()


func _on_PigTwoButton_pressed():
	$MenuTap.play()
	if(Global.pig_2_unlocked == 1):
		Global.active_pig = 2
		Global.save()
	set_pig_texts()


func _on_PigThreeButton_pressed():
	$MenuTap.play()
	if(Global.pig_3_unlocked == 1):
		Global.active_pig = 3
		Global.save()
	set_pig_texts()

func _on_PigFourButton_pressed():
	$MenuTap.play()
	if(Global.pig_4_unlocked == 1):
		Global.active_pig = 4
		Global.save()
	set_pig_texts()
