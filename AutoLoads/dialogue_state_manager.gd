extends Node 

var npc_data: Dictionary = {}

# Template for new NPC data
const NPC_TEMPLATE = {
	"emotion_scores": {"Angry": 0, "Happy": 0, "Fearful": 0, "Sad": 0},
	"relationship_level": 0,
	"current_emotion": ""
}

func initialize_npc(npc_name: String, npc_emotion: String):
	# Initializes data for a new NPC if it doesn't exist
	if not npc_data.has(npc_name):
		npc_data[npc_name] = NPC_TEMPLATE.duplicate(true)
		npc_data[npc_name]["current_emotion"] = npc_emotion
		print("Initialized data for NPC: " + npc_name + ", " + npc_emotion)

func add_emotion_score(npc_name: String, emotion_name: String, amount: int):
	var scores = npc_data[npc_name]["emotion_scores"]
	scores[emotion_name] += amount
	print(npc_name + ": " + emotion_name + " score increased to: " + str(scores[emotion_name]))
	print(npc_data)

func determine_highest_emotion(npc_name: String):
	var scores = npc_data[npc_name]["emotion_scores"]
	var highest_emotion: String = "Neutral"
	var highest_score: int = -1
	
	# Loop through all emotion categories
	for emotion_name in scores.keys():
		var current_score = scores[emotion_name]
		
		if current_score > highest_score:
			highest_score = current_score
			highest_emotion = emotion_name
			
		elif current_score == highest_score and highest_score > 0:
			# TODO: TIEBREAKER?
			highest_emotion = "Mixed"
	
	# Store the final result in the NPC's data for printing in the dialogue
	npc_data[npc_name]["current_emotion"] = highest_emotion
	print("The emotion with the highest amount of points is: " + highest_emotion)
	
	return highest_emotion


func reset_scores(npc_name: String):
	# Reset scores for the next conversation
	npc_data[npc_name]["emotion_scores"] = NPC_TEMPLATE["emotion_scores"].duplicate(true)
