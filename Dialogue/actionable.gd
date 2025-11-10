extends Area2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

# runs the dialogue using the dialogue resource attached to the scene
func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
