extends Node2D

@onready
var map = %WorldMap
@onready
var player = %Player

func _ready():
	map.connect("left_location", left_entrance)
	map.connect("right_location", right_entrance)
	map.connect("up_location", up_entrance)
	map.connect("lower_location", lower_entrance)

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Body entered: ", body.name)
	print("Map node: ", map)
	if body.name == "Player":
		map.show()
		map.position = player.position
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
