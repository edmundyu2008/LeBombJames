extends Area2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var sprite_2d = $Sprite2D


func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)



func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().gain_energy(1)
		queue_free()
