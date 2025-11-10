extends Control

signal confirm_signal
signal cancel_signal

func _ready():
	self.hide()

func confirm_pressed() -> void:
	emit_signal("confirm_signal")
	self.hide()

func cancel_pressed() -> void:
	emit_signal("cancel_signal")
	self.hide()
