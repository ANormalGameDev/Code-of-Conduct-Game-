extends Node2D

@export var time: int = 65

@onready var time_label = $"UI/Time"
@onready var timer: Timer = $Timer


func _on_timer_timeout():
	time -= 1
	time_label.text = "%d" % time
	if time == 0:
		# Game End
		get_tree().paused = true
