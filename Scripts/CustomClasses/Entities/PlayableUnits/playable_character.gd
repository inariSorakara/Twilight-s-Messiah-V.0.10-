extends Node2D
class_name PlayerUnit

#region REFERENCES

@export_category("Resource Related")

#The player's data custom resource
@export var player_data:PlayerData


#The player's origin (class) custom resource
@export var player_origin:PlayableOrigin

@export_category("Node References")

#The state machine node for the player scene
@export var FSM:FiniteStateMachine
#endregion


#region  GLOBAL VARIABLES

#region METADATA player information

#If the player isn't on this mode, events shouldn't trigger.

var event_mode:bool

#endregion

#region  SIGNALS

#The player health has been set up
signal HPSetUp(PlayerMaxHP,PlayerCurrentHP)

#The player memoria has been set up
signal MemoriaSetUp(total_memorias, current_memorias)

#The player Maximum Health has been calculated
signal MaxHPCalulated(PlayerMaxHP)

#The player has chosen a new room (The player has pressed Enter (or the touchscreen button) while over a different room)
signal NewRoomEntered

#Decided between staying on the current floor or moving to the next one.
signal MovingFloorsDecided

#Decided between entering an Amethyst room or not
signal AmethystRoomDecided

##endregion

##An event has started
#func _on_event_started():
	##Changes the current state to "InEvent" once the event starts. 
	#FSM.force_change_state("InEvent")
#
#
##An event has finished 
#func _on_event_finished():
	##Changes the current state to "MoveMenu" once the event is finished. On future versions this should change to Idle.
	#FSM.force_change_state("Idle")

#region FUNCTIONS

#Called when the node is ready
func _ready() -> void:
	pass

#region Stats set up functions
#Call to set up the health values of a player
func set_up_health():
	calculate_max_hp()
	player_data.current_health = player_data.maximum_health
	HPSetUp.emit(player_data.maximum_health, player_data.current_health)

#Call to set up the memoria values of a player
func set_up_memorias():
	player_data.total_memorias = 0
	player_data.current_memorias = 0
	MemoriaSetUp.emit(player_data.total_memorias, player_data.current_memorias)

func calculate_max_hp():
	player_data.maximum_health = player_origin.base_health + (player_data.Vitality * player_data.level)
	MaxHPCalulated.emit(player_data.maximum_health)

#endregion

#region Listener Functions

func _on_action_menu_button_reemitter(button):
	if button == "Move":
		FSM.change_state(FSM.current_state, "Moving")

func _on_signalsbus_player_enters_room_reemitter(room_data):
	print(room_data)

#endregion
#endregion
