extends State
class_name NyaOverworldChoosingRoom

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
	var choosing_room_dialogue:Dictionary = dialogue_text.state_dialogues.get("Move_Action")
	var dialogue_randomizer:int = randi_range(0,2)
	var chosen_dialogue:Array = choosing_room_dialogue.get(str(dialogue_randomizer))
	DialogueMan2.show_dialogue(chosen_dialogue,dialogue_box)
	await  DialogueMan2.dialogue_finished
	dialogue_panel.hide()

func Update(_delta):
	await get_tree().create_timer(2).timeout
	if room_panel.visible == false:
		room_panel.show()
	var player_target_room = player.target_room
	if player_target_room != null:
		room_label.text = player_target_room.name
	else:
		room_label.text = "X"
	#room_label.text = player_target_room.name
	#dialogue_box.text = player.target_room.name

#endregion
