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
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	update_health_points(game_stats.player_health)
	game_stats.player_health_changed.connect(update_health_points)
	plane.tree_exiting.connect(func():
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://UI/you_died.tscn")
		)
		
func _process(_delta):
	if game_stats.score > game_stats.highscore:
		game_stats.highscore = game_stats.score
		save_load_script._update_highest_score(game_stats.highscore)
	if game_stats.highscore > save_load_script.highest_score:
		save_load_script.highest_score = game_stats.highscore
	high_score_label.text = "Highscore:" + str(save_load_script.highest_score)
	if game_stats.player_health < 2:
		red_overlay.show()
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()


func update_health_points(new_player_health: int) -> void:
	$Hearts.size.x = new_player_health * heart_size

func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)









