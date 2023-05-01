extends StaticBody2D

@export var package_discarded_sound: AudioStream

@onready var stream_player = $AudioStreamPlayer2D
@onready var state_machine = $AnimationTree.get("parameters/playback")


func _on_interacted(package):
	if package.receiver == 0:
		return
	
	stream_player.stream = package_discarded_sound
	stream_player.play()
	
	package.reset()
	state_machine.travel("Bounce")
