extends Node3D
class_name RegularRoom

#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

@export var room_custom_resource:RegularRoomData
@export var middle_of_room:Position3D
@export var event_state_machine:FiniteStateMachine
#endregion

#region FUNCTIONS

func _ready() -> void:
	pass

###Presents the event_screen
##func event_presenter(event_sprite):
	##NodBus.event_screen.show()
	##NodBus.event_sprite.texture = load(event_sprite)
	##NodBus.event_text_box.text = ""
##
###Concludes the event
##func event_concluder():
	##NodBus.event_screen.hide()
	##NodBus.event_sprite.texture = null
	##NodBus.event_text_box.text = ""
	##NodBus.event_text_box.hide()

func _on_area_3d_body_entered(body: Node3D) -> void:
	var player:PlayerUnit = body
	player.current_room = self
	player.Hud.coordinate_label.text = name
	if event_state_machine.current_state:
		player.Hud.event_label.text = event_state_machine.current_state.name
	else:
		player.Hud.event_label.text = "???"

func room_event_randomizer():
	# Get all possible events (children of the event state machine)
	var possible_events: Array = event_state_machine.get_children()

	# Ensure there are events to randomize
	if possible_events.is_empty():
		print("No events available in the event state machine.")
		return

	# Generate a random index based on the size of possible events
	var random_room: int = randi_range(0, possible_events.size() - 1)

	# Set the current state to the randomly selected event
	event_state_machine.current_state = possible_events[random_room]

	print("Randomly selected event:", event_state_machine.current_state)

func trigger_event():
	pass
