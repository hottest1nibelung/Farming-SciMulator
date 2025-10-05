extends Control

@onready var input_field = $CanvasLayer/LineEdit
@onready var send_button = $CanvasLayer/Button
@onready var chat_display = $CanvasLayer/RichTextLabel

func _ready() -> void:
	send_button.pressed.connect(_on_send_pressed)
	Ai.ai_response.connect(_on_ai_response)  # connect to global AI signal

# Send message
func _on_send_pressed() -> void:
	var user_text = input_field.text.strip_edges()
	if user_text == "":
		return

	chat_display.append_text("[b]You:[/b] %s\n" % user_text)
	input_field.text = ""

	# Call global AI singleton
	Ai.send_to_ai(user_text)

	# Optional: show "thinking..."
	chat_display.append_text("[i]The peasant is thinking...[/i]\n")

# Receive AI reply
func _on_ai_response(text: String) -> void:
	# Remove "AI is thinking..." if present
	var current_text = chat_display.text
	if current_text.ends_with("[i]AI is thinking...[/i]\n"):
		chat_display.text = current_text.replace("[i]AI is thinking...[/i]\n", "")

	# Show actual AI reply
	chat_display.append_text("[color=green][b]AI:[/b][/color] %s\n" % text)
