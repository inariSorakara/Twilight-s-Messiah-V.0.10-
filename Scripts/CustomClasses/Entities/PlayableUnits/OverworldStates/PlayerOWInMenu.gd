extends State
class_name PlayerOverworldInmenu
#region REFERENCES

#endregion

#region  GLOBAL VARIABLES
var Nya:NyaOverworldUnit
#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	Nya = state_owner.Nya

func Enter():
	Nya.ActionMenu.show()

func Update(_delta):
	if Input.is_action_just_pressed("OverworldNegate"):
		Nya.NyaFSM.force_change_state("Idle")
		await DialogueMan2.dialogue_finished
		state_transition.emit(self, "Idle")
	elif Input.is_action_just_pressed("OverworldMoveAction"):
		Nya.NyaFSM.force_change_state("ChoosingRoom")
		await DialogueMan2.dialogue_finished
		state_transition.emit(self, "Choosing")

func Exit():
	Nya.ActionMenu.hide()

#endregion
