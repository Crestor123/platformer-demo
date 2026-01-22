extends PlayerState

func update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		player.velocity.x = direction * player.SPEED
		if player.velocity.x >= 0: player.Sprite.flip_h = false
		if player.velocity.x <= 0: player.Sprite.flip_h = true
		player.velocity.x += player.wind_resistance
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		player.velocity.x = player.wind_resistance
		
	if player.is_on_floor():
		change_state.emit("walk")
		
	# Conditionally add degree of gravity.
	var deltaVel : float = player.get_gravity().y * _delta
	if Input.is_action_pressed("jump") and abs(player.velocity.y) < 9.5:
		deltaVel *= 0.05

	player.velocity.y += deltaVel

	if Input.is_action_just_released("jump") or player.velocity.y == 0.0:
		player.velocity.y = 0
		change_state.emit("fall")

func enter():
	player.Anim.play("jump")
	
	player.velocity.y = player.JUMP_VELOCITY
