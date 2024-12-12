extends Node
class_name DialogueManager

#region CONSTANTS
const DEFAULT_TYPING_SPEED: float = 0.05
const DEFAULT_LINE_PAUSE: float = 1.0
#endregion

#region SIGNALS
@warning_ignore("unused_signal")
signal dialogue_finished
#endregion

#region FUNCTIONS

var is_showing_dialogue: bool = false
var current_timer: SceneTreeTimer = null

# Show dialogue in typewriter style
func show_dialogue(new_text: Array, dialogue_box: Label, typing_speed: float = DEFAULT_TYPING_SPEED, line_pause: float = DEFAULT_LINE_PAUSE) -> void:
	if not new_text or not dialogue_box:
		print("DialogueManager: Invalid input provided.")
		return

	# If a dialogue is currently being displayed, stop it
	if is_showing_dialogue:
		_stop_current_dialogue()

	# Start the new dialogue
	is_showing_dialogue = true
	_start_dialogue(new_text, dialogue_box, typing_speed, line_pause)

func _start_dialogue(new_text: Array, dialogue_box: Label, typing_speed: float, line_pause: float) -> void:
	var total_dialogue_lines = new_text.size()
	var current_dialogue_index = 0

	while current_dialogue_index < total_dialogue_lines:
		var current_dialogue_line = new_text[current_dialogue_index]
		dialogue_box.text = ""

		for letter in current_dialogue_line:
			dialogue_box.text += letter
			current_timer = get_tree().create_timer(typing_speed)
			await current_timer.timeout

		current_dialogue_index += 1
		current_timer = get_tree().create_timer(line_pause)
		await current_timer.timeout

	is_showing_dialogue = false
	emit_signal("dialogue_finished")

func _stop_current_dialogue() -> void:
	if current_timer:
		current_timer = null
	is_showing_dialogue = false

#endregion
