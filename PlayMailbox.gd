extends StaticBody2D

@onready var dialogue_label = $"../DialogueLabel"
var started = false


var dialogue_number: int = 0
var dialogue = [
	"Welcome, new employee. I see you want to get to your job as soon as possible. Interact with the blue mailbox whenever you want to continue this conversation. Or you could select a level up there immediately.",
	"Your task will be to sort as many packages as you can in a given amount of time.",
	"Sounds easy enough, right?",
	"There will be multiple mailboxes placed around the small map.",
	"You will have to pick up the packages from the mailboxes by interacting with them when they have a red popup over them.",
	"Then you will have to put it in the mailbox with the ID that will be shown in the popup above you.",
	"The levels will show you the IDs of the mailboxes for the first 5 seconds, and you will unfortunately have to memorize them.",
	"However, due to the some past inconveniences, you are recommended to check the validity of the package by bringing it to the office.",
	"Some employees minimize checking their validity and try to gain more 'points' as some called it.",
	"Some do not even use the roads.",
	"Well, neither the customers nor delivery men care if you using the roads or not, so it is acceptable.",
	"But if any bad packages are found by the delivery men, and if we receive any complaints...",
	"We will gladly take away half of your points.",
	"Packages, good or bad, can always be discarded at the red bin.",
	"All that we want from you is for the packages to be sorted.",
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
