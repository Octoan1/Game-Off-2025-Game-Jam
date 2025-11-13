extends Node

var settings := {
	"audio": {
		"master_volume": 1.0,
		"music_volume": 1.0,
		"sfx_volume": 1.0
	},
	"video": {
		"fullscreen": false
	}
}

func _ready():
	load_settings()
	apply_all_settings()
	

func load_settings():
	var cfg = ConfigFile.new()
	if cfg.load("user://settings.cfg") == OK:
		for section in settings.keys():
			for key in settings[section].keys():
				settings[section][key] = cfg.get_value(section, key, settings[section][key])
				print(settings[section][key])
	emit_signal("update_settings")

func save_settings():
	print("saving settings...")
	var cfg = ConfigFile.new()
	for section in settings.keys():
		for key in settings[section].keys():
			cfg.set_value(section, key, settings[section][key])
			cfg.save("user://settings.cfg")
			print(settings[section][key])

func apply_all_settings():
	apply_audio_settings()
	apply_video_settings()

func apply_audio_settings():
	# Master
	#var master_db = linear_to_db(settings["audio"]["master_volume"])
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), master_db)

	# Music
	#var music_db = linear_to_db(settings["audio"]["music_volume"] * settings["audio"]["master_volume"])
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), music_db)

	# SFX
	#var sfx_db = linear_to_db(settings["audio"]["sfx_volume"] * settings["audio"]["master_volume"])
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), sfx_db)
	pass
	
func apply_video_settings():
	if settings["video"]["fullscreen"] :
		# Currently doesn't work due to project settings
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else :
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	

	
func _on_setting_changed(category: String, key: String, value: Variant):
	if settings.has(category) and settings[category].has(key):
		settings[category][key] = value
		print("Setting changed:", category, key, value)
		save_settings()
