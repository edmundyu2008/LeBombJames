class_name PlayerHurtComponent
extends Node

@export var player_health_component: PlayerHealthComponent

@export var hurtbox_component: HurtboxComponent

func _ready() -> void:
	hurtbox_component.hurt.connect(func(hitbox_component: HitboxComponent):
		player_health_component.player_health -= hitbox_component.damage
	)	
