extends Control

@onready var time_label: Label = $Time
@onready var score_label: Label = $Score
@onready var pause_menu: Panel = $"Pause Menu"

var score: int = 0


func update_score():
	score_label.text = "%d" % score


func _on_pause_button_pressed():
	pause_menu.visible = true
	get_tree().paused = true


func _on_resume_button_pressed():
	pause_menu.visible = false
	get_tree().paused = false


func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Main Menu.tscn")
	get_tree().paused = false
