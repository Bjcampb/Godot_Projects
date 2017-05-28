extends KinematicBody2D

var screen_size

var INITIAL_BALL_SPEED = 80
var ball_speed = INITIAL_BALL_SPEED
var move_vector = Vector2(0.0, 2.0)

func _ready():
	screen_size = get_viewport_rect().size
	set_process(true)


func _process(delta):
	var lives = get_node("/root/main").lives
	# Ball bounces off walls
	var ball_pos = get_pos()
	
	if((ball_pos.x < 0 and move_vector.x < 0) or (ball_pos.x > screen_size.x and move_vector.x > 0)):
		move_vector.x = -move_vector.x
		get_node("../ball/Sounds").play("wall_hit")
	if((ball_pos.y < 0 and move_vector.y < 0)):
		move_vector.y = -move_vector.y
		get_node("../ball/Sounds").play("wall_hit")
	
	# Check Game Over
	if((ball_pos.y > screen_size.y and move_vector.y > 0)):
		if(lives > 0):
			get_node("/root/main").lives -= 1
			set_pos(Vector2(320,250))
			move_vector = Vector2(0.0, 1.0)
	
	
	
	# Handle Collisions with objects
	if is_colliding () : # This recognizes if a collision is happening
		var collider = get_collider()
		if collider.is_in_group("bumper"):
			get_node("../ball/Sounds").play("bumper_hit")
			var bumper_pos = collider.get_pos()
			var bumper_size = collider.get_child(1).get_shape().get_extents()
			var bumper_ball_pos = get_collision_pos()
			move_vector.y *= -1.5
			
			# Vary x recoil of ball based on where ball hits bumper
			if(bumper_ball_pos.x > (bumper_pos.x + (bumper_size.x * 0.3)) and move_vector.x < 0):
				move_vector.x *= -1.1
			if(bumper_ball_pos.x > (bumper_pos.x + (bumper_size.x * 0.3)) and move_vector.x == 0):
				move_vector.x += 2.0
			if(bumper_ball_pos.x < (bumper_pos.x - (bumper_size.x * 0.3)) and move_vector.x > 0):
				move_vector.x *= -1.1
			if(bumper_ball_pos.x < (bumper_pos.x - (bumper_size.x * 0.3)) and move_vector.x == 0):
				move_vector.x -= 2.0
			if((bumper_ball_pos.x > (bumper_pos.x - (bumper_size.x * 0.3)) and bumper_ball_pos.x < (bumper_pos.x + (bumper_size.x * 0.3)))):
				move_vector.x = 0.0
		
		if collider.is_in_group("red_brick"):
			get_node("/root/main").score += 5
			get_node("../ball/Sounds").play("brick_hit")
			collider.get_child(2).play("Crush")
			
			#collider.queue_free()
			move_vector.y *= -1.1
	
	move(move_vector)