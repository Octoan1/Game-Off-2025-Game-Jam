extends CharacterBody2D


@export var SPEED : float = 300.0
var can_move = true

@onready var actionable_finder: Area2D = $Direction/ActionableFinder

func _physics_process(_delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction := Input.get_axis("move_left", "move_right")
	var vertical_direction := Input.get_axis("move_up", "move_down")
	
	if(can_move == true):
		if horizontal_direction or vertical_direction:
			velocity.x = horizontal_direction * SPEED
			velocity.y = vertical_direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
	else:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()
	
	
# once space is clicked, checks actionable collison box for character
# if something in collision, interact and do dialogue
func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_just_pressed("ui_accept"):
			var actionables = actionable_finder.get_overlapping_areas()
			if actionables.size() > 0:
				actionables[0].action()
				return
