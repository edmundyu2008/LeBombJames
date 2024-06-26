extends Control

var label = Label
var time = Timer


func _ready():
	label = $Label
	time = $Timer
	time.start()


func start_game():
	var time_left = time.time_left
	var second = int(time_left) % 60
	return [second]

func _process(delta):
	label.text = "%01d" % start_game()
	if time.time_left <= 1:
		get_tree().change_scene_to_file("res://main.tscn")
