extends Node2D

@onready var oldParts: Node2D = $OldParts
@onready var newParts: Node2D = $NewParts

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oldParts.hide()
	newParts.hide()
	print(State.enginePartsPurchased)
	if State.enginePartsPurchased == false:
		oldParts.show()
		newParts.hide()
	else:
		oldParts.hide()
		newParts.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_back_button_pressed() -> void:
	print("back")
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")
