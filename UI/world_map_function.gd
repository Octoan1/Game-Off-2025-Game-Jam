extends Control

#unused for now:
signal lower_location
signal right_location
signal left_location
signal up_location
signal release_player
signal confirmation
signal area_entered

@onready
var confirmation_system = %PlayerConfirm
@onready
var map_exit = %Confirmation
@onready
var time_slot_manager = %TimeSlotManager
@onready
var time_label = get_node("Map/TimeLabel")
@onready
var day_label = get_node("Map/DayLabel")
@onready
var atrium = get_node("/root/FullMapTest/Objects/Atrium")
@onready
var living = get_node("/root/FullMapTest/Objects/Living")
@onready
var wing_a = get_node("/root/FullMapTest/Objects/WingA")
@onready
var wing_b = get_node("/root/FullMapTest/Objects/WingB")

var location

func _ready():
	self.hide()
	update_time_labels()
	confirmation_system.connect("confirm_signal", confirmed)
	confirmation_system.connect("cancel_signal", cancelled)
	map_exit.connect("confirm_signal", confirmed_on_map)
	map_exit.connect("cancel_signal", cancelled_on_map)
	


	# move player / camera to that location on the map OR
	# load the room scene 
	# AND close the world map screen
func lower_button_pressed() -> void:
	map_exit.show()
	location = "atrium"

func right_button_pressed() -> void:
	map_exit.show()
	location = "wing_b"


func left_button_pressed() -> void:
	map_exit.show()
	location = "wing_a"


func up_button_pressed() -> void:
	map_exit.show()
	location = "living"

# checks if the player confirms leaving an area
func confirmed():
	self.show()
	time_slot_manager.time_update()
	update_time_labels()
	emit_signal("confirmation")

# checks if the player cancels leaving an area
func cancelled():
	self.hide()
	emit_signal("release_player")

# checks if the player confirms entering an area
func confirmed_on_map():
	self.hide()
	map_exit.hide()
	if(location == "living"):
		emit_signal("up_location")
		living.visible = true
		#hide_others(location)
	elif(location == "wing_a"):
		emit_signal("left_location")
		wing_a.visible = true
	elif(location == "wing_b"):
		emit_signal("right_location")
		wing_b.visible = true
	elif(location == "atrium"):
		emit_signal("lower_location")
		atrium.visible = true
	emit_signal("area_entered")

# checks if the player cancels entering an area
func cancelled_on_map():
	map_exit.hide()

# updates the time text at the top of the map
func update_time_labels():
	time_label.text = "Time of day: " + time_slot_manager.get_time_text()
	day_label.text = "Day: " + str(time_slot_manager.get_day())

#func hide_others(area)
	#if(area == "living"):
		#wing_b.visible = false
		#wing_a.visible = false
