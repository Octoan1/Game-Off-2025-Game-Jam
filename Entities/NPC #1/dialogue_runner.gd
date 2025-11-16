extends Sprite2D
# DialogueRunner.gd 
# You need a variable to track the NPC this script belongs to
@export var npc_id: String = "Greg" # Set this in the Inspector for each NPC scene

@export var result: String = "Blank"

@onready var dialogue_node = $DialogueManager

func start_conversation(dialogue_resource: String):
	# 1. Ensure data is ready for this specific NPC
	DialogueStateManager.initialize_npc(npc_id)
	# 2. Start the dialogue...
	dialogue_node.start(dialogue_resource)
	dialogue_node.dialogue_ended.connect(_on_dialogue_ended)

func _on_dialogue_ended(resource: String) -> void:
	# Use the npc_id property to tell the GManager whose scores to check
	var final_emotion = DialogueStateManager.determine_highest_emotion(npc_id) 
	print("Conversation with " + npc_id + " resulted in a final inflicted emotion of: " + final_emotion)
