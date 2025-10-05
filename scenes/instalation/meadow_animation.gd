extends Node2D
@onready var chat: Control = $Chat
func _ready() -> void:
	chat.start_writing("In many meadow regions, once rich with steady rain and green fields, climate change is reshaping the landscape. Summers are becoming hotter, rainfall less reliable, and fertile land is turning dry. Communities and farmers here face a growing problem: how to secure water when nature no longer guarantees it.
Our system provides a solution. Photovoltaic panels capture sunlight and store the energy in a battery. That energy powers a condenser, a device that cools the passing air until the hidden moisture inside condenses into droplets of water. These droplets are collected in a container, becoming clean and ready to use.
In this way, even during long periods without rain, the air itself becomes a reliable source of water. The process is simple, renewable, and requires no chemicals—only solar energy and the natural cycle of condensation.
The impact for meadow regions is clear. This system helps stabilize farming by providing irrigation when rainfall fails. It supports sustainable agriculture, protects soil from drying out, and ensures communities have the water they need. By turning air into water, the system makes life more resilient, even under the pressures of global warming.")
func _process(delta: float) -> void:
	$system/Path2D/PathFollow2D.progress += 2
