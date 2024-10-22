class_name GameStats

extends Resource

@export var score: int = 0 :
	set(value):
		score = value
		score_changed.emit(score)
		
@export var highscore: int = 0

@export var player_health: int = 3:
	set(value):
		player_health = value
		player_health_changed.emit(player_health)


signal player_health_changed(new_player_health)
signal score_changed(new_score)



