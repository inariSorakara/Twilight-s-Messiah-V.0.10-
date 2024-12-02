extends State
class_name RoomCopperEventState

#region Global Variables
#This room event is active
var active_event:bool = false

#The current player
var current_player:PlayerUnit

#The current floor
var current_floor:Fortress_Floor
#endregion

var monster_type:String = "Weak"

var monster_damage:int = 5

var monster_memoria_loot = 10

var memoria_cost:int = 1

#region DIALOGUES

var enemy_encounter: String = "You have encountered a " + monster_type + " enemy!"

#The player survives damage
var  player_damaged:Array = ["You got hurt in battle! ", "You have lost " + str(monster_damage) + " HP!"]

#The player does not survive damage
var player_slain:Array = ["The damage was too much", "You have fallen in battle", "Game Over"]

#The player has used Memoria in battle
var memoria_used:Array = ["You have spent " + str(memoria_cost)+ " memorias in battle"]

#The player had to use HP instead of Memoria
var memoria_replaced:Array = ["Your memoria was low", "You had to use " + str(memoria_cost) + " HP instead!"]

#The player has won the battle!
var player_is_victorious:Array = ["Victory!", "You have won " + str(monster_memoria_loot) + " memorias!"]
#endregion

#region Signals

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
	
#
	##Disconnects both signals from the current player
	#event_started.disconnect(current_player._on_event_started)
	#
	#event_finished.disconnect(current_player._on_event_finished)
func trigger_event():
	#Connects both signals to the current player
	event_started.connect(current_player._on_event_started)

	event_finished.connect(current_player._on_event_finished)

	#Signals the event starting
	event_started.emit()

	#Executes the event

	state_owner.event_presenter("res://Assests/Art/Events/Copper/Copper_Encounter.png")
	
	var encounter_text:Array = []
	
	encounter_text.append(enemy_encounter)

	#if (current_player.current_health - monster_damage) >= 0:
		#current_player.current_health -= monster_damage
		#encounter_text.append_array(player_damaged)
		#if (current_player.current_memorias - memoria_cost) > 0:
			#encounter_text.append_array(memoria_used)
			#current_player.current_memorias -= memoria_cost
		#else:
			#encounter_text.append_array(memoria_replaced)
			#current_player.current_health -= memoria_cost
		#encounter_text.append_array(player_is_victorious)
		#current_player.current_memorias += 10
		#current_player.total_memorias += 10
	#else:
		#current_player.current_health -= monster_damage
		#encounter_text.append_array(player_damaged)
		#encounter_text.append_array(player_slain)
#
	#state_owner.dialogue_presenter(encounter_text)

	state_owner.dialogue_presenter(encounter_text)
	await state_owner.DialogueFinished
	
	state_owner.event_concluder()
	
	SignalsBus.BattleStart.emit()

	event_finished.emit()

	#Disconnects both signals from the current player
	event_started.disconnect(current_player._on_event_started)
	
	event_finished.disconnect(current_player._on_event_finished)
#endregion
