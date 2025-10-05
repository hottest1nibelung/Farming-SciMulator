extends Node2D


func _on_desert_butt_pressed() -> void:
	Global.current_farm = "res://scenes/Desert/desert_map.tscn"
	load_farm()

func _on_meadow_butt_pressed() -> void:
	Global.current_farm = "res://scenes/Meadow/harta.tscn"
	load_farm()


func _on_mountain_pressed() -> void:
	Global.current_farm = "res://scenes/Mountain/munte.tscn"
	load_farm()

func load_farm():
	get_tree().change_scene_to_file(Global.current_farm)
