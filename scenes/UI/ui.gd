extends Control

@onready var audio_player = $OptionsUI/AudioStreamPlayer2D
@onready var volume_scroll = $OptionsUI/HScrollBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume_scroll.value = 1
	$OptionsUI.process_mode = Node.PROCESS_MODE_ALWAYS
	$OptionsUI.visible = false
	$ButtonsAndLabels.process_mode = Node.PROCESS_MODE_ALWAYS


func _on_options_butt_pressed() -> void:
	$OptionsUI.visible = true
	get_tree().paused = true

func _on_close_butt_pressed() -> void:
	$OptionsUI.visible = false
	get_tree().paused = false


func _on_ret_butt_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file(Global.current_farm)


func _on_h_scroll_bar_value_changed(value: float) -> void:
	audio_player.volume_db = linear_to_db(value)


func _on_audio_stream_player_2d_finished() -> void:
	$OptionsUI/AudioStreamPlayer2D.play()
