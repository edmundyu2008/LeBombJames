class_name PlayerDestroyedComponent
extends Node
@export var actor: Node2D
@export var player_health_component: PlayerHealthComponent


func _ready() -> void:
	player_health_component.no_player_health.connect(destroy)
	
	
func destroy() -> void:
	actor.queue_free()
