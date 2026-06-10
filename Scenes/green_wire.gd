extends Sprite2D

var dragging = false
var of = Vector2(0, 0)

func _process(_delta):
	if dragging:
		position = position.lerp(get_global_mouse_position() - of, 0.2)
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE



func _on_button_button_down() -> void:
	dragging = true
	of = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
