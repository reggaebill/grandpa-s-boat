extends Control

@onready var bass: TextureRect = $Collectibles/GridContainer/Panel/Bass
@onready var coin: TextureRect = $Collectibles/GridContainer/Panel2/Coin
@onready var cards: TextureRect = $Collectibles/GridContainer/Panel3/Cards
@onready var ukulele: TextureRect = $Collectibles/GridContainer/Panel4/Ukulele
@onready var new_wires: TextureRect = $Collectibles/GridContainer/Panel5/NewWires
@onready var new_wheel: TextureRect = $Collectibles/GridContainer/Panel6/NewWheel
@onready var sNote2: Label = $SelfNotes/VBoxContainer/SNote2/MarginContainer/Label
@onready var sNote3: Label = $SelfNotes/VBoxContainer/SNote3/MarginContainer/Label
@onready var sNote4: Label = $SelfNotes/VBoxContainer/SNote4/MarginContainer/Label


var is_open:= false

func _ready() -> void:
	# Set collectibles and extra notes to hidden.
	bass.hide()
	coin.hide()
	cards.hide()
	ukulele.hide()
	new_wires.hide()
	new_wheel.hide()
	sNote2.hide()
	sNote3.hide()
	sNote4.hide()
	# Show collectibles that have been collected and not sold.
	if State.cardCollected and not State.cardSold:
		cards.show()
	if State.coinCollected and not State.coinSold:
		coin.show()
	if State.ukuleleCollected and not State.ukuleleSold:
		ukulele.show()
	if State.bassCollected and not State.bassSold:
		bass.show()
	# Same, but for purchaseables.
	if State.wheelPurchased and not State.wheelComplete:
		new_wheel.show()
	if State.enginePartsPurchased and not State.engineFixed:
		new_wires.show()
	# Show notes that have been discovered.
	if State.noteCheck1:
		sNote2.show()
	if State.noteCheck2:
		sNote3.show()
	if State.noteCheck3:
		sNote4.show()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("tab"):
		if is_open:
			close()
		else:
			open()
	# Duplicated checks from _ready, so they always work on opening the screen.
	if State.noteCheck1:
		sNote2.show()
	if State.noteCheck2:
		sNote3.show()
	if State.noteCheck3:
		sNote4.show()
	if State.cardCollected and not State.cardSold:
		cards.show()
	if State.coinCollected and not State.coinSold:
		coin.show()
	if State.ukuleleCollected and not State.ukuleleSold:
		ukulele.show()
	if State.bassCollected and not State.bassSold:
		bass.show()

func open():
	self.move_to_front()
	self.visible = true
	is_open = true

func close():
	visible = false
	is_open = false
