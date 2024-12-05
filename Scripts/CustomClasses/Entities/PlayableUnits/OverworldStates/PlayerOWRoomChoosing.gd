extends State
class_name PlayerOverworldRoomChoosing

#region GLOBAL VARIABLES

# Rotation speed in degrees per action
@export var turn_duration: float = 1.0  # Duration of rotation animation
#endregion

#region FUNCTIONS
# Called when the node is ready
func _ready() -> void:
	pass

func Enter():
	print("In Choosing State")

func Update(_delta):
	if Input.is_action_just_released("OverworldTurnLeft"):
		turn_left()
	elif Input.is_action_just_released("OverworldTurnRight"):
		turn_right()

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