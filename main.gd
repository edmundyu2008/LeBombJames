extends Node2D

@export var game_stats: GameStats

@onready var hearts: TextureRect = $Hearts
@onready var plane: Node2D = $Plane
@onready var score_label: Label = $ScoreLabel
@onready var health_label: Label = $HealthLabel

var heart_size = 254

func _ready() -> void:
	randomize()
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	update_health_label(game_stats.player_health)
	game_stats.player_health_changed.connect(update_health_label)
	plane.tree_exiting.connect(func():
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://UI/you_died.tscn")
		)
	

func update_health_label(new_player_health: int) -> void:
	health_label.text = "Health: " + str(new_player_health)
	$Hearts.size.x = new_player_health * heart_size
	
func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)





