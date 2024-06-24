extends StatsComponent

@export var player_health: int = 3:
	set(value):
		health = value
		player_health_changed.emit(player_health_changed)
		if player_health == 0: player_no_health.emit()

signal player_health_changed(new_health) 
signal player_no_health() 
