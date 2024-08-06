class_name GameStats

extends Resource

@export var score: int = 0 :
	set(value):
		score = value
		score_changed.emit(score)
		
@export var highscore: int = 0

@export var player_health: int = 3 :
	set(value):
		player_health = value
		player_health_changed.emit(player_health)
		
@export var player_energy: int = 10:
	set(value):
		player_energy = value
		player_energy_changed.emit(player_energy)

signal score_changed(new_score)
signal player_health_changed(new_player_health)
signal player_energy_changed(new_player_energy)
