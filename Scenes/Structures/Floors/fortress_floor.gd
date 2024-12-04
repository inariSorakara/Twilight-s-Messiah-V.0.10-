extends Node3D
class_name FortressFloor


#region REFERENCES

#The room scene
@export var room_scene:PackedScene
#endregion

#region  GLOBAL VARIABLES

#endregion

#region  CONSTANTS

#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	pass
#endregion

# Generates rooms inside the floor
func generate_floor(width: int, height: int):
	# Define room dimensions with leeway
	var room_size = Vector3(1.1, 1.1, 1.1)  # Adding 10% extra spacing for safety

	# Loop through rows (height) and columns (width) to generate rooms
	for row in range(1, height + 1):  # Rows are 1-indexed
		for col in range(width):  # Columns are 0-indexed for letters
			
			# Generate room coordinate string (e.g., "A 1", "B 2")
			var column_letter = String.chr(65 + col)  # ASCII: A=65, B=66, ...
			var room_coordinate = "%s %d" % [column_letter, row]

			# Instance a new room
			var room_instance:RegularRoom = room_scene.instantiate()
			room_instance.name = room_coordinate  # Set node name to coordinate
			
			# Assign custom resource
			room_instance.room_custom_resource.room_coordinate = room_coordinate
			
			# Calculate position based on room size
			@warning_ignore("shadowed_variable_base_class")
			var position = Vector3(
				col * room_size.x,  # Space rooms horizontally (X-axis)
				0,                 # Keep all rooms at the same Y level
				-row * room_size.z # Space rooms vertically (Z-axis, negative for top-to-bottom layout)
				)

			# Apply position to room instance
			var new_transform = room_instance.transform
			new_transform.origin = position
			room_instance.transform = new_transform


			# Add to the floor
			add_child(room_instance)
