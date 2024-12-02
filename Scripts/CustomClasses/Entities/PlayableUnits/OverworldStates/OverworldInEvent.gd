extends State
class_name OverworldInEvent

#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

#endregion

#region  SIGNALS

#Signals an event starting
signal PlayerEntersEvent(current_room)
#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	#From state
	StateEntered.connect(SignalsBus._on_player_has_entered_state)
	StateExited.connect(SignalsBus._on_player_has_exited_state)
	PlayerEntersEvent.connect(SignalsBus._on_player_enters_event)

func Enter():
	StateEntered.emit(self)
	state_owner.event_mode = true
	PlayerEntersEvent.emit(state_owner.player_data.current_room)

func Update(_delta):
	pass

func Exit():
	StateExited.emit(self)

#endregion
