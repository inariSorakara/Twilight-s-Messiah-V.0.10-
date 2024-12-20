extends State
class_name QuartzEvent

#region references

#region Signals
signal EventStarted
signal EventFinished

#region Functions

func trigger_event():
	pass
	##Executes the event
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
