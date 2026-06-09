extends Node2D

var tube_checker = 0
var CB_Radio_complete = false
var tubes_complete = false
var knobs_complete = false
@export var tube_1 : Area2D 
@export var tube_2 : Area2D
@export var tube_3 : Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if tube_1.litTube.visible == true and tube_2.litTube.visible == true and tube_3.litTube.visible == true:
		tubes_complete = true
		if tube_checker < 1:
			tube_checker = 1
			print("tubes complete")
	# if knob_1.knobTurned == true and knob_2.knobTurned == true and knob_3.knobTurned == true:
	# 	knobs_complete = true
	# 	if tube_checker < 2:
	# 		tube_checker = 2
	# 		print("knobs complete")
	
	if tubes_complete == true and knobs_complete == true:
		CB_Radio_complete = true






func _on_back_button_pressed() -> void:
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")
