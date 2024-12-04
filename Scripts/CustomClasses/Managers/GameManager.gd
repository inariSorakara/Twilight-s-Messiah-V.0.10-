extends Node
class_name GameManager


#region REFERENCES
@export_category("Managers")
@export var scene_manager:SceneManager
@export var player_manager:PlayerManager
#@export var event_manager:EventManager
#endregion

#region  GLOBAL VARIABLES

#region SCENES RELATED
#List of packed scenes
var Fortress_packed_scene:PackedScene = load("res://Scenes/Structures/Overworld/fortress.tscn")

#The player packed scene
var player_packed_scene:PackedScene = load("res://Scenes/PlayerRelated/PlayerUnit.tscn")
#endregion


#region Player related
var number_of_players:int = 1
#endregion

#region Current game state related

#Temporal until I work on the turn system
#var current_player:PlayerUnit

##region  SIGNALS
##Checks if a player spawned in this room
#signal spawn_check
#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	#connect_signals()
	start_game()


##Call to connect loose signals to the GameManager
#func connect_signals():
	##To the GameManager
	##SignalsBus.PlayerEntersEventReemitter.connect(_on_signalbus_player_enters_room_reemitter)
	#
	##From the GameManager
	#spawn_check.connect(SignalsBus.on_spawn_check)

#Call to start the game
func start_game():
	
	#First, set up the playing field
	
	scene_manager.load_scene(Fortress_packed_scene)
	
	#We now get a reference to the first floor
	var first_floor:FortressFloor = scene_manager.get_node("Fortress/Floor 1")

	#We need to get our spawn points first
	player_manager._update_spawn_positions(first_floor)
	
	#Let's get the players on the field.
	player_manager.spawn_players(player_packed_scene,1)
	
	##Let's give time for the players to get ready
	#await get_tree().process_frame
	#
	##Now, let's check  on which rooms players spawned
	#spawn_check.emit()
	#
	##Initiate doom clock and turn system
#
	##That should be it! Game officially started

#endregion

#region Signal Listener Functions

#region Event Related


#endregion
#endregion
