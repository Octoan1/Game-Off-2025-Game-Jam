extends Control

signal confirm_signal
signal cancel_signal

func _ready():
	self.hide()

func _on_confirm_button_pressed() -> void:
	emit_signal("confirm_signal")
	self.hide()

func _on_cancel_button_pressed() -> void:
	emit_signal("cancel_signal")
	self.hide()
