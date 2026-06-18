extends Control
@export var animation_player: AnimationPlayer
#animations
func _ready():
	animation_player.play("RESET")

func _process(_delta):
	testEsc()


func resume():
	animation_player.play_backwards("blur")
	await animation_player.animation_finished
	get_tree().paused = false
	

func pause():
	get_tree().paused = true
	animation_player.play("blur")


func _on_resume_button_pressed() -> void:
	resume()
	sfx.click()


func testEsc():
	if Input.is_action_just_pressed("esc") and not get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

	

func _on_main_menu_button_pressed() -> void:
	resume()
	sfx.click()
	SceneTransition.change_scene("res://Scenes/main_menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	sfx.click()

#sounds functions
func _on_resume_button_mouse_entered() -> void:
	sfx.hover()


func _on_restart_button_mouse_entered() -> void:
	sfx.hover()


func _on_main_menu_button_mouse_entered() -> void:
	sfx.hover()


func _on_quit_button_mouse_entered() -> void:
	sfx.hover()


func _on_quit_button_mouse_exited() -> void:
	sfx.release_hover()


func _on_main_menu_button_mouse_exited() -> void:
	sfx.release_hover()


func _on_restart_button_mouse_exited() -> void:
	sfx.release_hover()


func _on_resume_button_mouse_exited() -> void:
	sfx.release_hover()
