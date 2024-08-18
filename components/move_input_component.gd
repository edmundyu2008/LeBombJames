class_name MoveInputComponent
extends Node


@export var move_stats: MoveStats
@export var move_component: MoveComponent

func _input(_event: InputEvent) -> void:
	var input_direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	move_component.velocity = input_direction * move_stats.speed

