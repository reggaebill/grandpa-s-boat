extends Area2D

## Contact plate 2, only accepts green wire.

var wire_entered = false
var active_wire = null
signal greenWireComplete

@export var yellowWire: Sprite2D
@export var greenWire: Sprite2D
@export var redWire: Sprite2D

@export var wireNewY: Sprite2D
@export var wireNewG: Sprite2D
@export var wireNewR: Sprite2D


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	#verify which wire entered and handle accordingly
	if wire_entered == true and active_wire == greenWire:
		if greenWire.dragging == false:
			greenWire.visible = false
			wireNewG.visible = true
			greenWireComplete.emit()

func _on_area_entered(area: Area2D) -> void:
	wire_entered = true
	# Checks which wire is entering by name, then sets that as the active wire.
	if area.name == "Area2DWireY":
		active_wire = yellowWire
	elif area.name == "Area2DWireG":
		active_wire = greenWire
	elif area.name == "Area2DWireR":
		active_wire = redWire

func _on_area_exited(_area: Area2D) -> void:
	wire_entered = false
