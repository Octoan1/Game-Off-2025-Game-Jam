extends Node2D

@onready
var map = %WorldMap
@onready
var player = %Player
@onready
var confirmation_system = %PlayerConfirm
@onready
var time_slot_manager = %TimeSlotManager


func _ready():
	map.connect("left_location", left_entrance)
	map.connect("right_location", right_entrance)
	map.connect("up_location", up_entrance)
	map.connect("lower_location", lower_entrance)
	map.connect("release_player", player_released)
	map.connect("confirmation", show_map)


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name)
	print("Map node: ", map)
	print("Confirmation node: ", confirmation_system)
	if body.name == "Player":
		confirmation_system.show()
		confirmation_system.position.x = player.position.x - 560
		confirmation_system.position.y = player.position.y - 200
		player.can_move = false
		

#player spawn location is hard coded for now. Can maybe replace with a designated point node or somethign
# that can spawn the player at the requested point?
func left_entrance():
	player.position = Vector2(100, 510)
	player.can_move = true

func right_entrance():
	player.position = Vector2(1800, 500)
	player.can_move = true
	

func up_entrance():
	player.position = Vector2(966, -415)
	player.can_move = true

func lower_entrance():
	player.position = Vector2(960, 1560)
	player.can_move = true

func player_released():
	player.can_move = true

func show_map():
	map.position = player.position
	map.show()
