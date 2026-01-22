extends Node2D

@onready var UI = $CanvasLayer/UI
@onready var Player = $Player

var score = 0
var health = 100

## New function because the health is a dynamic property from the player.
func _ready():
	Player.death.connect(do_death)
	Player.deltaHealth.connect(do_delta_in_health)
	pass

## Functions to update the score.
func add_score(value: int):
	score += value
	update_score_ui()

func update_score_ui():
	UI.update_score(score)
	pass

## Functions to update the health.
func do_death():
	health = -67
	update_health_ui()

func do_delta_in_health(value: int):
	health = value
	update_health_ui()

func update_health_ui():
	UI.update_health(health)
	pass

func set_wind_resistance(value : float):
	Player.set_wind_resistance(value)
