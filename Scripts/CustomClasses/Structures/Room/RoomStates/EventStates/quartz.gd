extends State
class_name RoomQuartzEventState

##region Global Variables
##This room event is active
#var active_event:bool = false
#
##The current player
#var current_player:PlayerUnit
#
##The current floor
#var current_floor:Fortress_Floor
#
##region Constants
##region DIALOGUES
##The player doesn't have enough memorias to continue
#var not_enough_memorias_dialogue:PackedStringArray = ["An invisible force stops you from going further",
#"gather more memorias and try again"]
#
##The player has enough memorias to continue
#var enough_memorias_dialogue:PackedStringArray = ["You have found the way to the next floor",
#"You get an ominous feeling from above.",
#"You probably won't be able to come back",
 #"Continue further?"]
#
##endregion
##endregion
#
##region Signals
#
##The event has started
#signal event_started
#
##The event has finished
#signal event_finished
#
##The player decided about moving floors
#signal moving_floors_answer
#
##endregion
#func Enter():
	#current_player = state_owner.current_player_inside
	#current_floor = current_player.player_data.current_floor
#
#func Update(_delta):
	#if state_owner.spawning_mode == false:
		#if current_player.event_mode == true:
			#if active_event == true:
				#trigger_event()
				#active_event = false
				#current_player.event_mode = false
#
#func Exit():
	#pass
#
#func trigger_event():
#
	##Connects both signals to the current player
	#event_started.connect(current_player._on_event_started)
#
	#event_finished.connect(current_player._on_event_finished)
#
	##Signals the event starting
	#event_started.emit()
#
	##Executes the event
	#
	#state_owner.event_presenter("res://Assests/Art/Events/Quartz/Quartz_Room_Sprite.png")
	#
	#if current_player.total_memorias < current_floor.memorias_required:
		#state_owner.dialogue_presenter(not_enough_memorias_dialogue)
		#
		#await state_owner.DialogueFinished
		#
		#state_owner.event_concluder()
		#
		#event_finished.emit()
	#else:
		#state_owner.dialogue_presenter(enough_memorias_dialogue)
		#
		#await state_owner.DialogueFinished
		#
		#current_player.FSM.force_change_state("InEventQuartzConfirming")
		#
		#await current_player.MovingFloorsDecided
		#
		#state_owner.event_concluder()
#
	##Disconnects both signals from the current player
	#event_started.disconnect(current_player._on_event_started)
	#
	#event_finished.disconnect(current_player._on_event_finished)
