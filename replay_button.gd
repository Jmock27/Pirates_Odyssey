extends Button

func _on_pressed():
	call_deferred("replay_level")

func replay_level():
	get_tree().change_scene_to_file("res://island_exploration.tscn")
