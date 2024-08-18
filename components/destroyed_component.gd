class_name DestroyedComponent
extends Node
@export var actor: Node2D
@export var stats_component: StatsComponent

func _ready() -> void:
	stats_component.no_health.connect(destroy)

func destroy() -> void:
	actor.drop_crystal()
	actor.queue_free()
