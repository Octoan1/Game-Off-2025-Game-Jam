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
@onready
var map_exit = %Confirmation

var location

func _ready():
	self.hide()
	confirmation_system.connect("confirm_signal", confirmed)
	confirmation_system.connect("cancel_signal", cancelled)
	map_exit.connect("confirm_signal", confirmed_on_map)
	map_exit.connect("cancel_signal", cancelled_on_map)
	


	# move player / camera to that location on the map OR
	# load the room scene 
	# AND close the world map screen
func lower_button_pressed() -> void:
	map_exit.show()
	location = "lower"

func right_button_pressed() -> void:
	map_exit.show()
	location = "right"


func left_button_pressed() -> void:
	map_exit.show()
	location = "left"


func up_button_pressed() -> void:
	map_exit.show()
	location = "up"

func confirmed():
	self.show()
	emit_signal("confirmation")

func cancelled():
	self.hide()
	emit_signal("release_player")

func confirmed_on_map():
	self.hide()
	map_exit.hide()
	if(location == "up"):
		emit_signal("up_location")
	elif(location == "left"):
		emit_signal("left_location")
	elif(location == "right"):
		emit_signal("right_location")
	elif(location == "lower"):
		emit_signal("lower_location")

func cancelled_on_map():
	map_exit.hide()
