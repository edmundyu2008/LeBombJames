class_name StatsComponent
extends Node

@export var health: int = 1:
	set(value):
		health = value
		health_changed.emit()
		if health == 0: no_health.emit()

@export var player_energy: int = 10:
	set(value):
		player_energy = value
		player_energy_changed.emit()
		if player_energy == 0: no_player_energy.emit()

signal player_energy_changed() 
signal no_player_energy() 

signal health_changed() 
signal no_health() 


