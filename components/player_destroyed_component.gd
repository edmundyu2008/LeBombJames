class_name PlayerDestroyedComponent
extends Node
@export var actor: Node2D
@export var player_health_component: PlayerHealthComponent
@export var player_energy_component: PlayerEnergyComponent

func _ready() -> void:
	player_health_component.no_player_health.connect(destroy)
	player_energy_component.no_player_energy.connect(destroy)
	
func destroy() -> void:
	actor.queue_free()
