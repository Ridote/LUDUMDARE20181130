extends Node2D

var graphics = [preload("res://Graphics/Intro/black-hole.png"),
	preload("res://Graphics/Intro/meteor-1.png"),
	preload("res://Graphics/Intro/meteor-2.png"),
	preload("res://Graphics/Intro/meteor-3.png"),
	preload("res://Graphics/Intro/meteor-4.png"),
	preload("res://Graphics/Intro/meteor-5.png"),
	preload("res://Graphics/Intro/moon.png"),
	preload("res://Graphics/Intro/planet-1.png"),
	preload("res://Graphics/Intro/planet-2.png")]

const speedRange = [250, 500]
const deviationRange = [250, 500]
var speed = 0
var deviation = 5
var win_size = Vector2(0,0)
var start = false

func _ready():
	randomize()
	$body/Sprite.set_texture(graphics[randi()%graphics.size()])
	#win_size = OS.window_size
	win_size = get_viewport().size
	speed = (randi()%(speedRange[1]-speedRange[0])) + speedRange[0]
	deviation = ((randi()%(deviationRange[1]-deviationRange[0])) + deviationRange[0]) - deviationRange[0]
	
func initialise(leftSpawn, rightSpawn):
	$body.global_position = Vector2(randf()*(rightSpawn.global_position.x-leftSpawn.global_position.x) + leftSpawn.global_position.x, leftSpawn.global_position.y)
	start = true
	
func _physics_process(_delta):
	if !start:
		return
	
	$body.move_and_slide(Vector2(deviation, speed))
	#For some reason visibility notifier was messing with me
	if($body.global_position.x < 0
	|| $body.global_position.x > win_size.x
	|| $body.global_position.y > win_size.y
	):
		queue_free()