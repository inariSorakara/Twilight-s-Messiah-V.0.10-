extends State
class_name OverworldMoving


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES
@export var PlayerIndicator:Sprite2D

@export var PlayerSprite:Sprite2D

#Starting position when moving

var starting_position:Vector2
#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	StateEntered.connect(SignalsBus._on_player_has_entered_state)
	StateExited.connect(SignalsBus._on_player_has_exited_state)

func Enter():
	StateEntered.emit(self)

	starting_position = state_owner.global_position

	PlayerIndicator.show()

func Update(_delta):
	#region Movement Handler
	if Input.is_action_just_released("OW_Move_Up"):
		overworld_move(Vector2.UP)
	elif Input.is_action_just_released("OW_Move_Down"):
		overworld_move(Vector2.DOWN)
	elif Input.is_action_just_released("OW_Move_Left"):
		overworld_move(Vector2.LEFT)
	elif Input.is_action_just_released("OW_Move_Right"):
		overworld_move(Vector2.RIGHT)
	elif Input.is_action_just_pressed("OW_Negate"):
		reset_position()
		state_transition.emit(self, "ActionMenu")
	elif Input.is_action_just_pressed("OW_Confirm"):
		state_transition.emit(self, "ConfirmingNewRoom")

func Exit():
	StateExited.emit(self)

#Handles Overworld Movement
func overworld_move(direction:Vector2):
	var current_position:Vector2i = state_owner.global_position
	
	@warning_ignore("narrowing_conversion")
	
	var target_position:Vector2i = Vector2i(current_position.x + direction.x * 64,
	direction.y * 64 + current_position.y)
	
	state_owner.global_position = target_position
	
	PlayerSprite.global_position = starting_position

func reset_position():
	state_owner.global_position = starting_position

func _on_confirming_new_room_reset_position() -> void:
	reset_position()
#endregion
