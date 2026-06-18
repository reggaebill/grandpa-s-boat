extends Node2D

@onready var big_mouth_billy: TextureButton = $Collectible/BigMouthBilly

func _ready() -> void:
	if not State.bassCollected:
		big_mouth_billy.show()
	else:
		big_mouth_billy.hide()


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
	
