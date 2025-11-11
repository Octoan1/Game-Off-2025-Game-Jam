extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%SettingsPanel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	# TODO: implement play
	pass
