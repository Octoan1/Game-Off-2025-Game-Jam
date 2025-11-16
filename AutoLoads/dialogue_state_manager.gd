extends Node 

# Stores ALL game data: NPC_Name -> {emotion_scores, relationship_level, has_item}
var npc_data: Dictionary = {}
var result: String = ""

# Template for new NPC data
const NPC_TEMPLATE = {
	"emotion_scores": {"Angry": 0, "Happy": 0, "Fearful": 0, "Sad": 0},
	"relationship_level": 0,
	"current_emotion": "Neutral" # Added for your daily emotion system
}

func initialize_npc(npc_name: String):
	# Initializes data for a new NPC if it doesn't exist
	if not npc_data.has(npc_name):
		# We use deep_copy() to make sure each NPC gets a unique copy of the dictionary
		npc_data[npc_name] = NPC_TEMPLATE.duplicate(true)
		print("Initialized data for NPC: " + npc_name)

# --- Core Function for Dialogue Manager ---

func add_emotion_score(npc_name: String, emotion_name: String, amount: int):
	# 1. Ensure the NPC exists in the data structure
	if not npc_data.has(npc_name):
		initialize_npc(npc_name)
	# 2. Add the score
	var scores = npc_data[npc_name]["emotion_scores"]
	scores[emotion_name] += amount
	print(npc_name + ": " + emotion_name + " score increased to: " + str(scores[emotion_name]))
	print(npc_data)

func determine_highest_emotion(npc_name: String):
	# Resets the scores for the current conversation and returns the result
	var scores = npc_data[npc_name]["emotion_scores"]
	
	# ... (Your logic to determine highest emotion goes here)
	# After determining the highest emotion (e.g., 'Angry'):
	npc_data[npc_name]["current_emotion"] = "Angry"

func reset_scores(npc_name: String):
	# Reset scores for the next conversation
	npc_data[npc_name]["emotion_scores"] = NPC_TEMPLATE["emotion_scores"].duplicate(true)
