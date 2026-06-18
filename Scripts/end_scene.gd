extends Node2D
@onready var button: Button = $Button

func _ready() -> void:
	await get_tree().create_timer(4.0).timeout
	button.show()


func _on_button_pressed() -> void:
	get_tree().quit()
