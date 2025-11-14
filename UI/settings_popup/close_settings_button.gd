extends Button

signal setting_changed(category: String, key: String, value: Variant)

@onready var master_volume: HSlider = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/MasterVolume
@onready var music_volume: HSlider = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/MusicVolume
@onready var sfx_volume: HSlider = $Control/ScrollContainer/VBoxContainer/HBoxContainer4/SFXVolume
@onready var fullscreen: CheckBox = $Control/ScrollContainer/VBoxContainer/HBoxContainer/Fullscreen


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("setting_changed", SettingsManager._on_setting_changed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	emit_signal("setting_changed")
	pass
