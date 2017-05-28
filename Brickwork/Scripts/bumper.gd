extends KinematicBody2D

var screen_size
var bumper_size

func _ready():
	screen_size = get_viewport_rect().size
	bumper_size = get_child(1).get_shape().get_extents()
	set_process(true)

func _process(delta):
	var bumper_move = Vector2(0.0, 0.0)
	var bumper_pos = get_pos()
	
	if(Input.is_action_pressed("move_left") and bumper_pos.x > (0 + bumper_size.x * 0.5)):
		bumper_move.x = -4.0
	if(Input.is_action_pressed("move_right") and bumper_pos.x < (screen_size.x - bumper_size.x * 0.5)):
		bumper_move.x = 4.0
	move(bumper_move)
