extends Node

@onready var timer = %Timer
@onready var timer_label = %TimerLabel
@onready var animation_player = $AnimationPlayer
@onready var countdown_timer = $CountdownTimer
@onready var variable_pitch_audio_stream_player = $VariablePitchAudioStreamPlayer


func _ready():
	animation_player.play("Timer")

func _process(delta):
	countdown_timer.timeout.connect(variable_pitch_audio_stream_player.play_with_variance)
	
func countdown_sound() -> void:
	variable_pitch_audio_stream_player.play_with_variance()

func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://main.tscn")
