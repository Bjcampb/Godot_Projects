extends RigidBody2D



func _ready():
	set_fixed_process(true)


func _fixed_process(delta):
	var collisions = get_colliding_bodies() # Returns array of all bodies it collides with
	
	for body in collisions:
		if body.is_in_group("bricks"):
			body.queue_free()