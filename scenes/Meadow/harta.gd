extends Node2D
@onready var ai_chat: Control = $AI_chat


func _on_mine_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/metalDetector/metal_detector.tscn")


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/playMusictoThePlants/play_music_game.tscn")


func _on_instalation_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instalation/meadow_animation.tscn")


func _on_bug_butt_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/shoot bugs/shoot_bugs.tscn")


func _on_card_game_butt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/cardGame/card_game.tscn")


func _on_woman_butt_pressed() -> void:
	open_ai()

func open_ai():
	ai_chat.get_node("CanvasLayer").visible = not(ai_chat.get_node("CanvasLayer").visible)
