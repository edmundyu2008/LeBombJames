class_name MoveInputComponent
extends Node


@export var move_stats: MoveStats
@export var move_component: MoveComponent

func _input(_event: InputEvent) -> void:
	var input_direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left"):
		input_direction.y = 0
	elif Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		input_direction.x = 0
	else:
		input_direction = Vector2.ZERO
	move_component.velocity = input_direction * move_stats.speed

