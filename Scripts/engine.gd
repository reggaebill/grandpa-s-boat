extends Node2D

@onready var oldParts: Node2D = $OldParts
@onready var fixedWireY: Sprite2D = $NewParts/YellowWireNew
@onready var fixedWireG: Sprite2D = $NewParts/GreenWireNew
@onready var fixedWireR: Sprite2D = $NewParts/RedWireNew
@onready var cardPack: TextureButton = $Collectible/CardPack
@onready var replacementParts: Node2D = $ReplacementParts
@onready var newParts: Node2D = $NewParts

func _ready() -> void:
		# Check the collectible status.
	if State.cardCollected == true:
		cardPack.hide()
	else:
		cardPack.show()
		# Set up scene.
	oldParts.hide()
	replacementParts.hide()
	newParts.hide()
		# TEST FLAGS to be uncommented for testing.
	#State.enginePartsPurchased = true
	
		# Check State flags to see what should be showing.
	if State.engineFixed == true:
		oldParts.hide()
		replacementParts.hide()
		newParts.show()
	elif State.enginePartsPurchased == true and State.engineFixed == false:
		oldParts.hide()
		replacementParts.show()
		newParts.show()
		fixedWireY.hide()
		fixedWireG.hide()
		fixedWireR.hide()
	else:
		oldParts.show()
		replacementParts.hide()
		newParts.hide()
	
func _process(_delta: float) -> void:
	# Check for completion signals.
	#print (State.yellowGoal, State.greenGoal, State.redGoal)
	if State.yellowGoal == true and State.greenGoal == true and State.redGoal == true:
		State.engineFixed = true
	
func _on_back_button_pressed() -> void:
	print("back")
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")


func _on_card_pack_pressed() -> void:
	State.cardCollected = true
	cardPack.hide()

func _yellowWireComplete() -> void:
	State.yellowGoal = true

func _greenWireComplete() -> void:
	State.greenGoal = true

func _redWireComplete() -> void:
	State.redGoal = true
