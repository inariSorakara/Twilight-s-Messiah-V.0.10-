extends State
class_name PlayerOverworldInEvent


#region REFERENCES
#endregion

#region  GLOBAL VARIABLES
var current_room:RegularRoom
#endregion

#region  CONSTANTS

#endregion

#region  STATE MACHINES

#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	pass
	
func Enter():
	current_room = state_owner.current_room
		
#endregion
