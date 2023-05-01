extends StaticBody2D

@export var scene_path: String


func _on_interacted(_package):
	get_tree().change_scene_to_file(scene_path)
