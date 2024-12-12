extends State
class_name NyaOverworldChoosingRoom

#region REFERENCES
@export var dialogue_panel:Panel
@export var dialogue_box:Label
@export var dialogue_text:NyaDialogue
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
	var choosing_room_dialogue:Dictionary = dialogue_text.state_dialogues.get("Move_Action")
	var dialogue_randomizer:int = randi_range(0,2)
	var chosen_dialogue:Array = choosing_room_dialogue.get(str(dialogue_randomizer))
	DialogueMan2.show_dialogue(chosen_dialogue,dialogue_box)
	await  DialogueMan2.dialogue_finished
	dialogue_panel.hide()
#endregion
