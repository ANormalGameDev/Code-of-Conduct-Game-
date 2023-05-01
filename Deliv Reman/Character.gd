extends CharacterBody2D

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("Movement.Right") - Input.get_action_strength("Movement.Left"),
		Input.get_action_strength("Movement.Down") - Input.get_action_strength("Movement.Up")
	)
