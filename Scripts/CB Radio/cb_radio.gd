extends Node2D

var checker = 0
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
		if checker < 1:
			checker = 1
			print("tubes complete")





func _on_back_button_pressed() -> void:
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")
