extends State
class_name PlayerOverworldRoomConfirming


#region REFERENCES
@export var nya:NyaOverworldUnit
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
	pass

func Update(_delta):
	
	if Input.is_action_just_released("OverworldConfirm"):
		state_transition.emit(self,"Moving")
		nya.NyaFSM.change_state(nya.NyaFSM.current_state, "Moving")
	elif Input.is_action_just_pressed("OverworldNegate"):
		nya.NyaFSM.change_state(nya.NyaFSM.current_state,"Moving")
		await get_tree().create_timer(0.5).timeout
		state_transition.emit(self,"Choosing")
#endregion
