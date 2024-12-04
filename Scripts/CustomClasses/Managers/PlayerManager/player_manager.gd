extends Node
class_name PlayerManager



#region REFERENCES

#region PLAYER RELATED REFERENCES

#endregion

#endregion

#region  GLOBAL VARIABLES
#The positions for the players to spawn on
var spawn_positions:Array

#endregion

#region  CONSTANTS

#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	pass

# Call to actually update the spawn point array
func _update_spawn_positions(spawning_floor: FortressFloor):
	# Ensure the floor exists
	if not spawning_floor:
		print("Error: Spawning floor not found!")
		return

	# Room names to retrieve spawn positions from
	var room_names = ["A 1", "A 4", "D 1", "D 4"]
	spawn_positions.clear()  # Clear previous positions to avoid duplication

	# Loop through each room name
	for room_name in room_names:
		var room: RegularRoom = spawning_floor.get_node_or_null(room_name)
		if room:
			var position_node: Position3D = room.get_node_or_null("Position3D")
			if position_node:
				# Append the middle position of the room
				spawn_positions.append(position_node.get_middle_position())
			else:
				print("Warning: Position3D not found in room %s!" % room_name)
		else:
			print("Warning: Room %s not found!" % room_name)


# Call to spawn players
func spawn_players(player_scene: PackedScene, num_of_players: int):
	if spawn_positions.size() < num_of_players:
		print("Error: Not enough spawn positions for the number of players.")
		return

	for i in range(num_of_players):
		# Instance the player
		var new_player: PlayerUnit = player_scene.instantiate()
		new_player.name = "Player %d" % (i + 1)
		new_player.add_to_group("Players Alive")
		
		# Assign the spawn position from the array
		var spawn_position = spawn_positions[i]

		# Add the player to the scene
		add_child(new_player)

		new_player.global_transform.origin = spawn_position

		print("Spawned %s at position %s" % [new_player.name, spawn_position])


##connects the players signals
#func connect_signals(player:PlayerUnit):
	###From the player
	#player.HPSetUp.connect(SignalsBus._on_player_HP_Set_Up)
	#player.MemoriaSetUp.connect(SignalsBus._on_player_Memoria_Set_Up)
	#player.set_up_health()
	#player.set_up_memorias()
	#
	###To the player
	#SignalsBus.connect("ActionMenuPressedReemitter", player._on_action_menu_button_reemitter)
	#SignalsBus.connect("PlayerEntersRoomReemitter", player._on_signalsbus_player_enters_room_reemitter)


#endregion
#endregion
