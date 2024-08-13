extends Node2D

@export var game_stats: GameStats

@onready var energy_bar: = $EnergyBar
@onready var hearts: TextureRect = $Hearts
@onready var plane: Node2D = $Plane
@onready var score_label: Label = $ScoreLabel

var heart_size = 254
var energy_bar_size = 20

func _ready() -> void:
	randomize()
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	update_health_points(game_stats.player_health)
	game_stats.player_health_changed.connect(update_health_points)
	update_energy_points(game_stats.player_energy)
	game_stats.player_energy_changed.connect(update_energy_points)
	plane.tree_exiting.connect(func():
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://UI/you_died.tscn")
		)
	

func update_health_points(new_player_health: int) -> void:
	$Hearts.size.x = new_player_health * heart_size
	
func update_energy_points(new_player_energy: int) -> void:
	$EnergyBar.size.x = new_player_energy * energy_bar_size

func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)





