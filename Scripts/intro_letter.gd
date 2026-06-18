extends Control

@onready var title_text: Label = $Title/TitleText
@onready var _1: Label = $"MarginContainer/VBoxContainer/1"
@onready var _2: Label = $"MarginContainer/VBoxContainer/2"
@onready var _3: Label = $"MarginContainer/VBoxContainer/3"
@onready var _4: Label = $"MarginContainer/VBoxContainer/4"
@onready var _5: Label = $"MarginContainer/VBoxContainer/5"
@onready var _6: Label = $"MarginContainer/VBoxContainer/6"
@onready var _7: Label = $"MarginContainer/VBoxContainer/7"
@onready var _8: Label = $"MarginContainer/VBoxContainer/8"
@onready var _9: Label = $"MarginContainer/VBoxContainer/9"
@onready var _10: Label = $"MarginContainer/VBoxContainer/10"
@onready var _11: Label = $"MarginContainer/VBoxContainer/11"
@onready var _12: Label = $"MarginContainer/VBoxContainer/12"
@onready var cont_button: Button = $ContButton

func _ready() -> void:
	title_text.hide()
	await get_tree().create_timer(1.5).timeout
	title_text.show()
	await get_tree().create_timer(1.5).timeout
	await body_text("If you are reading this, I regret to inform you of my passing.", _1)
	await body_text("There is some good news, however. I have decided to leave you my prized possession.", _2)
	await body_text("Please take care of the Valiant Attempt, my old fishing boat.", _3)
	await body_text("She'll need some fixing up, but I left you a journal with some notes on how to go about that.", _4)
	await body_text("Just press the J key to look at the journal.", _5)
	await body_text("Good luck out there.", _6)
	await body_text("-Sincerely yours,", _11)
	await body_text("Grandpa", _12)
	await get_tree().create_timer(1.5).timeout
	cont_button.show()
	

func body_text(text: String, box: Label) -> void:
	box.show()
	box.text = text
	await get_tree().create_timer(2.0).timeout

func _on_cont_button_pressed() -> void:
	SceneTransition.change_scene("res://Scenes/Boat Overview.tscn")
