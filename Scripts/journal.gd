extends Control

@onready var bass: TextureRect = $Collectibles/GridContainer/Panel/Bass
@onready var coin: TextureRect = $Collectibles/GridContainer/Panel2/Coin
@onready var cards: TextureRect = $Collectibles/GridContainer/Panel3/Cards
@onready var ukulele: TextureRect = $Collectibles/GridContainer/Panel4/Ukulele
@onready var new_wires: TextureRect = $Collectibles/GridContainer/Panel5/NewWires
@onready var new_wheel: TextureRect = $Collectibles/GridContainer/Panel6/NewWheel


var is_open:= false

func _ready() -> void:
	# Set collectibles to hidden.
	bass.hide()
	coin.hide()
	cards.hide()
	ukulele.hide()
	new_wires.hide()
	new_wheel.hide()
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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("tab"):
		if is_open:
			close()
		else:
			open()

func open():
	self.move_to_front()
	self.visible = true
	is_open = true

func close():
	visible = false
	is_open = false
