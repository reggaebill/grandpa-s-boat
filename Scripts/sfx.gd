extends Control

@onready var button_hover: AudioStreamPlayer = $button_hover
@onready var button_click: AudioStreamPlayer = $button_click
@onready var cbradio_tubes: AudioStreamPlayer = $cbradio_tubes
@onready var cbradio_tubeplug: AudioStreamPlayer = $cbradio_tubeplug

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_sfx(target) -> void:
	target.play()
	await target.finished
	target.stop()

func hover() -> void:
	button_hover.play()

func click() -> void:
	button_click.play()

func release_hover() -> void:
	button_hover.play()
