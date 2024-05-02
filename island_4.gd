extends Node2D


func _on_body_entered(body):
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://pirate_exploration.tscn")
