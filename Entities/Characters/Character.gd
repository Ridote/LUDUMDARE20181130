#warnings-disable
extends Node2D

const WALK_SPEED = 50
const FLOOR_NORMAL = Vector2(0, 1)
var SLOPE_SLIDE_STOP = 25.0
var SIDING_CHANGE_SPEED = 10

var STOP_FACTOR = 25

var EXTERNAL_IMPULSE = 4000
var IMPULSE_MITIGATION_FACTOR = 2

var MAX_SPEED_AND_IMPULSE = 400

var linear_vel = Vector2()
var target_vel = Vector2()

var externalImpulse = Vector2()

var character = Constants.PLAYER_TYPE.RED
var HP : float = 100.0
var maxHP : float = 100.0
var stamina : float = 100.0
var maxStamina : float = 100.0
var armor : int = 3
var speed = 5 # pixels/sec

func _ready():
	add_to_group(Constants.G_CHARACTER)

func move(_delta : float, body : KinematicBody2D):
	target_vel *= speed*WALK_SPEED
	linear_vel.x = lerp(linear_vel.x, target_vel.x + externalImpulse.x, 0.1)
	linear_vel.y = lerp(linear_vel.y, target_vel.y + externalImpulse.y, 0.1)
	
	#We clamp the linear velocity
	linear_vel = linear_vel.clamped(MAX_SPEED_AND_IMPULSE)
	linear_vel = body.move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)
	externalImpulse /= IMPULSE_MITIGATION_FACTOR


func getMousePosition():
	return get_global_mouse_position()
func getGlobalPosition() -> Vector2:
	OS.alert(get_name() + " getGlobalPosition not implemented", "Implementation error")
	return Vector2()
func getOrientation() -> float:
	OS.alert(get_name() + " getOrientation not implemented", "Implementation error")
	return 0.0
func receiveDmg(val : float = 1.0) -> void:
	OS.alert(get_name() + " receiveDmg not implemented", "Implementation error")
func shoot() -> void:
	OS.alert(get_name() + " shoot not implemented", "Implementation error")
func getWeapon() -> Object:
	OS.alert(get_name() + " getWeapon not implemented", "Implementation error")
	return Object()
func die() -> void:
	OS.alert(get_name() + " die not implemented", "Implementation error")