extends Node2D
# Shop level to handle buying and selling. I'm planning on making this just a bunch of state.gd flag changes.

@onready var moneyAmount: Label = $MoneyCounter/MoneyMargin/HBoxContainer/Label

func _ready() -> void:
	# When scene loads, set the money display to show whatever is stored in state.gd.
	moneyAmount.text = str("$", State.money)

func _on_back_button_pressed() -> void:
	print("back")
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")

func _on_sell_button_pressed() -> void:
	if State.cardCollected and not State.cardSold:
		moneyAmount.text = str("$", State.money + 10)
		State.cardSold = true
