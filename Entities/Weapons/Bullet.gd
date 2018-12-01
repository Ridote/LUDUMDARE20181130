extends Node2D
var damage : float
var speed : float
var penetration : float

var bulletType = Constants.BULLET_TYPE.STANDARD

func setBulletType(_bulletType):
	bulletType = _bulletType
	$AnimationPlayer.play(Constants.BULLET_TYPE_ANIM[_bulletType])
	
	var attrs = Constants.BULLET_ATTRIBUTES[_bulletType]
	damage = attrs["Damage"]
	speed = attrs["Speed"]
	penetration = attrs["Penetration"]
	
func _physics_process(_delta):
	pass
