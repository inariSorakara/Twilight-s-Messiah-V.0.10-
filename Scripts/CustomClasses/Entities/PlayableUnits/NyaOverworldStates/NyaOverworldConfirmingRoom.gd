extends State
class_name NyaOverworldConfirmingRoom

#region REFERENCES
@export var player:PlayerUnit
@export var dialogue_panel:Panel
@export var dialogue_box:Label
@export var dialogue_text:NyaDialogue
@export var room_label:Label
@export var room_panel:Panel
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

	var choosing_room_dialogue:Dictionary = dialogue_text.state_dialogues.get("Confirming_Room")
	var dialogue_randomizer:int = randi_range(0,2)
	var chosen_dialogue:Array = choosing_room_dialogue.get(str(dialogue_randomizer))

	DialogueMan2.show_dialogue(chosen_dialogue,dialogue_box)

	await  DialogueMan2.dialogue_finished
	
	chosen_dialogue = dialogue_text.player_notifications.get("Confirming_Message").get("0")
	DialogueMan2.show_dialogue(chosen_dialogue,dialogue_box)
	
	await DialogueMan2.dialogue_finished
	
	dialogue_panel.hide()

#endregion
