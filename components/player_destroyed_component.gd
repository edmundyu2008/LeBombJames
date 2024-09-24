class_name PlayerDestroyedComponent
extends Node
@export var actor: Node2D
@export var player_health_component: PlayerHealthComponent
@export var destroy_effect_spawner_component: SpawnerComponent

func _ready() -> void:
	player_health_component.no_player_health.connect(destroy)

func destroy() -> void:
	destroy_effect_spawner_component.spawn(actor.global_position)
	actor.queue_free()
