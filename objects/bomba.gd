extends Area2D

#This isn't best practice, but it's the easiest way to get the game node
@onready var Game = get_tree().get_root().get_node("Game")

#This function is connected to the on_body_entered signal of the area2D
func _on_body_entered(_body):
	if _body.has_method("modify_health"):
		_body.modify_health(-20) #Deals 20 damage percentage points.
		queue_free()	#Deletes the node and all its children
