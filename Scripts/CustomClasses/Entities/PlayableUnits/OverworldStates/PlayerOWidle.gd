extends State
class_name PlayerOverworldIdle


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

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
	print("In Idle State")

func Update(_delta):
	if Input.is_action_just_pressed("OverworldConfirm"):
		state_transition.emit(self, "Choosing")
#endregion
