extends Node2D

onready var ball_resource = preload("res://Scenes/ball.tscn")
onready var bumper_resource = preload("res://Scenes/bumper.tscn")

func _ready():
	
	var ball = ball_resource.instance()
	var bumper = bumper_resource.instance()
	add_child(ball)
	add_child(bumper)
	
	ball.set_pos(Vector2(320,250))
	bumper.set_pos(Vector2(320,350))
