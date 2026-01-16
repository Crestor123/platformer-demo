extends PlayerState

func update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		player.velocity.x = direction * player.SPEED + player.wind_resistance
		if player.velocity.x >= 0: player.Sprite.flip_h = false
		if player.velocity.x <= 0: player.Sprite.flip_h = true
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		
	if player.is_on_floor():
		change_state.emit("walk")
		
	# Conditionally add degree of gravity.
	if Input.is_action_pressed("jump") and abs(player.velocity.y) < 9.5:
		player.velocity.y += player.get_gravity().y * 0.05 * _delta
	else:
		player.velocity.y += player.get_gravity().y * _delta

	if Input.is_action_just_released("jump"):
		player.velocity.y = 0

func enter():
	player.Anim.play("jump")
	
	player.velocity.y = player.JUMP_VELOCITY
