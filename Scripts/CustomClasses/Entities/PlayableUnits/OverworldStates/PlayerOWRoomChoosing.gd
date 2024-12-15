extends State
class_name PlayerOverworldRoomChoosing

#region References
@onready var Nya:NyaOverworldUnit
@export var raycast:RayCast3D
#endregion

#region GLOBAL VARIABLES

# Rotation speed in degrees per action
@export var turn_duration: float = 1.0  # Duration of rotation animation



var initial_rotation 
#endregion

#region FUNCTIONS
# Called when the node is ready
func _ready() -> void:
	Nya = state_owner.Nya

func Enter():
	initial_rotation = state_owner.rotation_degrees.y

func Update(_delta):
	#region Input listener
	if Input.is_action_just_released("OverworldTurnLeft"):
		turn_left()
	elif Input.is_action_just_released("OverworldTurnRight"):
		turn_right()
	elif Input.is_action_just_released("OverworldNegate"):
		Nya.NyaFSM.force_change_state("InMenu")
		state_owner.rotation_degrees.y = initial_rotation
		await DialogueMan2.dialogue_finished
		state_transition.emit(self,"Inmenu")
#endregion

	if raycast.is_colliding():
		state_owner.target_room = raycast.get_collider().get_parent()
	else:
		state_owner.target_room = null



func turn_left():
	start_tween(90)  # Rotate left (counterclockwise)

func turn_right():
	start_tween(-90)  # Rotate right (clockwise)

func start_tween(direction: float):
	var target_rotation = state_owner.rotation_degrees.y + direction
	target_rotation = round(target_rotation / 90.0) * 90.0  # Ensure it's a multiple of 90

	# Create a new tween for this rotation
	var tween = get_tree().create_tween()
	tween.tween_property(
		state_owner,  # The object to animate
		"rotation_degrees:y",  # Property to animate
		target_rotation,  # Final rotation value
		turn_duration  # Duration of the tween
	).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
#endregion
