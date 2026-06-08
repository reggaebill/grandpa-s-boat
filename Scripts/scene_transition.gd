extends CanvasLayer
@onready var animation = get_node("AnimationPlayer")

func change_scene(target: String) -> void:
	animation.play("basic_fade")
	await animation.animation_finished
	get_tree().change_scene_to_file(target)
	animation.play_backwards("basic_fade")

# func reset():
# 	animation.play("try_again")
# 	await animation.animation_finished
# 	get_tree().reload_current_scene()
# 	animation.play_backwards("try_again")

# func end_scene():
# 	animation.play("quick")
# 	await animation.animation_finished
# 	animation.play_backwards("quick")
# 	get_tree().change_scene_to_file("res://Scenes/end cine.tscn")

# func open_scene():
# 	animation.play("quick")
# 	await animation.animation_finished
# 	animation.play_backwards("quick")
# 	get_tree().change_scene_to_file("res://Scenes/open_cine.tscn")


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	pass # Replace with function body.
