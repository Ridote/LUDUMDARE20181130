extends "res://Entities/Characters/Character.gd"
var weaponFactory = preload("res://Entities/Weapons/Weapon.tscn")

var distanceToMove : float = 200.0

func _ready():
	add_to_group(Constants.G_ENEMY)
	
	#This is how we create a wepon. Feel free to put this in a function if you don't like it like this, cause you probably will use it in different places
	var leftWeapon = weaponFactory.instance()
	$body/LeftWeapon.add_child(leftWeapon)
	leftWeapon.init(Constants.WEAPON_TYPE.PISTOL, self)

func _physics_process(delta):
	process_collisions()
	var player = get_tree().get_root().get_node("Main/Player")
	if(player != null):
		var playerPos = player.getGlobalPosition()
		$body.look_at(playerPos)
		if(playerPos.distance_to($body.global_position) > distanceToMove):
			target_vel = (playerPos - $body.global_position).normalized()
			move(delta, $body)
		else:
			attack()

func attack():
	var leftWep = $body/LeftWeapon.get_children()
	if leftWep.size() > 0:
		leftWep[0].attack()
	var rightWep = $body/RightWeapon.get_children()
	if rightWep.size() > 0:
		rightWep[0].attack()

func process_collisions():
	var collider = null
	for i in range($body.get_slide_count()):
		collider = $body.get_slide_collision(i).get_collider().get_parent()
		if(collider != null && collider.is_in_group(Constants.G_AMOEBA)):
			print("Player collision!!")

func getRightWeapon() -> Object:
	if($body/RightWeapon.get_child_count() > 0):
		var weapon = $body/RightWeapon.get_child(0)
		$body/RightWeapon.remove_child(weapon)
		return weapon
	else:
		return null

func getLeftWeapon():
	if($body/LeftWeapon.get_child_count() > 0):
		var weapon = $body/LeftWeapon.get_child(0)
		$body/LeftWeapon.remove_child(weapon)
		return weapon
	else:
		return null

func getOrientation() -> float:
	return $body.rotation
	
func getGlobalPosition() -> Vector2:
	return $body.global_position