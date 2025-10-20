extends Node2D

@onready var UI = $CanvasLayer/UI

var score = 0

func add_score(value: int):
	score += value
	update_score_ui()

func update_score_ui():
	UI.update_score(score)
	pass
