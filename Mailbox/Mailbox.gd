extends StaticBody2D

@export var id: int = 0
@export var mailbox_amount: int = 0
@onready var timer: Timer = $"Alert Timer"
@onready var ui = $"../UI"
@onready var state_machine = $AnimationTree.get("parameters/playback")
var held_package: Package = Package.new()


func _on_interacted(package):
	if package.receiver == 0 and held_package.receiver != 0:
		# Player does not have a package but we do
		package.receiver = held_package.receiver
		package.is_bad = held_package.is_bad
		held_package.reset()
		state_machine.travel("Idle")
		timer.start()
		return
	
	if package.receiver == id:
		if package.is_bad:
			ui.score -= 20
			if ui.score < 0:
				ui.score = 0
		else:
			ui.score += 40
		
		ui.update_score()
		package.reset()


func _on_timeout():
	held_package.receiver = randi_range(1, mailbox_amount)
	held_package.is_bad = randi_range(0, 3) == 1
	state_machine.travel("Mailbox Bounce")
