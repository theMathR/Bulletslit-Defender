extends Control



func _on_close_settings_pressed():
	hide()

func _process(delta):
	$HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("music")))
	$HSlider2.value = db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("sfx")))


func _on_h_slider_drag_ended(value_changed):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("music"), linear_to_db($HSlider.value))


func _on_h_slider_2_drag_ended(value_changed):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("sfx"), linear_to_db($HSlider2.value))
