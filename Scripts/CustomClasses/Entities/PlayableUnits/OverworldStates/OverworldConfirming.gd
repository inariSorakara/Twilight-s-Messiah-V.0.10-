extends State
class_name OverworldConfirming


#region REFERENCES
@export var Player_Sprite:Sprite2D
#endregion

#region  GLOBAL VARIABLES
var is_moving:bool = false
#endregion

#region  SIGNALS
signal reset_position
#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	StateEntered.connect(SignalsBus._on_player_has_entered_state)
	StateExited.connect(SignalsBus._on_player_has_exited_state)

func Enter():
	StateEntered.emit(self)

func Exit():
	StateExited.emit(self)
	
func _physics_process(delta: float) -> void:
	if is_moving == false:
		return
	if Player_Sprite.global_position == state_owner.global_position:
		is_moving = false
		return
	Player_Sprite.global_position = Player_Sprite.global_position.move_toward(state_owner.global_position,1)

func Update(_delta):
	if Input.is_action_just_pressed("OW_Confirm"):
		is_moving = true
		state_transition.emit(self, "InEvent")
	
	elif Input.is_action_just_pressed("OW_Negate"):
			reset_position.emit()
			state_transition.emit(self, "Moving")
#endregion
