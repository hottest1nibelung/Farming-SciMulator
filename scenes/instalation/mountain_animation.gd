extends Node2D
@onready var chat: Control = $Chat

func _ready() -> void:
	chat.start_writing("High above the valleys, where civilizations cling to the slopes of mountains, the challenge is not always dryness but access. Water is locked in clouds, mist, and thin streams, while communities below must climb or depend on distant infrastructure. Our system offers a new way forward: a circuit designed to extract water directly from the air itself.
Photovoltaic panels collect solar energy, which is stored in a battery for stable operation day and night. That energy powers a large condenser—engineered to exploit the natural properties of humid mountain air. As the cold, moisture-rich air passes through the condenser, the pressure and temperature differences cause the invisible water vapor to transform into droplets.
These droplets accumulate on the condenser surface and flow into a container, forming clean, drinkable water with no added chemicals or moving parts. What once drifted as mist in the air now becomes a reliable water source for the communities that need it most.
This approach is more than technical—it is transformative. By placing these systems at high altitudes, civilizations can secure their own water supply directly from the sky, reducing dependence on pipelines or melting snowpack.
The impact goes further: integrated into sustainable farming, this water can irrigate mountain terraces, support precision agriculture, and stabilize food production in regions where farming is vulnerable to climate change. With every drop condensed, remote mountain communities move closer to resilience, self-sufficiency, and a sustainable future.")

func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress += 2
