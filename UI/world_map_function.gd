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
@onready
var time_slot_manager = %TimeSlotManager
@onready
var time_label = get_node("Map/TimeLabel")

var location

func _ready():
	self.hide()
	update_time_label()
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

# checks if the player confirms leaving an area
func confirmed():
	self.show()
	time_slot_manager.time_update()
	update_time_label()
	emit_signal("confirmation")

# checks if the player cancels leaving an area
func cancelled():
	self.hide()
	emit_signal("release_player")

# checks if the player confirms entering an area
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

# checks if the player cancels entering an area
func cancelled_on_map():
	map_exit.hide()

# updates the time text at the top of the map
func update_time_label():
	time_label.text = "Time of day: " + time_slot_manager.get_time_text()
