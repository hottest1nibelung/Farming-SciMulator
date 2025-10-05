extends Control

@onready var animation: AnimatedSprite2D = $CanvasLayer/AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var label: RichTextLabel = $CanvasLayer/RichTextLabel
@onready var next_button:= $CanvasLayer/NextButton
@onready var chat: Control = $Chat

var level_file
var done = false

var typing_speed := 0.04
var full_text: String = ""
var chunks: Array[String] = []
var current_chunk_index: int = 0
var current_char: int = 0
var current_text: String = ""
var MAX_WORDS_PER_CHUNK = 400

func _ready() -> void:
	pass
func start_writing(text: String) -> void:
	done = false
	full_text = text
	chunks.clear()
	current_chunk_index = 0
	
	var pos := 0
	while pos < full_text.length():
		chunks.append(full_text.substr(pos, MAX_WORDS_PER_CHUNK))
		pos += MAX_WORDS_PER_CHUNK
	
	_show_chunk()

func _show_chunk() -> void:
	if current_chunk_index >= chunks.size():
		label.text = "[END]"
		done = true
		return
	
	current_text = chunks[current_chunk_index]
	current_char = 0
	label.clear()
	timer.wait_time = typing_speed
	timer.start()
	animation.play("talking")
	next_button.disabled = true

func _on_timer_timeout() -> void:
	if current_char < current_text.length():
		label.append_text(current_text[current_char])
		current_char += 1
	else:
		timer.stop()
		animation.play("idle")
		next_button.disabled = false


func _on_next_button_pressed() -> void:
	if done:
		queue_free()
	current_chunk_index += 1
	_show_chunk()
