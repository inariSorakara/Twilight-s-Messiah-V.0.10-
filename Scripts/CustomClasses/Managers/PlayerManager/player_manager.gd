extends Node
class_name PlayerManager



#region REFERENCES

#region PLAYER RELATED REFERENCES
#The player scene
var player_scene:PackedScene = preload("res://Scenes/Entities/PlayableUnits/PlayableCharacter.tscn")

#The container for players alive
@onready var players_alive: Node = $PlayersAlive

#The container for players that died
@onready var players_dead: Node = $PlayersDead

#endregion

#endregion

#region  GLOBAL VARIABLES
#The positions for the players to spawn on
var spawn_positions:Array = [Vector2(32,32), Vector2(224,32),Vector2(32,224), Vector2(224,224)]

#endregion

#region  CONSTANTS

#endregion

#region  STATE MACHINES

#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	pass

#Call to spawn players
func spawn_players(num_of_players:int):
	for i in range(num_of_players):
		var new_player:PlayerUnit = player_scene.instantiate()
		new_player.name = "Player " + str(i + 1)
		players_alive.add_child(new_player)
		new_player.global_position = spawn_positions[i]
		connect_signals(new_player)

#connects the players signals
func connect_signals(player:PlayerUnit):
	##From the player
	player.HPSetUp.connect(SignalsBus._on_player_HP_Set_Up)
	player.MemoriaSetUp.connect(SignalsBus._on_player_Memoria_Set_Up)
	player.set_up_health()
	player.set_up_memorias()
	
	##To the player
	SignalsBus.connect("ActionMenuPressedReemitter", player._on_action_menu_button_reemitter)
	SignalsBus.connect("PlayerEntersRoomReemitter", player._on_signalsbus_player_enters_room_reemitter)


#endregion
#endregion
