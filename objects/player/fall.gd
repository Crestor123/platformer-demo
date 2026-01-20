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
		
	# Apply gravity.
	player.velocity.y += player.get_gravity().y * _delta

func enter():
	player.Anim.play("jump")
