extends CharacterBody2D

@onready var Sprite = $Sprite2D
@onready var Anim = $AnimationPlayer
@onready var States = $States

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var wind_resistance : float = 0
var init_gravity = true
var wind_resistance_0 : float = 0.0

func _physics_process(delta):
	States.update(delta)
	
	if is_on_floor():
		init_gravity = false
	
	# Add gravity.
	if not is_on_floor() and init_gravity:
		velocity += get_gravity() * delta

	# Add wind resistance with periodic effects.
	wind_resistance = wind_resistance_0 * (1.0 + 1.1*cos(Time.get_ticks_msec()*delta))

	move_and_slide()

func set_wind_resistance(value : float):
	wind_resistance_0 = value
	wind_resistance = value
