extends Node2D
@onready var min_temp_spin_box: SpinBox = $variable/minTempSpinBox
@onready var max_temp_spin_box: SpinBox = $variable2/maxTempSpinBox
@onready var time_spin_box: SpinBox = $variable3/timeSpinBox
@onready var mountain_size_option_button: OptionButton = $mountainSizeOptionButton
@onready var gel_type_option_button: OptionButton = $gelTypeOptionButton

var result = null
const pan_tension = 168 #V
const pan_intensity = 10 #A
const pan_dims = Vector2(1.7, 1.0) #width and height
const bat_tension = 200#battery tension = 200V
const bat_intensity =12#A
const m = 0.01 #mass flow of the thermal agent
enum MOUNTAIN_H{SMALL, MEDIUM, LARGE}
var height
var gel #l
var time
var temp_min # minimum temperature
var temp_max #maximum temperature
enum GEL_TYPE{R134, R22, R410, WATER}

var mountain_h # the height of the mountain

@onready var result_label = $resultLabel


func gcd(a: int, b: int) -> int:
	while b != 0:
		var temp = b
		b = a % b
		a = temp
	return a

func lcm(a: int, b: int) -> int:
	return abs(a * b) / gcd(a, b)

func _process(delta: float) -> void:
	$system/Path2D/PathFollow2D.progress += 2

func get_mountain_height():
	match(mountain_size_option_button.text):
		"SMALL":
			mountain_h = 1400
		"MEDIUM":
			mountain_h = 1500
		"LARGE":
			mountain_h = 1600
		
func get_gel_type():
	match(gel_type_option_button.text):
		"R134":
			gel = 210
		"R22":
			gel = 235
		"R410":
			gel = 190
		"WATER":
			gel = 2257
			

func _on_calculate_butt_pressed() -> void:
	get_mountain_height()
	get_gel_type()
	
	temp_min = int(min_temp_spin_box.value)
	temp_max = int(max_temp_spin_box.value)
	time = int(time_spin_box.value)

	#var z = nr_condensers_spin_box.value
	var z
	var P = pan_tension * pan_intensity # power
	var Q = gel * m
	var N = 0.05 - 0.1 * (temp_min/(temp_max - temp_min))
	var Pcond = Q / N
	var _lcm = lcm(1680, 2400)
	_lcm = lcm(_lcm, int(Q/N))
	z = Q/ (_lcm * N)
	var volume = m * z * time * 100 + 1
	pass # Replace with function body.
	result_label.text = "Volume of water resulted = " + str(volume)
