extends StaticBody2D

@onready var dialogue_label = $"../DialogueLabel"
var started = false


var dialogue_number: int = 0
var dialogue = [
	"Welcome, new employee. I see you want to get to your job as soon as possible. Interact with the blue mailbox whenever you want to continue this conversation. Or you could select a level up there immediately.",
	"Your task will be to deliver as many packages as you can in a given amount of time.",
	"Sounds easy enough, right?",
	"There will be multiple mailboxes placed around the small map.",
	"You will have to pick up the packages from the mailboxes by interacting with them when they have a red popup over them.",
	"Then you will have to deliver it to the appropriate mailbox whose id will be shown in the popup above you.",
	"However, due to the some past incidents, you are recommended to check the validity of the package by bringing it to the office.",
	"Some employees minimize checking their validity and try to gain more 'points' as some called it.",
	"Some do not even use the roads.",
	"So, if any bad packages are delivered, and if we receive any complaints...",
	"We will take away some of your points.",
	"Bad packages can always be discarded at the red bin.",
	"Good luck."
]


func _on_interacted(_package):
	if not started:
		started = true
	else:
		if dialogue_number < dialogue.size() - 1:
			dialogue_number += 1
		else:
			dialogue_label.text = ""
			return
	
	$"../SceneLoaderMailbox".visible = true
	$"../SceneLoaderMailbox2".visible = true
	$"../SceneLoaderMailbox3".visible = true
	
	dialogue_label.text = dialogue[dialogue_number]
