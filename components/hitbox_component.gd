class_name HitboxComponent
extends Area2D

@export var damage = 1.0

signal hit_hurtbox(hurtbox)

func _ready():
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: HurtboxComponent):
	if not hurtbox is HurtboxComponent: return
	# When the areas enter it makes sure it is a hurtbox
	if hurtbox.is_invincible: return
	# Makes sure that the hurtbox isn't invincible
	hit_hurtbox.emit(hurtbox)
	# Signals that it hit a hurtbox
	hurtbox.hurt.emit(self)
	# Hurtbox will emit a signal that it was hit
