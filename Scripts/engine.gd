extends Node2D

@onready var oldParts: Node2D = $OldParts
@onready var newParts: Node2D = $NewParts
@onready var cardPack: TextureButton = $Collectible/CardPack
@onready var replacementParts: Node2D = $ReplacementParts


func _ready() -> void:
	# Check the collectible status.
	if State.cardCollected == true:
		cardPack.hide()
	else:
		cardPack.show()
	# Set up scene.
	oldParts.hide()
	newParts.hide()
	replacementParts.hide()
	print(State.enginePartsPurchased)
	# Check State flags to see what should be showing.
	if State.enginePartsPurchased == false:
		oldParts.show()
		newParts.hide()
	elif State.engineFixed == true:
			oldParts.hide()
			replacementParts.hide()
			newParts.show()
	else:
		oldParts.hide()
		newParts.show()
		

func _on_back_button_pressed() -> void:
	print("back")
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")


func _on_card_pack_pressed() -> void:
	State.cardCollected = true
	cardPack.hide()
	
