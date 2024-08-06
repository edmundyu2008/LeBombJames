class_name PlayerEnergy
extends Node

@export var game_stats: GameStats

@export var adjust_energy_amount = 1

func adjust_player_energy(amount:int = adjust_energy_amount):
	game_stats.player_energy -= amount
