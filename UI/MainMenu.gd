extends Control



func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://UI/countdown.tscn")
	

	


func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://UI/settings.tscn")



func _on_exit_button_pressed():
	get_tree().quit()
