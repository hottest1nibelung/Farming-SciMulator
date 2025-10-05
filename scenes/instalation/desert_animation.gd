extends Node2D
@onready var chat: Control = $Chat

func _ready() -> void:
	chat.start_writing("The functioning of our system is based on a simple but powerful principle: using the extreme solar energy of the Sahara not only as a heat source but as a tool to extract water from the very air that surrounds us.

The photovoltaic panels capture sunlight and convert it into electricity. This electricity is stabilized and stored in a battery, ensuring continuous operation, even during the night or when sunlight intensity fluctuates. From this energy source, we power a thermoelectric element, a solid-state device that creates a sharp temperature gradient—one surface heats up, while the other cools down.
When air passes between these two surfaces, a natural cycle is created. The hot side encourages evaporation and air movement, while the cold side forces condensation, causing invisible moisture from the desert air to become visible droplets of liquid water. The droplets then flow into a collection container, forming clean, usable water without the need for complex moving machinery or external chemicals.

This principle of combining renewable energy with condensation technology makes the system highly adaptable and sustainable. In the Sahara, where extreme solar radiation is often seen as an obstacle to life, it becomes the driving force behind creating it. With every drop condensed, the desert moves one step closer to being a livable environment, where agriculture, habitation, and human development become possible.

The vital importance of this system lies not only in its technical feasibility but in its potential social and ecological impact. By decentralizing water production, entire communities could sustain themselves, reducing reliance on distant supply chains or vulnerable infrastructure. In the long term, scalable units like this could transform arid regions into places where people can not only survive but thrive.

Moreover, the water produced by this method can be directly integrated into sustainable farming practices. By ensuring a local, renewable, and consistent water supply, farmers can cultivate crops in areas previously thought inhospitable. This creates opportunities for precision irrigation, soil restoration, and climate-resilient agriculture—turning the harsh desert into productive land and laying the foundation for sustainable food security in one of the most challenging environments on Earth.
This is not just a technological innovation; it is a call to action. A call to reimagine deserts as fertile grounds for resilience, to empower communities with self-sufficiency, and to prove that with creativity and renewable energy, even the harshest landscapes can become oases of sustainable farming and life.")
func _process(delta: float) -> void:
	$system/Path2D/PathFollow2D.progress += 2
