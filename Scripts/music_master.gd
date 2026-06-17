extends Control

@onready var totalSongs: Array = $AllSongs.get_children()
@onready var waves_ambience: AudioStreamPlayer = $Ambience/WavesAmbience

var currentSong: int = -1


func _ready() -> void:
	waves_ambience.play()
	for song in totalSongs:
		song.finished.connect(_on_song_finished)

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

# Test func, doesn't work yet.
func _on_song_finished():
	print("Done playing.")
	play_music()
