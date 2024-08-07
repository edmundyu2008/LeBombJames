extends Node

class_name PlayerEnergyComponent

@export var player_energy: int = 10:
	set(value):
		player_energy = value
		player_energy_changed.emit()
		if player_energy == 0: no_player_energy.emit()

signal player_energy_changed() 
signal no_player_energy() 
