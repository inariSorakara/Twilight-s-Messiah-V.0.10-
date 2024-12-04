extends Node
class_name SceneManager

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

func load_scene(scene:PackedScene):
	# Remove any existing child scenes
	for child in get_children():
		child.queue_free()

	# Instance and add the new scene
	var new_scene = scene.instantiate()
	add_child(new_scene)

#endregion
