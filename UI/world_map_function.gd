extends Control

#unused for now:
signal lower_location
signal right_location
signal left_location
signal up_location
signal release_player
signal confirmation

@onready
var confirmation_system = %PlayerConfirm

func _ready():
	self.hide()
	confirmation_system.connect("confirm_signal", confirmed)
	confirmation_system.connect("cancel_signal", cancelled)
	


	# move player / camera to that location on the map OR
	# load the room scene 
	# AND close the world map screen
func lower_button_pressed() -> void:
	self.hide()
	emit_signal("lower_location")
	print("lower button pressed")
	

func right_button_pressed() -> void:
	self.hide()
	emit_signal("right_location")
	print("right button pressed")


func left_button_pressed() -> void:
	self.hide()
	emit_signal("left_location")
	print("left button pressed")


func up_button_pressed() -> void:
	self.hide()
	emit_signal("up_location")
	print("up button pressed")
	

func confirmed():
	self.show()
	emit_signal("confirmation")

func cancelled():
	self.hide()
	emit_signal("release_player")
