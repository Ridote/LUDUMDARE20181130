extends "res://Entities/Characters/Character.gd"

func _ready():
	add_to_group(Constants.G_ENEMY)

func _physics_process(_delta):
	process_collisions()

func process_collisions():
	var collider = null
	for i in range($body.get_slide_count()):
		collider = $body.get_slide_collision(i).get_collider().get_parent()
		if(collider.is_in_group(Constants.G_AMOEBA)):
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