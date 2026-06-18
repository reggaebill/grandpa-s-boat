extends Control

var is_open:= false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("tab"):
		if is_open:
			close()
		else:
			open()

func open():
	self.move_to_front()
	self.visible = true
	is_open = true

func close():
	visible = false
	is_open = false
