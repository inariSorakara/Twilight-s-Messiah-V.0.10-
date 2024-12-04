extends Node3D
class_name Position3D


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	pass

func get_middle_position() -> Vector3:
	return global_transform.origin

#endregion
