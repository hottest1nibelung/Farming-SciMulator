extends Camera2D

@export var zoom_step: float = 0.3
@export var min_zoom := 0.2

var dragging = false
var last_mouse_pos = Vector2.ZERO

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				last_mouse_pos = event.position
			else:
				dragging = false
	elif event is InputEventMouseMotion and dragging:
		var delta = event.position - last_mouse_pos
		position -= delta * zoom_step
		last_mouse_pos = event.position
