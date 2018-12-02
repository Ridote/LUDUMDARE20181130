extends Node2D
var damage : float
var speed : float
var penetration : float

var bulletType = Constants.BULLET_TYPE.STANDARD
var direction : Vector2 = Vector2()
func _ready():
	add_to_group(Constants.G_BULLET)

func _physics_process(_delta):
	$body.apply_impulse(Vector2(0,0), direction*speed*Constants.bullet_speed_amplification)

func init(_bulletType, position : Vector2, parent : Object) -> void:
	$body.global_position = position
	$body.rotation = parent.getOrientation()

	#We update the masks and layers for collisions depending on the parent
	if(parent.is_in_group(Constants.G_WEAPON_ENEMY)):
		$body.collision_layer = 8 #I am bullet enemy
		$body.collision_mask = 1 | 16 #I crash into player and walls
		add_to_group(Constants.G_BULLET_ENEMY)
	elif(parent.is_in_group(Constants.G_WEAPON_PLAYER)):
		$body.collision_layer = 4 #I am bullet player
		$body.collision_mask = 2 | 16#I crash into enemy
		add_to_group(Constants.G_BULLET_PLAYER)
	else:
		OS.alert(get_name() + " init: Parent is not a weapon", "Implementation error")

	#We need to create the bullet depending on the type with specific attributes
	bulletType = _bulletType
	$AnimationPlayer.play(Constants.BULLET_TYPE_ANIM[_bulletType])
	var attrs = Constants.BULLET_ATTRIBUTES[_bulletType]
	damage = attrs["Damage"]
	speed = attrs["Speed"]
	penetration = attrs["Penetration"]

	#We set the direction depending on the rotation
	direction.x = cos($body.rotation)
	direction.y = sin($body.rotation)

func _on_body_body_entered(body):
	
	print("I am a bullet and I fucking collided beibi, with " + body.get_parent().get_name())
	queue_free()

func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	queue_free()