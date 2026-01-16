extends Area2D

@export var wind_resistance_value : float

#This isn't best practice, but it's the easiest way to get the game node
@onready var Game = get_tree().get_root().get_node("Game")

#This function is connected to the body_entered signal of the area2D
func _on_body_entered(_body):
	Game.set_wind_resistance(wind_resistance_value)
