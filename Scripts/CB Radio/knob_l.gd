extends Control

var knob_counter : RichTextLabel
var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
var current_number = numbers[0]
@onready var knobs: Array = $Knobs.get_children()

func _ready() -> void:
	if State.CB_Radio_complete == true:
		current_number = 6
		knob_counter = $knobL_Counter
		knob_counter.text = str(current_number)
		show_only_sprite(current_number) # Show the sprite corresponding to the current number, hide the others
	knob_counter = $knobL_Counter
	knob_counter.text = str(current_number)

func _on_button_button_down() -> void:
	current_number = (current_number + 1) % numbers.size()
	knob_counter.text = str(current_number)
	show_only_sprite(current_number) # Show the sprite corresponding to the current number, hide the others

func show_only_sprite(index: int) -> void:
	for i in range(knobs.size()):
		# Set true for the target index, false for everything else
		knobs[i].visible = (i == index)



#ROTATING DIAL DRAG CODE - NOT IN USE
# Emitted when the knob value changes (Range from 0.0 to 1.0)
# signal value_changed(value: float)

# @export var min_angle: float = -135.0 # Starting angle of the knob
# @export var max_angle: float = 135.0  # Ending angle of the knob

# var is_dragging: bool = false
# var current_value: float = 0.0

# func _gui_input(event: InputEvent) -> void:
# 	if event is InputEventMouseButton:
# 		if event.button_index == MOUSE_BUTTON_LEFT:
# 			is_dragging = event.pressed
# 			accept_event() # Stops the click from affecting other UI behind it

# 	elif event is InputEventMouseMotion and is_dragging:
# 		_calculate_knob_angle(get_global_mouse_position())

# func _calculate_knob_angle(global_mouse_pos: Vector2) -> void:
# 	var center_pos: Vector2 = global_position + size / 2.0
# 	# Calculate the angle of the mouse relative to the knob center
# 	var angle_to_mouse: float = rad_to_deg(center_pos.angle_to_point(global_mouse_pos)) - 90
	
# 	# Clamp the angle between our min and max limits
# 	var clamped_angle: float = angle_to_mouse
	
# 	# Rotate the visual TextureRect
# 	$knobL_Sprite.rotation_degrees = clamped_angle
	
# 	# Calculate and normalize the value (0.0 to 1.0)
# 	var total_range = max_angle - min_angle
# 	var normalized_angle = clamped_angle - min_angle
# 	current_value = clamp(normalized_angle / total_range, 0.0, 1.0)
	
# 	# Emit the updated value
# 	value_changed.emit(current_value)



