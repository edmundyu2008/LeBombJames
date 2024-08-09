extends StatsComponent

@export var player_health: int = 3:
	set(value):
		health = value
		player_health_changed.emit(player_health_changed)
		if player_health == 0: player_no_health.emit()

@export var player_energy: int = 10:
	set(value):
		player_energy = value
		player_energy_changed.emit(player_energy_changed)
		if player_energy == 0: player_no_energy.emit()

signal player_health_changed(new_health) 
signal player_no_health() 
signal player_energy_changed(new_energy)
signal player_no_energy()
