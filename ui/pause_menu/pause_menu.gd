extends Control

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	$ButtonBox/ResumeButton.connect("b_pressed", Callable(self, "_on_resume_pressed"))
	$ButtonBox/OptionsButton.connect("b_pressed", Callable(self, "_on_options_pressed"))
	$ButtonBox/QuitButton.connect("b_pressed", Callable(self, "_on_quit_pressed"))
	#SettingsPanel.hide()
	hide()  # start hidden

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		_toggle_pause()

func _toggle_pause():
	if visible:
		_resume_game()
	else:
		_pause_game()

func _pause_game():
	get_tree().paused = true
	show()
	audio_stream_player.play()
	anim.play("fade_in")

func _resume_game():
	get_tree().paused = false
	SettingsPanel.hide()
	hide()
	
func _on_resume_pressed():
	print("Resuming game...")
	_resume_game()

func _on_options_pressed():
	print("Opening options menu...")
	SettingsPanel.show()

func _on_quit_pressed():
	print("Quitting game...")
	get_tree().quit()
