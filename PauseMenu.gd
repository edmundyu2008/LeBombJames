extends Control
@export var game_stats: GameStats

func resume():
	self.hide()
	get_tree().paused = false
	# Resumes and makes the paused false
	
func pause():
	self.show()
	get_tree().paused = true
	# Pauses and makes the paused true
	
func testEsc():
	if Input.is_action_just_pressed("escape") and !get_tree().paused:
		pause()
		# If the esc button is pressed and it is not paused, it pauses
	elif Input.is_action_just_pressed("escape") and get_tree().paused:
		resume()

func _on_resume_pressed():
	resume()

func _on_restart_pressed():
	resume()
	get_tree().change_scene_to_file("res://UI/countdown.tscn")

func _on_exit_pressed():
	get_tree().paused = false 
	self.visible = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func _process(_delta):
	testEsc()
