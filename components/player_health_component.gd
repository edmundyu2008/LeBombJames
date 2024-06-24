class_name PlayerHealthComponent
extends Node

@export var player_health: int = 3:
	set(value):
		player_health = value
		player_health_changed.emit()
		if player_health == 0: no_player_health.emit()

signal player_health_changed() 
signal no_player_health() 
