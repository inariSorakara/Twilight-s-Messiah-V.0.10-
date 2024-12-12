extends State
class_name PlayerOverworldIdle


#region REFERENCES
var Nya:NyaOverworldUnit
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
	Nya = state_owner.Nya

func Enter():
	pass

func Update(_delta):
	if Input.is_action_just_pressed("OverworldConfirm"):
		Nya.NyaFSM.force_change_state("Inmenu")
		await DialogueMan2.dialogue_finished
		state_transition.emit(self, "Inmenu")
#endregion
