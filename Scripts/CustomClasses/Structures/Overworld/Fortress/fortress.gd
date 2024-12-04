extends Node3D
class_name FortressOverWorld


#region REFERENCES

#endregion

#region  GLOBAL VARIABLES
@export var floor_scene:PackedScene
#endregion

#region  CONSTANTS

#endregion

#region  SIGNALS

#endregion

#region FUNCTIONS
#Called when the node is ready
func _ready() -> void:
	generate_fortress(5)

# Call to generate the fortress
func generate_fortress(floor_count: int):
	# Floor spacing and layout positions
	var floor_spacing = 10.0  # Adjust this value for separation
	var start_positions = [
		Vector3(0, 0, 0),  # Floor 1 (origin)
		Vector3(floor_spacing, 0, 0),  # Floor 2 (right of Floor 1)
		Vector3(floor_spacing, 0, -floor_spacing),  # Floor 3 (south of Floor 2)
		Vector3(0, 0, -floor_spacing),  # Floor 4 (south of Floor 1)
		Vector3(-floor_spacing, 0, -floor_spacing)  # Floor 5 (southwest of Floor 1)
	]

	# Loop through the specified number of floors
	for i in range(floor_count):
		# Create a new floor instance
		var floor_instance = floor_scene.instantiate()
		
		# Set the name of the floor node
		floor_instance.name = "Floor %d" % (i + 1)
		
		# Position the floor based on layout
		if i < start_positions.size():
			var new_transform = floor_instance.transform
			new_transform.origin = start_positions[i]
			floor_instance.transform = new_transform

		else:
			# Default fallback if more floors are added than positions defined
			var default_position = Vector3((i - 4) * floor_spacing, 0, (i - 4) * -floor_spacing)
			floor_instance.global_transform.origin = default_position
			print("Warning: Additional floor positioned at:", default_position)
		
		# Dynamically adjust dimensions of each floor
		var width = 4 + i  # Increase width for each floor
		var height = 4 + i  # Increase height for each floor
		
		# Generate the floor layout
		floor_instance.generate_floor(width, height)
		
		# Add the floor as a child of the fortress
		add_child(floor_instance)
		
		# Debug output
		print("Generated:", floor_instance.name, "at position:", floor_instance.global_transform.origin, "with dimensions: %dx%d" % [width, height])


#endregion
