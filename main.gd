extends Node2D

@export var game_stats: GameStats

@onready var hearts: TextureRect = $Hearts
@onready var plane: Node2D = $Plane
@onready var high_score_label = $VBoxContainer/HighScoreLabel
@onready var score_label = $VBoxContainer/ScoreLabel
@onready var red_overlay: TextureRect = $RedOverlay
@onready var audio_stream_player = $AudioStreamPlayer

var save_load_script = saveload.new()
var heart_size = 254

func _ready() -> void:
	save_load_script.load_score()
	game_stats.score = 0
	game_stats.player_health = 3
	red_overlay.hide()
	randomize()
	# Sets the game up by setting everything to the correct values
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	# Updates scores label by calling the function
	update_health_points(game_stats.player_health)
	game_stats.player_health_changed.connect(update_health_points)
	# Updates player health label by calling the function
	plane.tree_exiting.connect(func():
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://UI/you_died.tscn")
		)
	# If the player queue frees, it starts a timer and will change the scene
	
func _process(_delta):
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_load_script._update_highest_score(game_stats.highscore)
		# Checks constantly is the score is greater than the highscore, if it is, then 
		# the highscore will be set to the current score and is saved to a file
	if game_stats.highscore > save_load_script.highest_score:
		save_load_script.highest_score = game_stats.highscore
		# If the current highscore is greater than the saved score found in the file
		# it sets the files score to the current highscore
	high_score_label.text = "Highscore:" + str(save_load_script.highest_score)
	# The highscore is displayed using the numbers in the file where the highest score is saved
	if game_stats.player_health < 2:
		red_overlay.show()
		# The red overlay only shows when the player's health is less than 2
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
		# Simple looping script for the background audio

func update_health_points(new_player_health: int) -> void:
	$Hearts.size.x = new_player_health * heart_size
	# The hearts size is multiplied by the player health so it shows 3 hearts tiles at 3 health
	
func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)









