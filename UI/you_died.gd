extends Control

@export var game_stats: GameStats

@onready var score_value: Label = %ScoreValue
@onready var highscore_value: Label = %HighScoreValue

func _ready() -> void:
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
	score_value.text = str(game_stats.score)
	highscore_value.text = str(game_stats.highscore)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		game_stats.score = 0
		game_stats.player_health = 3
		game_stats.player_energy = 10
		get_tree().change_scene_to_file("res://UI/main_menu.tscn")
