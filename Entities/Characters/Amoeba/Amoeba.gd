extends Node2D


const WALK_SPEED = 250
const FLOOR_NORMAL = Vector2(0, 1)
const SLOPE_SLIDE_STOP = 25.0

var linear_vel = Vector2()

var parent : Object = null
var bEat : bool = false
var direction : Vector2 = Vector2(0,0)

func _ready():
	add_to_group(Constants.G_AMOEBA)

func init(_parent : Object):
	parent = _parent

func _physics_process(delta):
	if !bEat:
		return
	move(delta, $body)
	process_collisions()

func eat(_direction : Vector2, position : Vector2):
	bEat = true
	direction = _direction
	$body.global_position = position
	$AmoebaOnAir.start()

func move(_delta : float, body : KinematicBody2D):
	linear_vel = WALK_SPEED*direction
	linear_vel = body.move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)

func process_collisions():
	var collider = null
	for i in range($body.get_slide_count()):
		collider = $body.get_slide_collision(i).get_collider().get_parent()
		if(collider.is_in_group(Constants.G_ENEMY)):
			$AmoebaOnAir.stop()
			bEat = false
			
			parent.setEnemyStats(collider.HP, collider.character, collider.getRightWeapon(), collider.getLeftWeapon(), collider.getGlobalPosition(), collider.getOrientation())
			collider.queue_free()
			parent.goVisibleAndGrabAmoeba()
			
			
			
func activateCamera():
	$body/Camera2D.current = true

func setPosition(position : Vector2):
	$body.position = position
func setRotation(rotation : float):
	$body.rotation = rotation

func _on_AmoebaOnAir_timeout():
	print("Should die")
