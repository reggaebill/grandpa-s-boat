extends Control

@onready var totalSongs: Array = $AllSongs.get_children()
var currentSong: int = -1


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass
	
# Play music, connected to clicking on the radio. Loops through all songs in the music_master node, so we can add songs there and the loop will still work.
func play_music() -> void:
	if currentSong != -1:
		totalSongs[currentSong].stop()
	currentSong = (currentSong + 1) % totalSongs.size()
	if currentSong >= totalSongs.size():
		currentSong = 0
	totalSongs[currentSong].play()

# Unused stop function. Signal to this when we have a stop button, if we get that far.
func stop_music() -> void:
	totalSongs[currentSong].stop()
