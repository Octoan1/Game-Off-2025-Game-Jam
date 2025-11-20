extends Node

@onready
var atrium = get_node("/root/FullMapTest/Objects/Atrium")
@onready
var living = get_node("/root/FullMapTest/Objects/Living")
@onready
var wing_a = get_node("/root/FullMapTest/Objects/WingA")
@onready
var wing_b = get_node("/root/FullMapTest/Objects/WingB")

var time = 1
var day = 1

func set_day(x):
	day = x

func set_time(x):
	time = x

func get_day() -> int:
	return day

func get_time() -> int:
	return time

func get_time_text() -> String:
	if time == 1:
		return "Morning"
	elif time == 2:
		return "Afternoon"
	elif time == 3:
		return "Evening"
	else:
		return "Night"

func get_location() -> String:
	if(atrium.visible == true):
		return "Atrium"
	if(living.visible == true):
		return "Living Room"
	if(wing_a.visible == true):
		return "Wing A"
	if(wing_b.visible == true):
		return "Wing B"
	return "Atrium"

# This funciton increments the time slot by 1, and 
# checks to update the day counter and reset the time back to morning (1)
func time_update():
	time = time+1
	# 3 time slots, 1, 2, and 3. When time reaches 4 the day ends
	if time == 4:
		time = 1
		day = day+1
