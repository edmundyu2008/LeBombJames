extends Control
@export var game_stats: GameStats


func resume():
	self.hide()
	get_tree().paused = false
	
	
func pause():
	self.show()
	get_tree().paused = true
	
func testEsc():
	if Input.is_action_just_pressed("escape") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused:
		resume()

		


func _on_resume_pressed():
	resume()


func _on_restart_pressed():
	resume()
	get_tree().change_scene_to_file("res://UI/countdown.tscn")
	game_stats.score = 0
	game_stats.player_health = 3
	game_stats.player_energy = 10


func _on_exit_pressed():
	get_tree().paused = false 
	self.visible = false
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func _process(_delta):
	testEsc()
