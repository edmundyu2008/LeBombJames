extends Control

@export var tween_intensity: float
@export var tween_duration: float

@onready var playbutton: TextureButton = $PlayButton
@onready var settingsbutton: TextureButton = $SettingsButton
@onready var exitbutton: TextureButton = $ExitButton
@onready var variable_pitch_audio_stream_player = $VariablePitchAudioStreamPlayer
@onready var audio_stream_player = $AudioStreamPlayer


func _process(delta: float) -> void:
	button_hovered(playbutton)
	button_hovered(settingsbutton)
	button_hovered(exitbutton)
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.play()
	# Simple looping audio



func start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)
	#Defines tween function using object, property, final val and duration
	
func button_hovered(button: TextureButton):
	button.pivot_offset = button.size / 2
	if button.is_hovered():
		start_tween(button, "scale", Vector2.ONE * tween_intensity, tween_duration)
	else:
		start_tween(button, "scale", Vector2.ONE, tween_duration)
	# When the button is hovered, it calls the start_tween function which changes the size 



func _on_play_button_pressed():
	variable_pitch_audio_stream_player.play_with_variance()
	await get_tree().create_timer(0.71).timeout
	get_tree().change_scene_to_file("res://UI/countdown.tscn")
	# Plays a sound when the button is pressed and waits before changing the scene

func _on_settings_button_pressed():
	variable_pitch_audio_stream_player.play_with_variance()
	await get_tree().create_timer(0.71).timeout
	get_tree().change_scene_to_file("res://UI/settings.tscn")
	# Plays a sound when the button is pressed and waits before changing the scene

func _on_exit_button_pressed():
	get_tree().quit()
