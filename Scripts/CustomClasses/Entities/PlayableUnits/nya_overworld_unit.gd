extends Node3D
class_name NyaOverworldUnit

## Hovering variables
#var hover_speed: float = 1.0  # Time for one hover cycle (seconds)
#var hover_amount: float = 0.2  # Distance to hover above and below
#var hovering_up: bool = true  # Tracks the hover direction
#
#func _ready():
	## Start the hovering animation
	#start_hovering()
#
#func start_hovering():
	## Calculate the target y position based on hover direction
	#var sprite = $Sprite3D
	#var target_y = sprite.transform.origin.y + (hover_amount if hovering_up else -hover_amount)
	#hovering_up = !hovering_up  # Toggle direction for the next cycle
#
	## Create a Tween and add it to the scene tree
	#var tween = create_tween().bind_node(self).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
#
	## Animate the Y position using the Tween object
	#tween.tween_property(
		#sprite,
		#"transform/position:y",
		#target_y,
		#hover_speed
	#)
#
	## Loop the animation by calling this function again at the end of the tween
	#tween.tween_callback(Callable(self, "start_hovering"))
