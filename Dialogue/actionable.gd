extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# You don't need to define npc_node/name/emotion here.

# --- Nested Class for Game State ---
# This class needs a constructor (_init) to accept the data
# it should hold, instead of trying to access variables from the
# outer script's top level.
class NPCGameState:
	var name: String
	var emotion: String
	
	# Constructor to set the values when the object is created
	func _init(npc_name: String, npc_emotion: String):
		self.name = npc_name
		self.emotion = npc_emotion
# ------------------------------------

func action() -> void:
	# Get the parent node and its data inside the function
	var npc_node = get_parent()
	
	# Safely retrieve the current values from the parent (assuming they exist)
	var current_name = npc_node.npc_name
	var current_emotion = npc_node.npc_emotion

	# Create the NPCGameState instance, passing the current data to its constructor
	var npc_state = NPCGameState.new(current_name, current_emotion)
	
	# Call the DialogueManager
	DialogueManager.show_example_dialogue_balloon(
		dialogue_resource, 
		dialogue_start,
		[self, { "npc" = npc_state }] # Using "npc" as the key
	)
