extends CharacterBody2D

@export var move_speed: float = 200.0
@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("Movement.Right") - Input.get_action_strength("Movement.Left"),
		Input.get_action_strength("Movement.Down") - Input.get_action_strength("Movement.Up")
	)
	
	velocity = input_direction * move_speed
	
	_update_animation_state(input_direction)
	move_and_slide()

func _update_animation_state(input_direction: Vector2):
	if input_direction != Vector2.ZERO:
		state_machine.travel("Movement")
		animation_tree.set("parameters/Movement/blend_position", input_direction)
	else:
		state_machine.travel("Idle")
