extends State
class_name PlayerOverworldMoving

#region REFERENCES
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
	AniMan.play_animation("FadeIn_FadeOut", "Fade_Out")
	var next_room:RegularRoom = state_owner.target_room
	var next_position:Vector3 = next_room.middle_of_room.get_middle_position()
	state_owner.global_position = next_position
	await AniMan.AnimationFinished
	AniMan.play_animation("FadeIn_FadeOut", "Fade_In")
	await AniMan.AnimationFinished
	state_transition.emit(self, "Idle")
	var Nya:NyaOverworldUnit = state_owner.Nya
	Nya.NyaFSM.change_state(Nya.NyaFSM.current_state, "Idle")

#endregion
