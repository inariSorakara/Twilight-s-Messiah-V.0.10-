extends Control
class_name HUD

#region REFERENCES
@export_group("HUD Labels")
@export_subgroup("Turn related")
@export var current_turn_label:Label
@export var doom_counter_label:Label
@export_subgroup("Room related")
@export var coordinate_label:Label
@export var event_label:Label
@export_subgroup("Floor related")
@export var floor_label:Label
@export_subgroup("Player related")
@export var player_memorias_label:Label
@export var player_health_label:Label
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
#endregion
