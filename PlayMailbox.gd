extends StaticBody2D

@onready var dialogue_label = $"../DialogueLabel"
var started = false


var dialogue_number: int = 0
var dialogue = [
	"Welcome, new employee. I see you want to get to your job as soon as possible. Interact with the blue mailbox whenever you want to continue this conversation. Or you could select a level up there immediately.",
	"Your task will be to sort as many packages as you can in a given amount of time.",
	"Sounds easy enough, right?",
	"There will be multiple mailboxes placed around the small map.",
	"You will have to pick up the packages from the mailboxes by interacting with them when they have a red popup over them;",
	"Then you will have to check the validity of the package by bringing it to the office;",
	"And then you will finally have to put it in the mailbox with the ID that will be shown in the popup above you.",
	"Remember that you can only carry one package at a time and you are not allowed to put the package in the wrong mailbox.",
	"The levels will show you the IDs of the mailboxes for the first 5 seconds, and you will unfortunately have to memorize which mailbox has which ID.",
	"Some employees minimize checking their validity and try to gain more 'points', as some called it. You can do that too!",
	"But if any bad packages are found by the delivery men, and if we receive any complaints...",
	"We will gladly take away half of your current points.",
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
