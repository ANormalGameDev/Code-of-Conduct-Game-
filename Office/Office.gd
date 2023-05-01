extends StaticBody2D

@export var processing_sound: AudioStream

@onready var timer: Timer = $Timer
@onready var state_machine = $AnimationTree.get("parameters/playback")
@onready var stream_player = $AudioStreamPlayer2D

var held_package: Package = Package.new()
var processing = false


func _on_interacted(package):
	if processing:
		return
	
	var tmp_receiver = held_package.receiver
	var tmp_bad = held_package.is_bad
		
	held_package.receiver = package.receiver
	held_package.is_bad = package.is_bad
	package.receiver = tmp_receiver
	package.is_bad = tmp_bad
	
	if held_package.receiver == 0:
		state_machine.travel("Idle")
		return
	
	processing = true
	timer.start()
	state_machine.travel("Processing")
	stream_player.stream = processing_sound
	stream_player.play()


func _on_timeout():
	processing = false
	if held_package.is_bad:
		state_machine.travel("Bad Package")
	else:
		state_machine.travel("Good Package")
	stream_player.stop()
