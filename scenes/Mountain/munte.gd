extends Node2D
@onready var chat: Control = $Chat

func _ready() -> void:
	if not Global.spaceInvadersSolved:
		$instalationButt.disabled = true
		chat.start_writing("Alert: A meteor shower is about to hit the mountatin farm. We need to send a drone into the outter space to protect the farm.")
		$Chat/CanvasLayer/enterLvl.visible = true
	else:
		$instalationButt.disabled = false
		chat.queue_free()
func _on_instalation_butt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instalation/mountain_animation.tscn")


func _on_enter_lvl_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/SpaceInvaders/space_invaders.tscn")
