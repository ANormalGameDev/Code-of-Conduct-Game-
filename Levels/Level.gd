extends Node2D

@export var time: int = 65
@export var start_time: int = 60

@onready var time_label = $"UI/Time"
@onready var timer: Timer = $Timer
@onready var game_end_screen = $"UI/Game End Screen"
@onready var game_end_score_label = $"UI/Game End Screen/Score"

func _ready():
	time_label.text = "%d" % time

func _on_timer_timeout():
	time -= 1
	time_label.text = "%d" % time
	if time == 0:
		# Game End
		game_end_screen.visible = true
		game_end_score_label.text = "Score: %d" % $UI.score
		get_tree().paused = true
	elif time == start_time:
		$Info.queue_free()
