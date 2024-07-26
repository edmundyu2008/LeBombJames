extends Control

@export var game_stats: GameStats
@export var player_health: int = 3 
var heart_size: int = 50

func player_health_changed(new_player_health: float) -> void:
	$Hearts.rect_min_size.x = new_player_health * heart_size
