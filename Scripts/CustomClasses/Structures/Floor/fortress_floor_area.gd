extends Area2D
class_name Fortress_Floor

@export var memorias_required:int

#region Signals

signal FloorEntered(floor_data)

signal FloorExited()

#endregion 
#region Functions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	FloorEntered.connect(SignalsBus._on_floor_entered)

func _on_body_entered(body: Node2D) -> void:
	var floor_data:Dictionary = {"Floor_Name":self.name,
	"Memorias_Required": memorias_required}
	if body.name == "PlayerBody":
		FloorEntered.emit(floor_data)
		var player:PlayerUnit = body.get_parent()
		player.player_data.current_floor = self


func _on_body_exited(body: Node2D) -> void:
	FloorExited.emit()

#endregion
