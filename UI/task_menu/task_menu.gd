extends Control

@onready var container = $Panel/VBoxContainer

func add_task(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.modulate = Color.GRAY
	container.add_child(label)

func remove_task(text: String) -> void:
	for child in container.get_children():
		if child is Label and child.text == text:
			child.queue_free()
			return

func clear_tasks():
	for child in container.get_children():
		child.queue_free()
		
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and not event.is_echo():
		if event.keycode == Key.KEY_P:
			add_task("Testing")
	pass
