extends State
class_name RoomAmethystEventState

#region REFERENCES

#endregion

#region  GLOBAL VARIABLES
var active_event:bool = false

#The current player
var current_player:PlayerUnit

#The current floor
var current_floor:Fortress_Floor

#region Dialogues

#Encounter an Amethyst room
var room_encounter:Array = ["ɎØɄ  ⱤɆ₳ⱠⱠɎ ₴ⱧØɄⱠĐ₦'₮ ฿Ɇ ⱧɆⱤɆ", "Continue further?"]
#endregion

#region  SIGNALS

#The event has started
signal event_started

#The event has finished
signal event_finished
#endregion

#region FUNCTIONS
func Enter():
	current_player = state_owner.current_player_inside
	current_floor = state_owner.current_floor

func Update(_delta):
	if state_owner.spawning_mode == false:
		if current_player.event_mode == true:
			if active_event == true:
				trigger_event()
				active_event = false
				current_player.event_mode = false

func Exit():
	pass


func trigger_event():

	#Connects both signals to the current player
	event_started.connect(current_player._on_event_started)

	event_finished.connect(current_player._on_event_finished)

	#Signals the event starting
	event_started.emit()

	state_owner.event_presenter("res://Assests/Art/Events/Amethyst/Amethyst_Event.png")
	
	state_owner.dialogue_presenter(room_encounter)

	await state_owner.DialogueFinished
	
	current_player.FSM.force_change_state("InEventAmethystConfirming")

	await current_player.AmethystRoomDecided
	
	state_owner.event_concluder()

	#Disconnects both signals from the current player
	event_started.disconnect(current_player._on_event_started)
	
	event_finished.disconnect(current_player._on_event_finished)
