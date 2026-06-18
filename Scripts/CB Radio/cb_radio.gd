extends Node2D

@export var noise : AudioStreamPlayer
@export var chatter : AudioStreamPlayer

var tube_checker = 0
var CB_Radio_complete = false
var tubes_complete = false
var knobs_complete = false
@export var tube_1 : Area2D 
@export var tube_2 : Area2D
@export var tube_3 : Area2D
@export var knob_1 : Control
@export var knob_2 : Control
@export var completeCheck : Sprite2D

signal noteGot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if State.CB_Radio_complete == true:
		tube_1.litTube1.visible = true
		tube_2.litTube2.visible = true
		tube_3.litTube3.visible = true
		$Tubes.Tube1.visible = false
		$Tubes.Tube2.visible = false
		$Tubes.Tube3.visible = false
		chatter.play()
	# Collectible check.
	if not State.coinCollected:
		$Collectible/coinButton.show()
	else:
		$Collectible/coinButton.hide()
	if not State.noteCheck2:
		noteGot.connect(State._noteCollect2)
		noteGot.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if State.CB_Radio_complete == false:

		if tube_1.litTube.visible == true and tube_2.litTube.visible == true and tube_3.litTube.visible == true:
			tubes_complete = true
			if tube_checker < 1:
				tube_checker = 1
				noise.play()
				print("tubes complete")

		if knob_1.current_number == 6 and knob_2.current_number == 9 and tubes_complete == true:
			knobs_complete = true
			if tube_checker < 2:
				tube_checker = 2
				noise.stop()
				chatter.play()
				print("knobs complete")

		if tubes_complete == true and knobs_complete == true:
			if tube_checker < 3:
				tube_checker = 3
				print("CB Radio complete")
				CB_Radio_complete = true
	else:
		pass
			



func _on_back_button_pressed() -> void:
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")
	noise.stop()
	chatter.stop()

# Collectible button.
func _on_coin_button_pressed() -> void:
	State.coinCollected = true
	$Collectible/coinButton.hide()
	sfx.play_sfx(sfx.collectible_get)
