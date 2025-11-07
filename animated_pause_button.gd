extends Button

@onready var highlight = $ColorRect
@onready var label = $CenterContainer
@onready var anim = $AnimationPlayer

func _ready():
	print("ready")
	highlight.modulate.a = 0
	label.scale = Vector2.ONE

func _on_mouse_entered():
	anim.play("hover_in")

func _on_mouse_exited():
	anim.play("hover_out")
