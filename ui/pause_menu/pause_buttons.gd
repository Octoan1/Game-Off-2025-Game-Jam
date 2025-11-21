#extends VBoxContainer
#
#@export var x_offset := 1000  # how much each item shifts right
#@export var y_offset := 0   # optional vertical tweak
#
#func _ready():
	#for i in range(get_child_count()):
		#var child = get_child(i)
		#if child is Control:
			#child.position.x = i * x_offset
			#child.position.y += i * y_offset
