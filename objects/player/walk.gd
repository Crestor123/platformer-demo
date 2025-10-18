extends PlayerState

func update(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		player.velocity.x = direction * player.SPEED
		if player.velocity.x >= 0: player.Sprite.flip_h = false
		if player.velocity.x <= 0: player.Sprite.flip_h = true
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		change_state.emit("jump")
	
	if player.velocity.x == 0:
		change_state.emit("idle")
	pass

func enter():
	player.Anim.play("walk")
	pass
