extends Node2D



func _on_back_button_settings_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_apply_pressed():
	AudioServer.set_bus_volume_db(1, linear_to_db($AudioSettings/MusicSlider.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($AudioSettings/SFXSlider.value))
