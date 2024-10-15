extends Control


func _ready():
	$MusicSlider.value = db_to_linear(AudioServer.get_bus_volume_db(1))
	$SFXSlider.value = db_to_linear(AudioServer.get_bus_volume_db(2))

func _process(delta):
	pass


func _on_sfx_slider_mouse_exited():
	release_focus()


func _on_music_slider_mouse_exited():
	release_focus()
