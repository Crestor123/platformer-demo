extends PlayerState

func update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	player.velocity.x = player.wind_resistance

	if direction:
		change_state.emit("walk")
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		change_state.emit("jump")

	# This case is possible because once the wind hits us, we can be moved off an edge.
	if not player.is_on_floor():
		change_state.emit("fall")

func enter():
	player.Anim.play("idle")
