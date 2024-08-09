class_name PlayerEnergy
extends Node

@export var game_stats: GameStats

@export var adjust_amount = 1

func lose_player_energy(amount:int = adjust_amount):
	game_stats.player_energy -= amount
	
func gain_player_energy(amount:int = adjust_amount):
	game_stats.player_energy += amount
