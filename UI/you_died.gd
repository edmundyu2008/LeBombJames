extends Control


@export var game_stats: GameStats

@onready var score_value: Label = %ScoreValue
@onready var highscore_value: Label = %HighScoreValue
@onready var audio_stream_player = $AudioStreamPlayer

var save_load_script = saveload.new()

func _ready() -> void:
	save_load_script.load_score()
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	score_value.text = str(game_stats.score)
	highscore_value.text = str(save_load_script.highest_score)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://UI/main_menu.tscn")
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
