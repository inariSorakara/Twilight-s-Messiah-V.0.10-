@icon("res://Assets/Art/Custom Nodes Icons/StateSprite.png")
class_name State
extends Node

#region REFERENCES
#endregion

#region  GLOBAL VARIABLES

#The owner of the state
@export var state_owner:Node
#endregion

#endregion

#region  SIGNALS

@warning_ignore("unused_signal")
signal state_transition

@warning_ignore("unused_signal")
signal StateEntered(state)

@warning_ignore("unused_signal")
signal StateExited(state)
#endregion

#region FUNCTIONS
func Enter():
	pass
	
func Exit():
	pass
	
func Update(_delta:float):
	pass

#endregion
