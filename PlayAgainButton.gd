extends Button

func _on_pressed():
	call_deferred("play_again")

func play_again():
	get_tree().change_scene_to_file("res://pirate_exploration.tscn")
