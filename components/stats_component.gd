class_name StatsComponent
extends Node

@export var health: int = 1:
	set(value):
		health = value
		health_changed.emit()
		if health == 0: no_health.emit()
		# Setter connected and signals when the health has changed or it is at 0
		
signal health_changed() 
signal no_health() 


