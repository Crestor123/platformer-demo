class_name StateMachine extends Node

@export var initial_state: State
var states: Dictionary = {}
var currentState: State

func _ready():
	await get_parent().ready
	for child in get_children():
		if child is State:
			#Assemble a list of all of the available states
			states[child.name.to_lower()] = child
			child.change_state.connect(change_state)
		
	if initial_state:
		currentState = initial_state
		initial_state.enter()
	
func update(delta):
	if currentState:
		currentState.update(delta)
	
func change_state(new_state: String):
	#If the specified state is in the list of states, enter that state
	if states.has(new_state.to_lower()):
		currentState = states[new_state]
		currentState.enter()
	pass
