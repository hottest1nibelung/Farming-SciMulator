extends CharacterBody2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 300.0
var orientation = 1
var stopped = true
var time_spent_idle = 1
const TIME_BEFORE_RAISING_HANDS = 5
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	time_spent_idle += delta
	if int(time_spent_idle) % TIME_BEFORE_RAISING_HANDS == 0:
		animation.play("hands_raised")
		time_spent_idle = 1
