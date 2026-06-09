extends Sprite2D

@onready var area = $Area2D
var dragging = false
var of = Vector2(0, 0)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if dragging:
		position = position.lerp(get_global_mouse_position() - of, 0.2)
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _on_button_button_down():
	dragging = true
	of = get_global_mouse_position() - global_position



func _on_button_button_up():
	dragging = false


func _on_area_2d_tube_2_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
