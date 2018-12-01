extends Node2D

var bulletFactory = "res://Entities/Weapons/Bullet.tscn"

var reloadTime : float = 1.0
var magazineSize: int = 1.0
var bullets : int = 0
var weaponType = Constants.WEAPON_TYPE.PISTOL
var bulletType = Constants.BULLET_TYPE.STANDARD

func _ready():
	add_to_group(Constants.G_WEAPON)

func init(_weaponType, position : Vector2, parent : Object) -> void:
	$body.position = position
	$body.rotation = parent.getOrientation()
	
	#We update the group depending on if the parent is an enemy or a player
	if(parent.is_in_group(Constants.G_ENEMY)):
		add_to_group(Constants.G_WEAPON_ENEMY)
	elif(parent.is_in_group(Constants.G_PLAYER)):
		add_to_group(Constants.G_WEAPON_PLAYER)
	else:
		OS.alert(get_name() + " init: Parent is not an enemy or a player", "Implementation error")
	
	#We need to create the weapon depending on the type with specific attributes
	weaponType = _weaponType

	$AnimationPlayer.play(Constants.WEAPON_TYPE_ANIM[_weaponType])
	var attrs = Constants.WEAPON_TYPE_ANIM[_weaponType]
	
	reloadTime = attrs["ReloadTime"]
	magazineSize = attrs["MagazineSize"]
	bulletType = attrs["BulletType"]

func attack() -> void:
	if bullets <= 0:
		reload()
		return
	var bullet = bulletFactory.instance()
	bullet.init(bulletType, $FireCannon.global_position, self)
	bullets -= 1

func reload() -> void:
	bullets = magazineSize
	#TODO Play animation sound