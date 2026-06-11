extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
