extends Node2D

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
@onready var stats_component = $StatsComponent



func _ready() -> void:
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)


func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().energy += 1
		area.get_parent().energy_bar.value = area.get_parent().energy
		queue_free()
