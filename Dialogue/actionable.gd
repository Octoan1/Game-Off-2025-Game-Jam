extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@export var quest1: Quest
@export var quest2: Quest
@export var quest3: Quest
@export var item: PackedScene


# --- Nested Class for Game State ---
class NPCGameState:
	var name: String
	var emotion: String
	var quest1: Quest
	var quest2: Quest
	var quest3: Quest
	
	# Constructor to set the values when the object is created
	func _init(npc_name: String, npc_emotion: String, quest1: Quest, quest2: Quest, quest3: Quest):
		self.name = npc_name
		self.emotion = npc_emotion
		self.quest1 = quest1
		self.quest2 = quest2
		self.quest3 = quest3

func action() -> void:
	# Get the parent node and its data inside the function (the NPC node)
	var npc_node = get_parent()
	var current_name = npc_node.npc_name
	var current_emotion = npc_node.npc_emotion
	
	if quest1.quest_status == quest1.QuestStatus.available:
		quest1.start_quest()
		var item = item.instantiate()
		add_child(item)
		item.position = Vector2(1000,0)
		item.quest = quest1
		print(item.quest.quest_name)

	# Create the NPCGameState instance, passing the current data to its constructor
	var npc_state = NPCGameState.new(current_name, current_emotion, quest1, quest2, quest3)
	
	# Call the DialogueManager
	DialogueManager.show_example_dialogue_balloon(
		dialogue_resource, 
		dialogue_start,
		[self, { "npc" = npc_state }]
	)
