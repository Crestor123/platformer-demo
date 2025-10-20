extends Control

@onready var lblCoins = $lblCoins

func update_score(value: int):
	lblCoins.text = "Coins: " + str(value)
