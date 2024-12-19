extends Node3D
class_name RegularRoom

#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

@export var room_custom_resource:RegularRoomData
@export var middle_of_room:Position3D
#endregion

##region Room Information
#
##Are we spawning players yet?
#var spawning_mode:bool = true
#
##Player inside?
#var player_inside:bool
#
##Who is currently inside here?
#var current_player_inside:PlayerUnit
#
##endregion
#
##endregion
#
##region  SIGNALS
#
##Signals the Interface to update the coordinate label
#signal coordinate_update(coordinate)
#
##Signals the Interface to update the event label
#signal event_update(event)
#
##A player has entered this area
#signal room_entered(room_data)
##endregion

#region FUNCTIONS

func _ready() -> void:
	pass

	##To Room
	#SignalsBus.Spawn_Checker.connect(_on_spawn_checker)
	#SignalsBus.PlayerEntersRoomReemitter.connect(_on_player_enters_room)
	#
	##From Room
	#coordinate_update.connect(SignalsBus._on_room_coordinate_update)
	#event_update.connect(SignalsBus._on_room_event_update)
	#room_entered.connect(SignalsBus._on_room_entered)
#
#func _on_room_area_body_entered(body: Node2D) -> void:
	#var room_data:Dictionary = {"Room_Name": self.name,
	#"Room_Event": RoomEventFSM.current_state}
	#room_entered.emit(room_data)
#
	#if body.name == "PlayerSpriteBody":
		#player_inside = true
		#current_player_inside = body.get_parent().get_parent()
		#current_player_inside.player_data.current_room = self
		#if spawning_mode == false:
			#await get_tree().create_timer(1.5).timeout
			#SignalsBus.PlayerEntersRoomReemitter.emit()
			#event_update.emit(RoomEventFSM.current_state.name)
	#if body.name == "PlayerBody":
		#coordinate_update.emit(name)
		#event_update.emit(RoomEventFSM.current_state.name)
#
#func _on_room_area_body_exited(body: Node2D) -> void:
	#player_inside = false
	#current_player_inside = null#
#
##region Listener Functions
#
##When the game manager emits it's spawn checker
#func _on_spawn_checker():
	#if spawning_mode == true:
		#if player_inside == true:
			#RoomEventFSM.change_state(RoomEventFSM.current_state, "Quartz")
			#event_update.emit(RoomEventFSM.current_state.name)
		#else:
			#pass
		#spawning_mode = false
#
##Called when the player chooses their new room
#func _on_player_enters_room():
	#if player_inside == true:
		#if spawning_mode == false:
			#print("Spawning_mode is false")
			##if RoomEventFSM.current_state.name == "???":
				##var random_room_event = randi_range(1,9)
				##RoomEventFSM.change_state(RoomEventFSM.current_state,RoomEventFSM.get_child(random_room_event).name)
				##RoomEventFSM.current_state.active_event = true
			##else:
				##RoomEventFSM.current_state.active_event = true
#
#
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
##
###Shows dialogue
##func dialogue_presenter(new_text):
	##NodBus.event_text_box.show()
	##var total_dialogue_lines = new_text.size()
	##var current_dialogue_index = 0
	##while total_dialogue_lines > current_dialogue_index:
		##var current_dialogue_line = new_text[current_dialogue_index]
		##NodBus.event_text_box.text = ""
		##for letter in current_dialogue_line:
			##NodBus.event_text_box.text += letter
			##await get_tree().create_timer(0.05).timeout
		##current_dialogue_index += 1
		##await get_tree().create_timer(0.5).timeout
	##DialogueFinished.emit()
	##NodBus.event_text_box.hide()


func _on_area_3d_body_entered(body: Node3D) -> void:
	var player:PlayerUnit = body
	player.current_room = self
	player.Hud.coordinate_label.text = name
