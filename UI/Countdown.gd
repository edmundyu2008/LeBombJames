extends Node

@onready var timer = %Timer
@onready var timer_label = %TimerLabel
@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.play("Timer")
	await animation_player.animation_finished


func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://main.tscn")
