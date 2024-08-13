class_name PlayerEnergy
extends Node

@export var game_stats: GameStats

func adjust_player_energy(amount):
	game_stats.player_energy += amount
