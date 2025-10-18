extends CharacterBody2D

@onready var Sprite = $Sprite2D
@onready var Anim = $AnimationPlayer
@onready var States = $States

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	States.update(delta)
	
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()
