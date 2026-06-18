extends Node2D

@onready var big_mouth_billy: TextureButton = $Collectible/BigMouthBilly
@onready var radio_sparks: CPUParticles2D = $Sparks/RadioSparks
@onready var engine_sparks: CPUParticles2D = $Sparks/EngineSparks
@onready var wheel_sparks: CPUParticles2D = $Sparks/WheelSparks
@onready var wheel_sprite: Sprite2D = $WheelSprite

func _ready() -> void:
	wheel_sprite.hide()
	if not State.bassCollected:
		big_mouth_billy.show()
	else:
		big_mouth_billy.hide()
	if State.CB_Radio_complete:
		radio_sparks.hide()
	if State.engineFixed:
		engine_sparks.hide()
	if State.wheelComplete:
		wheel_sparks.hide()
		wheel_sprite.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_hull_pressed() -> void:
	print("hull")
	SceneTransition.change_scene("res://Scenes/hull.tscn")

func _on_engine_pressed() -> void:
	print("engine")
	SceneTransition.change_scene("res://Scenes/Engine.tscn")


func _on_cb_radio_pressed() -> void:
	print("cb radio")
	SceneTransition.change_scene("res://Scenes/CB Radio.tscn")


func _on_cabin_pressed() -> void:
	print("cabin")
	SceneTransition.change_scene("res://Scenes/cabin.tscn")


func _on_store_sign_pressed() -> void:
	print("shop")
	SceneTransition.change_scene("res://Scenes/shop.tscn")


func _on_big_mouth_billy_pressed() -> void:
	State.bassCollected = true
	big_mouth_billy.hide()
	sfx.play_sfx(sfx.collectible_get)
	
