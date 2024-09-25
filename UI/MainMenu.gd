extends Control

@export var tween_intensity: float
@export var tween_duration: float

@onready var playbutton: Button = $PlayButton
@onready var settingsbutton: Button = $SettingsButton
@onready var exitbutton: Button = $ExitButton

func _process(delta: float) -> void:
	button_hovered(playbutton)
	button_hovered(settingsbutton)
	button_hovered(exitbutton)

func start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)
	
func button_hovered(button: Button):
	button.pivot_offset = button.size / 2
	if button.is_hovered():
		start_tween(button, "scale", Vector2.ONE * tween_intensity, tween_duration)
	else:
		start_tween(button, "scale", Vector2.ONE, tween_duration)
	



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://UI/countdown.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://UI/settings.tscn")

func _on_exit_button_pressed():
	get_tree().quit()
