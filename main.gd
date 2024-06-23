extends Node2D

@export var game_stats: GameStats
@export var player_health_component: PlayerHealthComponent

@onready var plane: Node2D = $Plane
@onready var score_label: Label = $ScoreLabel
@onready var health_label: Label = $HealthLabel

func _ready() -> void:
	randomize()
	update_score_label(game_stats.score)
	game_stats.score_changed.connect(update_score_label)
	update_health_label(player_health_component.health)
	
	plane.tree_exiting.connect(func():
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://UI/you_died.tscn")
		)
		
func update_score_label(new_score: int) -> void:
	score_label.text = "Score: " + str(new_score)

func update_health_label(new_health: int) -> void:
	health_label.text = "Score: " + str(new_health)
