@tool
extends Control
class_name NyaOverworldUnit

#region Global Variables
@export var child_nodes: Array[NodePath] = []
#endregion

#region References
@export var NyaSprite: TextureRect
@warning_ignore("shadowed_global_identifier")
@export var ActionMenu: Control
@export var NyaFSM: FiniteStateMachine
#endregion

#region Constants
const HOVER_AMOUNT: float = 30.0  # Adjust the hover amount as needed
const HOVER_DURATION: float = 1  # Duration in seconds for half of the hover cycle
#endregion

#region Functions

func _ready():
	if Engine.is_editor_hint():
		_update_child_nodes()
	start_hovering()

func start_hovering():
	var tween = create_tween().set_loops()
	tween.tween_property(NyaSprite, "position:y", HOVER_AMOUNT, HOVER_DURATION).as_relative().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(NyaSprite, "position:y", -HOVER_AMOUNT, HOVER_DURATION).as_relative().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _update_child_nodes():
	child_nodes.clear()
	for child in get_children():
		child_nodes.append(child.get_path())

#endregion
