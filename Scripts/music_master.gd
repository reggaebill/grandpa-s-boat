extends Control
var track_1 : AudioStreamPlayer
var track_2 : AudioStreamPlayer
var track_3 : AudioStreamPlayer

@onready var totalSongs: Array = $AllSongs.get_children()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	track_1 = $AllSongs/morning
	track_2 = $AllSongs/evening
	track_3 = $AllSongs/DnB
	print(totalSongs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	


func play_music() -> void:
	if track_1.playing == false and track_2.playing == false:
		track_1.play()
	elif track_1.playing == true:
		track_1.stop()
		track_2.play()
	elif track_2.playing == true:
		track_2.stop()
		track_3.play()
	elif track_3.playing:
		track_3.stop()
		
