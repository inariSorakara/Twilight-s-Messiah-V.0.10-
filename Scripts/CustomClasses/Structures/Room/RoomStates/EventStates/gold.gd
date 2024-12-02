extends State
class_name RoomGoldEventState


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES
var active_event:bool = false



#The current player
var current_player:PlayerUnit

#The current floor
var current_floor:Fortress_Floor

#region Dialogues
var loot_obtained_text:Array= ["You have obtained "]
#endregion
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

	state_owner.event_presenter("res://Assests/Art/Events/Gold/Gold_Event.png")
	
	var event_text:Array = []
	#Loot obtained
	var loot_obtained:int
	
	var random_number:int = randi_range(1,10)
	if random_number<= 2:
		loot_obtained = 10
		loot_obtained_text.append(str(loot_obtained) + " memorias!")
	elif random_number <= 4 and random_number > 2:
		loot_obtained = 20
		loot_obtained_text.append(str(loot_obtained) + " memorias!")
	elif random_number <= 6 and random_number > 4:
		loot_obtained = 40
		loot_obtained_text.append(str(loot_obtained) + " memorias!")
	elif random_number <= 8 and random_number > 6:
		loot_obtained = 80
		loot_obtained_text.append(str(loot_obtained) + " memorias!")
	
	event_text.append_array(loot_obtained_text)

	state_owner.dialogue_presenter(event_text)

	await state_owner.DialogueFinished
	
	current_player.current_memorias += loot_obtained
	
	current_player.total_memorias += loot_obtained
	
	state_owner.event_concluder()
	
	event_finished.emit()

	get_parent().change_state(self, "Quartz")
