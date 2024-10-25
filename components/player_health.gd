class_name PlayerHealth
extends Node

@export var game_stats: GameStats

@export var adjust_amount = 1


func adjust_player_health(amount:int = adjust_amount):
	game_stats.player_health -= amount
	# Function that is called to activate this component, it
	# uses the adjust_amount when called
