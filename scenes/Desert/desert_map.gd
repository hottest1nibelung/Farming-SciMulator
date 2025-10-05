extends Node2D

@onready var chat: Control = $Chat
func _ready() -> void:
	chat.start_writing("Imagine standing in the heart of the Sahara desert—sun blazing overhead, the air dry and unforgiving. In such a place, water is more precious than gold. Today, we unveil a circuit designed to transform that very sunlight into a source of life: water.
At the core of this system are photovoltaic panels, tirelessly absorbing the abundant solar energy. This energy flows into a storage battery, ensuring that the system can function even after sunset. From the battery, the current drives a thermoelectric element—an ingenious device that, when electricity passes through it, instantly creates two zones: one side becomes hot while the other side becomes cold.
This contrast in temperature becomes the key. On the hot side, the desert air warms and rises. On the cold side, that same air condenses—tiny droplets forming as if from nowhere. These droplets trickle down into a container, collecting as usable water. What begins as dry desert air is converted, drop by drop, into a vital resource.
The simplicity of the circuit—solar panel, battery, thermoelectric element, water container—belies its potential impact. In an environment defined by scarcity, this system creates a new path toward sustainability, harnessing the power of the sun not only for electricity but for life itself.")
func _on_instalatie_butt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/instalation/desert_animation.tscn")
