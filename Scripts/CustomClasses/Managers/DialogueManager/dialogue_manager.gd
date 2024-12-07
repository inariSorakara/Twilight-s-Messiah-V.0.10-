extends Node
class_name DialogueManager

#region Global Variables
var is_showing_dialogue: bool = false
var typing_speed: float = 0.10	# Adjust typing speed as needed

# Internal variables for managing dialogue
var current_label: Label = null
var dialogue_array: Array = []
var current_index: int = 0
var char_index: int = 0
var char_timer: Timer = null

#endregion

#region Signals
@warning_ignore("unused_signal")
signal dialogue_started()
@warning_ignore("unused_signal")
signal dialogue_finished()

#endregion

#region Functions

# Display dialogue from an array of strings
func show_dialogue(label: Label, dialogue: Array) -> void:
		if not label:
				print("DialogueManager: No label provided to display the dialogue.")
				return
		if dialogue.is_empty():
				print("DialogueManager: Dialogue array is empty.")
				return

		# Initialize dialogue management
		current_label = label
		dialogue_array = dialogue
		current_index = 0
		char_index = 0
		label.text = ""	# Clear existing text
		label.visible = true

		is_showing_dialogue = true
		emit_signal("dialogue_started")

		# Start displaying the first dialogue string
		_start_typing(dialogue_array[current_index])

# Hide the dialogue completely
func hide_dialogue() -> void:
		if current_label:
				current_label.visible = false
				current_label.text = ""
		_reset_dialogue()
		emit_signal("dialogue_finished")

# Skip current typing and show full text immediately
func skip_typing() -> void:
		if is_showing_dialogue and current_label:
				# Show the full text of the current string
				current_label.text = dialogue_array[current_index]
				_finish_typing_current_string()

# Move to the next dialogue in the array
func next_dialogue() -> void:
		if not is_showing_dialogue:
				return

		if current_index < dialogue_array.size() - 1:
				# Advance to the next string
				current_index += 1
				char_index = 0
				current_label.text = ""
				_start_typing(dialogue_array[current_index])
		else:
				# End the dialogue if no more strings
				hide_dialogue()

# Internal function to start typing a dialogue string
@warning_ignore("unused_parameter")
func _start_typing(text: String) -> void:
		if char_timer:
				char_timer.stop()
				char_timer.queue_free()

		# Create and configure the timer for the typing effect
		char_timer = Timer.new()
		char_timer.wait_time = typing_speed
		char_timer.one_shot = false
		char_timer.connect("timeout", _on_char_timer_timeout)
		add_child(char_timer)
		char_timer.start()

# Callback to handle the typing effect character by character
func _on_char_timer_timeout() -> void:
		if char_index < dialogue_array[current_index].length():
				current_label.text += dialogue_array[current_index][char_index]
				char_index += 1
		else:
				_finish_typing_current_string()

# Finishes typing the current string and prepares for the next
func _finish_typing_current_string() -> void:
		if char_timer:
				char_timer.stop()
				char_timer.queue_free()
				char_timer = null
  await get_tree().create_timer(0.5).timeout
		next_dialogue()

# Resets dialogue management variables
func _reset_dialogue() -> void:
		current_label = null
		dialogue_array = []
		current_index = 0
		char_index = 0
		is_showing_dialogue = false

#endregion
