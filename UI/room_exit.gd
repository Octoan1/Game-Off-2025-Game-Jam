extends Node2D

@onready
var map = %WorldMap
@onready
var player = %Player
@onready
var confirmation_system = %PlayerConfirm
@onready
var time_slot_manager = %TimeSlotManager

@onready
var atrium = get_node("/root/FullMapTest/Objects/Atrium")
@onready
var living = get_node("/root/FullMapTest/Objects/Living")
@onready
var wing_a = get_node("/root/FullMapTest/Objects/WingA")
@onready
var wing_b = get_node("/root/FullMapTest/Objects/WingB")


func _ready():
	map.connect("left_location", spawn_wing_a)
	map.connect("right_location", spawn_wing_b)
	map.connect("up_location", spawn_living)
	map.connect("lower_location", spawn_atrium)
	map.connect("release_player", player_released)
	map.connect("confirmation", show_map)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		confirmation_system.show()
		player.can_move = false
		

#make the level visible
func spawn_wing_a():
	wing_a.visible = true
	wing_b.visible = false
	atrium.visible = false
	living.visible = false
	player.position = Vector2(-1163.0, 498)
	player.can_move = true

func spawn_wing_b():
	wing_b.visible = true
	atrium.visible = false
	wing_a.visible = false
	living.visible = false
	player.position = Vector2(1270, 404)
	player.can_move = true
	

func spawn_living():
	living.visible = true
	atrium.visible = false
	wing_a.visible = false
	wing_b.visible = false
	player.position = Vector2(1749, -672)
	player.can_move = true

func spawn_atrium():
	atrium.visible = true
	living.visible = false
	wing_a.visible = false
	wing_b.visible = false
	player.position = Vector2(-1241, -64)
	player.can_move = true

func player_released():
	player.can_move = true

func show_map():
	map.show()
