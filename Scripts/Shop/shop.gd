extends Node2D
# Shop level to handle buying and selling. I'm planning on making this just a bunch of state.gd flag changes.

@onready var moneyAmount: Label = $MoneyCounter/MoneyMargin/HBoxContainer/Label
@onready var wheel_button: TextureButton = $Items/HBoxContainer/VBoxContainer2/WheelButton
@onready var wires_button: TextureButton = $Items/HBoxContainer/VBoxContainer/WiresButton
@onready var wires_price: Label = $Items/HBoxContainer/VBoxContainer/WiresPrice
@onready var wheel_price: Label = $Items/HBoxContainer/VBoxContainer2/WheelPrice


func _ready() -> void:
	# When scene loads, set the money display to show whatever is stored in state.gd.
	updateMoney()
	# Temp flag changing. Remove after shop debugging done.
	State.ukuleleCollected = true
	State.bassCollected = true
	State.cardCollected = true
	State.coinCollected = true

func _on_back_button_pressed() -> void:
	print("back")
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")
	
func updateMoney() -> void:
	moneyAmount.text = str("$", State.money)	

# Sell button will check if something is collected in the State flags, then sell it (if it hasn't already been sold.) Then adds money to State and adjusts the visible money counter.
func _on_sell_button_pressed() -> void:
	if State.cardCollected and not State.cardSold:
		State.money = State.money + 10
		updateMoney()
		State.cardSold = true
	if State.bassCollected and not State.bassSold:
		State.money = State.money + 20
		updateMoney()
		State.bassSold = true
	if State.coinCollected and not State.coinSold:
		State.money = State.money + 15
		updateMoney()
		State.coinSold = true
	if State.ukuleleCollected and not State.ukuleleSold:
		State.money = State.money + 5
		updateMoney()
		State.ukuleleSold = true

# Purchase the wires button.
func _on_wires_button_pressed() -> void:
	if State.money >= 5 and not State.enginePartsPurchased:
		State.money -= 5
		State.enginePartsPurchased = true
		updateMoney()
		wires_button.hide()
		wires_price.hide()

# Purchase the wheel button.
func _on_wheel_button_pressed() -> void:
	if State.money >= 40 and not State.wheelPurchased:
		State.money -= 40
		State.wheelPurchased = true
		updateMoney()
		wheel_button.hide()
		wheel_price.hide()
