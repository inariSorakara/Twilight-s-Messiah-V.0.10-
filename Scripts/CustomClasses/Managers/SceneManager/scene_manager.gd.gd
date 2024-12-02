extends Node
class_name SceneManager

#region REFERENCES

#endregion

#region  GLOBAL VARIABLES

#The scene container
@export var scene_container:Node

var current_scene

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


#Call to change the current scene to a new scene
func change_scene(new_scene):
	#If there's currently a scene on the scene container, remove it.
	if current_scene:
		scene_container.remove_child(current_scene)
	
	#Create a variable for the new packed scene 
	var new_packed_scene:PackedScene = load(new_scene)
	
	#Create a variable for the new scene instance
	var new_scene_instance = new_packed_scene.instantiate()
	
	#Add the new scene as a child of the scene container
	
	scene_container.add_child(new_scene_instance)
	
	#Make "current scene" the scene
	current_scene = scene_container.get_child(0)

func battle_start():
	SignalsBus.BattleStart.emit()

func _on_battle_start():
	NodBus.transition_animation.play("FadeOut")
	await NodBus.transition_animation.animation_finished
	NodBus.battle_scene.show()
	NodBus.transition_animation.play("FadeIn")
#endregion
