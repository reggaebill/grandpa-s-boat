extends Area2D

## Contact plate 1, only accepts yellow wire.

var wire_entered = false
var active_wire = null

@export var yellowWire: Sprite2D
@export var greenWire: Sprite2D
@export var redWire: Sprite2D

@export var wireNewY: Sprite2D
@export var wireNewG: Sprite2D
@export var wireNewR: Sprite2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	#verify which wire entered and handle accordingly
	if wire_entered == true and active_wire == yellowWire:# and yellowWire.position.distance_to(position) < 35:	
		if yellowWire.dragging == false:
			yellowWire.visible = false
			wireNewY.visible = true
	elif wire_entered == true and active_wire == greenWire:# and greenWire.position.distance_to(position) < 35:
		if wireNewG.visible == true:
			pass
		elif greenWire.dragging == true:
			pass
		elif greenWire.dragging == false:
			greenWire.position = position
	elif wire_entered == true and active_wire == redWire:# and redWire.position.distance_to(position) < 35:
		if wireNewR.visible == true:
			pass
		elif redWire.dragging == true:
			pass
		elif redWire.dragging == false:
			redWire.position = position



func _on_area_entered(area: Area2D) -> void:
	#wire_entered = true
	# Checks which wire is entering by name, then sets that as the active wire.
	if area.name == "Area2DWireY":
		active_wire = yellowWire
		wire_entered = true
	elif area.name == "Area2DWireG":
		active_wire = greenWire
		wire_entered = true
	elif area.name == "Area2DWireR":
		active_wire = redWire
		wire_entered = true


func _on_area_exited(area: Area2D) -> void:
	wire_entered = false
