extends Control

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://gameLevel.tscn")

func _on_quit_pressed():
	get_tree().quit()
