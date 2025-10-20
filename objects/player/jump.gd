extends PlayerState

func update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		player.velocity.x = direction * player.SPEED
		if player.velocity.x >= 0: player.Sprite.flip_h = false
		if player.velocity.x <= 0: player.Sprite.flip_h = true
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
		
	if player.is_on_floor():
		change_state.emit("walk")

func enter():
	player.Anim.play("jump")
	
	player.velocity.y = player.JUMP_VELOCITY
