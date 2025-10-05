extends Node2D
var result = null
@onready var result_label = $resultLabel

@onready var time_spin_box: SpinBox = $variable4/timeSpinBox
@onready var max_temp_spin_box: SpinBox = $variable2/maxTempSpinBox
@onready var min_temp_spin_box: SpinBox = $variable3/minTempSpinBox
@onready var l_1_spin_box: SpinBox = $variable2/l1SpinBox
@onready var l_2_spin_box: SpinBox = $variable3/l2SpinBox

const pan_tension = 168 #V
const pan_intensity = 10 #A
const pan_dims = Vector2(1.7, 1.0) #width and height
const bat_tension = 200#battery tension = 200V
const bat_intensity =12#A
const h = 50
const cp = 1005

func _process(delta: float) -> void:
	$system/Path2D/PathFollow2D.progress += 2
	
func _on_calculate_butt_pressed() -> void:
	var temp_min = (min_temp_spin_box.value)
	var temp_max = (max_temp_spin_box.value)
	var time= (time_spin_box.value)
	var l1  =(l_1_spin_box.value)
	var l2  = (l_2_spin_box.value)
	
	var n = 0.05 - 0.1 * (temp_min/(temp_max - temp_min))
	print(n)
	var A = l1 * l2
	print(A)
	var Q = h * A
	print(Q)
	var m = Q/cp
	print(m)
	var z = Q/(n * 1800)
	print(z)
	var volume = m * z * time
	print(volume)
	result_label.text = "Volume of water resulted =" + str(volume)
	
