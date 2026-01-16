extends Node2D

@onready var UI = $CanvasLayer/UI
@onready var Player = $Player

var score = 0

func add_score(value: int):
	score += value
	update_score_ui()

func update_score_ui():
	UI.update_score(score)
	pass

func set_wind_resistance(value : float):
	Player.set_wind_resistance(value)
