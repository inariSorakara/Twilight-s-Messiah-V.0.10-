extends State
class_name RoomEmeraldEventState


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES
var active_event:bool = false


#The current player
var current_player:PlayerUnit

#The current floor
var current_floor:Fortress_Floor

#How much does it cost to level up?
var level_up_cost:int

#How much does it cost to rest?
var resting_cost:int

#region Dialogues

#The player levels up
var player_level_up_dialogue:Array = [ 'Allow me to unlock your inner potential',"You leveled up!"]

#The player rests
var player_rests:Array = ['Have a good rest friend', "You took a nap, healing yourself!"]

#The player doesn't have enough memorias
var not_enough_memorias:Array = ["Not running a charity here friend.","Come back with more memorias"]
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

	state_owner.event_presenter("res://Assests/Art/Events/Emerald/Emerald_Event_Placeholder.png")
	
	var event_text:Array = []
	
	NodBus.speaker_name.show()
	
	NodBus.speaker_name.text = "Mido"
	
	calculate_costs(current_floor.memorias_required, current_player.player_level)
	
	if current_player.current_memorias - level_up_cost >= 0:
		current_player.player_level += 1
		current_player.current_memorias -= level_up_cost
		current_player.current_health = current_player.maximum_health
		event_text.append_array(player_level_up_dialogue)
	elif current_player.current_memorias -resting_cost >= 0:
		current_player.current_memorias -= resting_cost
		current_player.current_health = current_player.maximum_health
		event_text.append_array(player_rests)
	else:
		event_text.append_array(not_enough_memorias)
	
	state_owner.dialogue_presenter(event_text)
	
	await state_owner.DialogueFinished
	
	state_owner.event_concluder()
	
	event_finished.emit()


func calculate_costs(memorias_required,player_level):
	level_up_cost = (memorias_required * player_level)/2
	resting_cost = (memorias_required * player_level)/4
