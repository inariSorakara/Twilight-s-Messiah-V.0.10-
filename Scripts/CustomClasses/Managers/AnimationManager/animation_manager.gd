extends Node
class_name AnimationManager

#region REFERENCES

#endregion

#region GLOBAL VARIABLES
#region Animation Players
@export var transition:AnimationPlayer
#endregion

#region CONSTANTS

#endregion

#region SIGNALS
signal AnimationFinished
#endregion

#region FUNCTIONS
# Called when the node is ready
func _ready() -> void:
	pass

func play_animation(player:String,track:StringName):
	var chosen_animation:AnimationPlayer = AniMan.get_node(player)
	if chosen_animation != null:
		var chosen_track = track
		if chosen_track != null:
			chosen_animation.play(chosen_track)
			await chosen_animation.animation_finished
			AnimationFinished.emit()
			
		else:
			print("Chosen track not found")
	else:
		print("Chosen player not found")
