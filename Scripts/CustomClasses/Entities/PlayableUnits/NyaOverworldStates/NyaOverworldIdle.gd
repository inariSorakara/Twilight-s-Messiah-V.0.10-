extends State
class_name NyaOverworldIdle


#region REFERENCES

@export var dialogue_panel:Panel
@export var dialogue_box:Label
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
	dialogue_panel.show()
	state_owner.idle_state_dialogue()
	await DialogueMan.dialogue_finished
	dialogue_panel.hide()
	
#endregion
