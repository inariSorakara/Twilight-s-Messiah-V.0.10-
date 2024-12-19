extends State
class_name NyaOverworldChoosingRoom

#region REFERENCES
@export var player:PlayerUnit
@export var dialogue_panel:Panel
@export var dialogue_box:Label
@export var dialogue_text:NyaDialogue
@export var room_label:Label
@export var room_panel:Panel
@export var door_sprite:TextureRect
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
	var player_target_room = player.target_room
	if player_target_room != null:
		door_sprite.visible = true
		room_label.text = player_target_room.name
	else:
		door_sprite.visible = false
		room_label.text = "X"
	if Input.is_action_just_pressed("OverworldConfirm"):
		state_transition.emit(self,"ConfirmingRoom")

func Exit():
	pass
#endregion
