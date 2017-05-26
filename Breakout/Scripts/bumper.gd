extends KinematicBody2D

const BUMPER_SPEED = 200
var bumper_position = get_pos()

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if(Input.is_action_pressed("move_left")):
		bumper_position.x += -BUMPER_SPEED * delta
	if(Input.is_action_pressed("move_right")):
		bumper_position.x += BUMPER_SPEED * delta
	set_pos(bumper_position)