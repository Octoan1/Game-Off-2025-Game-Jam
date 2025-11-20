extends Control

@onready
var time_label = get_node("TimeLabel")
@onready
var day_label = get_node("DayLabel")
@onready
var area_label = get_node("AreaLabel")
@onready
var time_slot_manager = %TimeSlotManager
@onready
var confirmation_system = %PlayerConfirm
@onready
var world_map = %WorldMap



# Called when the node enters the scene tree for the first time.
func _ready():
	update_time_labels()
	update_location_label()
	world_map.connect("area_entered", update_location_label)
	world_map.connect("confirmation", update_time_labels)

func update_time_labels():
	time_label.text = "Time of day: " + time_slot_manager.get_time_text()
	day_label.text = "Day: " + str(time_slot_manager.get_day())

func update_location_label():
	area_label.text = "Location: " + time_slot_manager.get_location()
