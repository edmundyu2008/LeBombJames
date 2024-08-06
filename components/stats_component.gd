class_name StatsComponent
extends Node

@export var health: int = 1:
	set(value):
		health = value
		health_changed.emit()
		if health == 0: no_health.emit()
		
@export var energy: int = 1:
	set(value):
		energy = value
		energy_changed.emit()
		if energy == 0: no_energy.emit()

signal health_changed() 
signal no_health() 
signal energy_changed()
signal no_energy()
