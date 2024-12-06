extends Node3D
class_name NyaOverworldUnit

#region Global Variables
#endregion

#region References
@export var sprite3d: Sprite3D
@export var dialogue_label:Label
@export var dialogue:NyaDialogue

#endregion

#region Constants
const HOVER_AMOUNT: float = 3.0 # Adjust the hover amount as needed
const HOVER_DURATION: float = 1  # Duration in seconds for half of the hover cycle
#endregion

#region Signals

#endregion

#region Functions


func _ready():
	start_hovering()

func start_hovering():
	var tween = create_tween().set_loops()
	tween.tween_property(sprite3d, "position:y", HOVER_AMOUNT, HOVER_DURATION).as_relative().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(sprite3d, "position:y", -HOVER_AMOUNT , HOVER_DURATION).as_relative().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

#region Dialogue functions

func idle_state_dialogue():
	if dialogue and dialogue.player_states.has("Idle"):
		var idle_dialogues = dialogue.player_states["Idle"]
		DialogueMan.show_dialogue(dialogue_label, idle_dialogues)
	else:
		print("DialogueManager: No 'Idle' dialogues found in the dialogue script.")

#endregion
