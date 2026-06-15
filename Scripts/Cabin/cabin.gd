extends Node2D

# Cabin BG vars to switch
@onready var cabin_bg_vise: Sprite2D = $BG/CabinBGVise
@onready var cabin_bg_wheel: Sprite2D = $BG/CabinBGWheel

@onready var new_wheel: Sprite2D = $Wheel/NewWheel

@onready var ukulele_button: TextureButton = $Collectible/UkuleleButton

func _ready() -> void:
	# Collectible check.
	if State.ukuleleCollected:
		ukulele_button.hide()
	else:
		ukulele_button.show()
	# Replacement wheel display.
	if not State.wheelPurchased:
		new_wheel.hide()
	elif State.wheelPurchased:
		new_wheel.show()
	# Setting art based on whether or not wheel puzzle is solved.
	if State.wheelComplete:
		cabin_bg_vise.hide()
		cabin_bg_wheel.show()
		new_wheel.hide()
	else:
		cabin_bg_vise.show()
		cabin_bg_wheel.hide()

func _on_back_button_pressed() -> void:
	print("back")
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")

# Button for ukulele collectible.
func _on_ukulele_button_pressed() -> void:
	State.ukuleleCollected = true
	ukulele_button.hide()


func _on_mount_wheel_complete() -> void:
	State.wheelComplete = true
	cabin_bg_vise.hide()
	cabin_bg_wheel.show()
