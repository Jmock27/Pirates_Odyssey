extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	pass
	


func _on_body_entered(body):
	call_deferred("change_scene")

func change_scene():
	get_tree().change_scene_to_file("res://pirate_exploration.tscn")
