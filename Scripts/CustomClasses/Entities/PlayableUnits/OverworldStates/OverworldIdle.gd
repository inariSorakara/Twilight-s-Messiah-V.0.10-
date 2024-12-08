extends State
class_name OverworldIdle


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

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

func Update(_delta):
	if Input.is_action_just_pressed("OW_Confirm"):
		state_transition.emit(self, "ActionMenu")

func Exit():
	StateExited.emit(self)
#endregion
