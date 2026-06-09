extends Area2D

var tube_entered = false
var active_tube = null
@export var tube_1: Sprite2D
@export var tube_2: Sprite2D
@export var tube_3: Sprite2D
@onready var litTube = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	litTube.visible = false
	print(name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#verify which tube entered and handle accordingly
	if tube_entered == true and active_tube == tube_1 and tube_1.position.distance_to(position) < 20:	
		print("tube 1 entered")
		if tube_1.dragging == false:
			tube_1.visible = false
			litTube.visible = true
	elif tube_entered == true and active_tube == tube_2 and tube_2.position.distance_to(position) < 20:
		if litTube.visible == true:
			pass
		elif tube_3.dragging == false:
			tube_2.position = position
	elif tube_entered == true and active_tube == tube_3 and tube_3.position.distance_to(position) < 20:
		if litTube.visible == true:
			pass
		elif tube_3.dragging == false:
			tube_3.position = position


func _on_area_entered(area: Area2D) -> void:
	print("area entered " + area.name)
	if area.name == "Area2DTube1":
		active_tube = tube_1
		tube_entered = true
	elif area.name == "Area2DTube2":
		active_tube = tube_2
		tube_entered = true
	elif area.name == "Area2DTube3":
		active_tube = tube_3
		tube_entered = true
