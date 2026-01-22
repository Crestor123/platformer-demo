extends Control

@onready var lblCoins = $VBoxContainer/lblCoins
@onready var lblHealth = $VBoxContainer/lblHealth

func update_score(value: int):
	lblCoins.text = "Coins: " + str(value)

func update_health(value: int):
	lblHealth.text = "Health: " + str(value) + "%"
