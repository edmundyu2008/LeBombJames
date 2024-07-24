extends Node

@onready var label = $Label
@onready var timer = $Timer


func _ready():
	timer.start()


func start_game():
	var time_left = timer.time_left
	var second = int(time_left) % 60
	return [second]

func _process(delta):
	label.text = "%01d" % start_game()
	if timer.time_left <= 0:
		get_tree().change_scene_to_file("res://main.tscn")
