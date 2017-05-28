extends Node2D

onready var ball_resource = preload("res://Scenes/ball.tscn")
onready var bumper_resource = preload("res://Scenes/bumper.tscn")

var score = 0 setget set_score
var lives = 3 setget set_lives

func _ready():
	
	var ball = ball_resource.instance()
	var bumper = bumper_resource.instance()
	add_child(ball)
	add_child(bumper)
	
	ball.set_pos(Vector2(320,250))
	bumper.set_pos(Vector2(320,350))

func set_score(value):
	score = value
	get_node("Score").set_text("Score: " + str(score))

func set_lives(value):
	lives = value
	get_node("Lives").set_text("Lives: " + str(lives))
