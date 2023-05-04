extends CharacterBody2D

@export var move_speed: float = 200.0
@export var main_menu: bool = false

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")
@onready var info_label: Label

var current_interaction
var last_interact = false
var held_package: Package = Package.new()


func _ready():
	if not main_menu:
		info_label = $"Popup/Label"


func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("Movement.Right") - Input.get_action_strength("Movement.Left"),
		Input.get_action_strength("Movement.Down") - Input.get_action_strength("Movement.Up")
	)
	
	velocity = input_direction * move_speed
	
	_update_animation_state(input_direction)
	_handle_interactions()
	move_and_slide()


func _update_animation_state(input_direction: Vector2):
	if input_direction != Vector2.ZERO:
		state_machine.travel("Movement")
		animation_tree.set("parameters/Movement/blend_position", input_direction)
	else:
		state_machine.travel("Idle")


func _handle_interactions():
	if Input.get_action_raw_strength("Interactions.Interact"):
		if current_interaction != null and last_interact != true:
			current_interaction.interact(held_package)
			if not main_menu:
				if held_package.receiver == 0:
					info_label.text = "-"
				else:
					info_label.text = "%d" % held_package.receiver
		last_interact = true
	else:
		last_interact = false


func _on_interaction_area_entered(area):
	current_interaction = area


func _on_interaction_area_exited(_area):
	current_interaction = null
