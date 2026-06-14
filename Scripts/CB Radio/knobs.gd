extends Node2D
@export var knob_1 : Control
@export var knob_2 : Control
@export var knob_button1 : Button
@export var knob_button2 : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if knob_1.current_number == 6 and knob_2.current_number == 9:
		print("knobs complete")
		knob_button1.disabled = true
		knob_button2.disabled = true
