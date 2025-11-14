extends Control

@onready var master_volume: HSlider = $Control/ScrollContainer/VBoxContainer/HBoxContainer2/MasterVolume
@onready var music_volume: HSlider = $Control/ScrollContainer/VBoxContainer/HBoxContainer3/MusicVolume
@onready var sfx_volume: HSlider = $Control/ScrollContainer/VBoxContainer/HBoxContainer4/SFXVolume
@onready var fullscreen: CheckBox = $Control/ScrollContainer/VBoxContainer/HBoxContainer/Fullscreen

signal setting_changed(category: String, key: String, value: Variant)
signal save_settings

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(SettingsManager.settings["audio"]["master_volume"])
	master_volume.value = SettingsManager.settings["audio"]["master_volume"]
	music_volume.value = SettingsManager.settings["audio"]["music_volume"]
	sfx_volume.value = SettingsManager.settings["audio"]["sfx_volume"]
	fullscreen.button_pressed = SettingsManager.settings["video"]["fullscreen"]
	connect("setting_changed", Callable(SettingsManager, "_on_setting_changed"))
	connect("save_settings", Callable(SettingsManager, "_on_save_settings"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	


func _on_master_volume_value_changed(value: float) -> void:
	emit_signal("setting_changed", "audio", "master_volume", value)
	pass # Replace with function body.


func _on_music_volume_value_changed(value: float) -> void:
	emit_signal("setting_changed", "audio", "music_volume", value)
	pass # Replace with function body.


func _on_sfx_volume_value_changed(value: float) -> void:
	emit_signal("setting_changed", "audio", "sfx_volume", value)
	pass # Replace with function body.


func _on_fullscreen_toggled(toggled_on: bool) -> void:
	emit_signal("setting_changed", "video", "fullscreen", toggled_on)
	pass # Replace with function body.


func _on_close_settings_button_pressed() -> void:
	emit_signal("save_settings")
	pass # Replace with function body.
