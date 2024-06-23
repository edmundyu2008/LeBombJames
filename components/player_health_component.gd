class_name PlayerHealthComponent
extends Node

@export var stats_component: StatsComponent

@export var adjust_amount = 1

func adjust_health(amount:int = adjust_amount):
	stats_component.health -= amount
