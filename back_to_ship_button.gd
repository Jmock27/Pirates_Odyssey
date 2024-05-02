extends Button

func _on_pressed():
	call_deferred("return_to_ship")

func return_to_ship():
	get_tree().change_scene_to_file("res://gameLevel.tscn")
