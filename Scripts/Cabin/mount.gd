extends Node2D

var wheel_entered = false
#var active_wire = null
signal wheelComplete

@export var wheelSprite: Sprite2D

func _process(_delta: float) -> void:
	#verify which wire entered and handle accordingly
	if wheel_entered == true:
		if wheelSprite.dragging == false:
			wheelSprite.visible = false
			wheelComplete.emit()

func _on_mounting_point_area_entered(area: Area2D) -> void:
	wheel_entered = true

func _on_mounting_point_area_exited(area: Area2D) -> void:
	wheel_entered = false
