extends Node3D
# NyaOverworldUnit.gd

# [Global Variables]

# [References]
@export var sprite3d: Sprite3D

# [Constants]
const HOVER_AMOUNT: float = 3.0 # Adjust the hover amount as needed
const HOVER_DURATION: float = 1  # Duration in seconds for half of the hover cycle

# [Signals]

# [Functions]

func _ready():
	start_hovering()

func start_hovering():
	var tween = create_tween().set_loops()
	tween.tween_property(sprite3d, "position:y", HOVER_AMOUNT, HOVER_DURATION).as_relative().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(sprite3d, "position:y", -HOVER_AMOUNT , HOVER_DURATION).as_relative().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
