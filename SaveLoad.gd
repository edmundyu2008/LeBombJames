class_name saveload

extends Node

const SAVEFILE = "res://highest_score.json"

var highest_score : int
var data = {}

func _ready():
	load_score()
	
func save_score():
	var data = {
		"highestscore": highest_score
	}
	var json = JSON.new()
	var json_string = json.stringify(data)
	var file = FileAccess.open("res://highest_score.json", FileAccess.WRITE)
	file.store_line(json_string)
	file.close()
	# Allows the score to be saved in the file
	
func load_score():
	var file = FileAccess.open("res://highest_score.json", FileAccess.READ)
	var file_data = JSON.parse_string(file.get_as_text())
	file.close()
	data = file_data
	highest_score = data["highestscore"]
	# Loads the score from the file
	
func _update_highest_score(value : int):
	highest_score = value
	save_score()
